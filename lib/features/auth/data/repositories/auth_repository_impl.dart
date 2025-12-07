import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  // TODO: Add data sources (remote/local) as dependencies

  @override
  Future<User> login(String email, String password) async {
    // TODO: Implement login logic with API call
    throw UnimplementedError('Login not implemented yet');
  }

  @override
  Future<User> register(String name, String email, String password) async {
    // TODO: Implement registration logic with API call
    throw UnimplementedError('Register not implemented yet');
  }

  @override
  Future<void> logout() async {
    // TODO: Implement logout logic
    throw UnimplementedError('Logout not implemented yet');
  }

  @override
  Future<User?> getCurrentUser() async {
    // TODO: Implement get current user logic
    throw UnimplementedError('Get current user not implemented yet');
  }

  @override
  Future<bool> isLoggedIn() async {
    // TODO: Implement is logged in check
    throw UnimplementedError('Is logged in check not implemented yet');
  }
}
