class AuthEntity {
  final String? accessToken;
  final String? refreshToken;
  final int id;
  final String email;
  final String name;
  final String role;
  final String avatar;

  const AuthEntity({
    this.accessToken,
    this.refreshToken,
    this.id = 0,
    this.email = "",
    this.name = "",
    this.role = "",
    this.avatar = "",
  });
}
