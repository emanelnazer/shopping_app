import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/data/api/auth_api.dart';
import 'package:shopping_app/feature/auth/data/model/request/login_request_Dto.dart';
import 'package:shopping_app/feature/auth/data/model/request/register_request_Dto.dart';
import 'package:shopping_app/feature/auth/data/model/response/login_response_Dtol.dart';
import 'package:shopping_app/feature/auth/data/model/response/register_response_Dto.dart';
import 'package:shopping_app/feature/auth/domain/entites/loginRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/login_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/registerRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/register_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/data_source/auth_data_source.dart';

class AuthDataSourceImpl extends AuthDataSource {
  AuthDataSourceImpl(this._authApi);
  final AuthApi _authApi;

  @override
  Future<ResultAPI<RegisterEntities>> RegisterAuth(
      RegisterRequestEntities requstt) async {
    final regresult = await _authApi.RegisterAuth(
      RegisterRequestDto(
        name: requstt.name,
        email: requstt.email,
        password: requstt.password,
      ),
    );
    switch (regresult) {
      case SuccessAPI<RegisterResponseDto>():
        return SuccessAPI<RegisterEntities>(data: regresult.data!.toEntity());
      case ErrorAPI<RegisterResponseDto>():
        return ErrorAPI(messageError: regresult.toString());
    }
  }

  @override
  Future<ResultAPI<LoginEntites>> loginAuth(LoginRequestEntities requst) async {
    final loginresult = await _authApi.loginAuth(requst as LoginRequestDto);
    switch (loginresult) {
      case SuccessAPI<LoginResponseDto>():
        return SuccessAPI<LoginEntites>(data: loginresult.data!.toEntity());
      case ErrorAPI<LoginResponseDto>():
        return ErrorAPI(messageError: loginresult.toString());
    }
  }
}
