/// User entity for authentication
class User {
  final int id;
  final String name;
  final String email;
  final String? avatarUrl;
  final String? accessToken;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.accessToken,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.avatarUrl == avatarUrl &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatarUrl.hashCode ^
        accessToken.hashCode;
  }
}
