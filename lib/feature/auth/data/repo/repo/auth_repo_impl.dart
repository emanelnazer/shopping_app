import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/loginRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/login_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/registerRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/register_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:shopping_app/feature/auth/domain/repo/repesitory/auth_repo.dart';

class AuthRepoimpl implements AuthRepo {
  AuthRepoimpl(this._authDataSource);
  final AuthDataSource _authDataSource;

  @override
  Future<ResultAPI<RegisterEntities>> RegisterAuth(
          RegisterRequestEntities requstt) =>
      _authDataSource.RegisterAuth(requstt);

  @override
  Future<ResultAPI<LoginEntites>> loginAuth(LoginRequestEntities requst) =>
      _authDataSource.loginAuth(requst);

  /*
  @override
  Future<ResultAPI<RegisterResponseDto>> RegisterAuth(
          RegisterRequestDto requstt) =>
      _authDataSource.RegisterAuth(requstt);

  @override
  Future<ResultAPI<LoginResponseDto>> loginAuth(LoginRequestDto requst) =>
      _authDataSource.loginAuth(requst);*/
}
