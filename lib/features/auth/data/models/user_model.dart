import '../../domain/entities/user.dart';

/// User model for data layer
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.avatarUrl,
  });

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  /// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'avatarUrl': avatarUrl};
  }

  /// Create User entity from UserModel
  User toEntity() {
    return User(id: id, name: name, email: email, avatarUrl: avatarUrl);
  }

  /// Create UserModel from User entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      avatarUrl: user.avatarUrl,
    );
  }
}
