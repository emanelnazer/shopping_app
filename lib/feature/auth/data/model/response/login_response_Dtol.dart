import 'package:shopping_app/feature/auth/domain/entites/login_entity.dart';

class LoginResponseDto {
  String? accessToken;
  String? refreshToken;

  LoginResponseDto({this.accessToken, this.refreshToken});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
  LoginEntites toEntity() => LoginEntites(
      accessToken: accessToken ?? '', refreshToken: refreshToken ?? '');
}
