import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

/// Service for managing authentication data in local storage
class AuthStorageService {
  static const String _keyUser = 'user_data';
  static const String _keyAccessToken = 'access_token';
  static const String _keyIsLoggedIn = 'is_logged_in';

  /// Save user data to local storage
  Future<bool> saveUser(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = jsonEncode(user.toJson());

      await prefs.setString(_keyUser, userJson);
      await prefs.setString(_keyAccessToken, user.accessToken ?? '');
      await prefs.setBool(_keyIsLoggedIn, true);

      return true;
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  /// Get saved user data from local storage
  Future<UserModel?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_keyUser);

      if (userJson == null) return null;

      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      return UserModel.fromJson(userMap);
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_keyAccessToken);
    } catch (e) {
      print('Error getting access token: $e');
      return null;
    }
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool(_keyIsLoggedIn) ?? false;
      final accessToken = prefs.getString(_keyAccessToken);

      // User is logged in if flag is true and access token exists
      return isLoggedIn && accessToken != null && accessToken.isNotEmpty;
    } catch (e) {
      print('Error checking login status: $e');
      return false;
    }
  }

  /// Clear all user data (logout)
  Future<bool> clearUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove(_keyUser);
      await prefs.remove(_keyAccessToken);
      await prefs.setBool(_keyIsLoggedIn, false);

      return true;
    } catch (e) {
      print('Error clearing user data: $e');
      return false;
    }
  }

  /// Update user data
  Future<bool> updateUser(UserModel user) async {
    return await saveUser(user);
  }
}
