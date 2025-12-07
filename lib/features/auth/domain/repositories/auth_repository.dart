import '../entities/user.dart';

/// Authentication repository interface
abstract class AuthRepository {
  /// Login with email and password
  Future<User> login(String email, String password);

  /// Register a new user
  Future<User> register(String name, String email, String password);

  /// Logout current user
  Future<void> logout();

  /// Get current user
  Future<User?> getCurrentUser();

  /// Check if user is logged in
  Future<bool> isLoggedIn();
}
