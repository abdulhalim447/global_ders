import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// Auth service for handling authentication API calls
class AuthService {
  static const String _baseUrl = 'https://app.global-ders.com/global_ders';

  /// Register a new user
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    String? profileImagePath,
  }) async {
    try {
      final url = Uri.parse('$_baseUrl/register.php');

      // Create multipart request
      final request = http.MultipartRequest('POST', url);

      // Add text fields
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['password'] = password;

      // Add image file if provided
      if (profileImagePath != null && profileImagePath.isNotEmpty) {
        final file = File(profileImagePath);
        if (await file.exists()) {
          final multipartFile = await http.MultipartFile.fromPath(
            'profile_image',
            profileImagePath,
          );
          request.files.add(multipartFile);
        }
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthResponse(
          success: true,
          message: data['message'] ?? 'Registration successful',
          data: data,
        );
      } else {
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Registration failed',
          data: data,
        );
      }
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Network error: ${e.toString()}',
        data: null,
      );
    }
  }

  /// Login user
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('$_baseUrl/login.php');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return AuthResponse(
          success: true,
          message: 'Login successful',
          data: data,
        );
      } else {
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Login failed',
          data: data,
        );
      }
    } catch (e) {
      return AuthResponse(
        success: false,
        message: 'Network error: ${e.toString()}',
        data: null,
      );
    }
  }
}

/// Auth response model
class AuthResponse {
  final bool success;
  final String message;
  final dynamic data;

  AuthResponse({required this.success, required this.message, this.data});
}
