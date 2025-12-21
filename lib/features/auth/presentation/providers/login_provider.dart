import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_model.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/auth_storage_service.dart';
import 'signup_provider.dart';

/// Provider for AuthStorageService
final authStorageServiceProvider = Provider<AuthStorageService>((ref) {
  return AuthStorageService();
});

/// State for login
class LoginState {
  final bool isLoading;
  final String? error;
  final String? successMessage;
  final UserModel? user;

  LoginState({
    this.isLoading = false,
    this.error,
    this.successMessage,
    this.user,
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
    String? successMessage,
    UserModel? user,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      successMessage: successMessage,
      user: user ?? this.user,
    );
  }
}

/// Login notifier
class LoginNotifier extends StateNotifier<LoginState> {
  final AuthService _authService;
  final AuthStorageService _authStorageService;

  LoginNotifier(this._authService, this._authStorageService)
    : super(LoginState());

  /// Login user
  Future<bool> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, error: null, successMessage: null);

    try {
      final response = await _authService.login(
        email: email,
        password: password,
      );

      if (response.success && response.data != null) {
        // Parse user data from response
        final userData = response.data as Map<String, dynamic>;
        final user = UserModel.fromJson(userData);

        // Save user data to local storage
        await _authStorageService.saveUser(user);

        state = state.copyWith(
          isLoading: false,
          successMessage: response.message,
          user: user,
        );
        return true;
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Login failed: ${e.toString()}',
      );
      return false;
    }
  }

  /// Check if user is already logged in
  Future<bool> checkLoginStatus() async {
    try {
      final isLoggedIn = await _authStorageService.isLoggedIn();
      if (isLoggedIn) {
        final user = await _authStorageService.getUser();
        if (user != null) {
          state = state.copyWith(user: user);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Logout user
  Future<void> logout() async {
    await _authStorageService.clearUser();
    state = LoginState();
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Clear success message
  void clearSuccess() {
    state = state.copyWith(successMessage: null);
  }
}

/// Login provider
final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final authService = ref.watch(authServiceProvider);
  final authStorageService = ref.watch(authStorageServiceProvider);
  return LoginNotifier(authService, authStorageService);
});

/// Provider to check if user is logged in
final isLoggedInProvider = FutureProvider<bool>((ref) async {
  final authStorageService = ref.watch(authStorageServiceProvider);
  return await authStorageService.isLoggedIn();
});

/// Provider to get current user
final currentUserProvider = FutureProvider<UserModel?>((ref) async {
  final authStorageService = ref.watch(authStorageServiceProvider);
  return await authStorageService.getUser();
});
