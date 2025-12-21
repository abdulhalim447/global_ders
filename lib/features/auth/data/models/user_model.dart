import '../../domain/entities/user.dart';

/// User model for data layer
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.avatarUrl,
    super.accessToken,
  });

  /// Create UserModel from JSON (API response)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['profile_image'] as String?,
      accessToken: json['access_token'] as String?,
    );
  }

  /// Convert UserModel to JSON (for local storage)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_image': avatarUrl,
      'access_token': accessToken,
    };
  }

  /// Create User entity from UserModel
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      avatarUrl: avatarUrl,
      accessToken: accessToken,
    );
  }

  /// Create UserModel from User entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      avatarUrl: user.avatarUrl,
      accessToken: user.accessToken,
    );
  }
}
