import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/services/auth_service.dart';

/// Provider for AuthService
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

/// Provider for ImagePicker
final imagePickerProvider = Provider<ImagePicker>((ref) {
  return ImagePicker();
});

/// State for signup
class SignupState {
  final bool isLoading;
  final String? error;
  final String? successMessage;
  final XFile? profileImage;

  SignupState({
    this.isLoading = false,
    this.error,
    this.successMessage,
    this.profileImage,
  });

  SignupState copyWith({
    bool? isLoading,
    String? error,
    String? successMessage,
    XFile? profileImage,
    bool clearImage = false,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      successMessage: successMessage,
      profileImage: clearImage ? null : (profileImage ?? this.profileImage),
    );
  }
}

/// Signup notifier
class SignupNotifier extends StateNotifier<SignupState> {
  final AuthService _authService;
  final ImagePicker _imagePicker;

  SignupNotifier(this._authService, this._imagePicker) : super(SignupState());

  /// Pick profile image from gallery
  Future<void> pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        state = state.copyWith(profileImage: image);
      }
    } catch (e) {
      state = state.copyWith(error: 'Failed to pick image: ${e.toString()}');
    }
  }

  /// Remove selected image
  void removeImage() {
    state = state.copyWith(clearImage: true);
  }

  /// Register user
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null, successMessage: null);

    try {
      final response = await _authService.register(
        name: name,
        email: email,
        password: password,
        profileImagePath: state.profileImage?.path,
      );

      if (response.success) {
        state = state.copyWith(
          isLoading: false,
          successMessage: response.message,
        );
        return true;
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Registration failed: ${e.toString()}',
      );
      return false;
    }
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

/// Signup provider
final signupProvider = StateNotifierProvider<SignupNotifier, SignupState>((
  ref,
) {
  final authService = ref.watch(authServiceProvider);
  final imagePicker = ref.watch(imagePickerProvider);
  return SignupNotifier(authService, imagePicker);
});
