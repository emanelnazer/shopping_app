import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/data/api/auth_api.dart';
import 'package:shopping_app/feature/auth/data/model/request/login_request_Dto.dart';
import 'package:shopping_app/feature/auth/data/model/request/register_request_Dto.dart';
import 'package:shopping_app/feature/auth/data/model/response/login_response_Dtol.dart';
import 'package:shopping_app/feature/auth/data/model/response/register_response_Dto.dart';
import 'package:shopping_app/feature/auth/domain/entites/auth_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/data_source/auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {
  AuthDataSourceImpl(this._authApi);
  final AuthApi _authApi;

  @override
  Future<ResultAPI<AuthEntity>> register(
      {required String name,
      required String email,
      required String password,
      String? avatar}) async {
    final regresult = await _authApi.RegisterAuth(
      RegisterRequestDto(
          name: name, email: email, password: password, avatar: avatar),
    );
    switch (regresult) {
      case SuccessAPI<RegisterResponseDto>():
        return SuccessAPI<AuthEntity>(data: regresult.data!.toEntity());
      case ErrorAPI<RegisterResponseDto>():
        return ErrorAPI(messageError: regresult.toString());
    }
  }

  @override
  Future<ResultAPI<AuthEntity>> login(
      {required String email, required String password}) async {
    final loginresult = await _authApi
        .loginAuth(LoginRequestDto(email: email, password: password));
    switch (loginresult) {
      case SuccessAPI<LoginResponseDto>():
        return SuccessAPI<AuthEntity>(data: loginresult.data!.toEntity());
      case ErrorAPI<LoginResponseDto>():
        return ErrorAPI<AuthEntity>(messageError: loginresult.toString());
    }
  }
}

AuthDataSource injectAuthDataSourceImp = AuthDataSourceImpl(injectAuthApi());
