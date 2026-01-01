import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/auth_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:shopping_app/feature/auth/domain/repo/repesitory/auth_repo.dart';

class AuthRepoimpl implements AuthRepo {
  AuthRepoimpl(this._authDataSource);
  final AuthDataSource _authDataSource;

  @override
  Future<ResultAPI<AuthEntity>> register(
          {required String name,
          required String email,
          required String password,
          String? avatar}) =>
      _authDataSource.register(name: name, email: email, password: password);

  @override
  Future<ResultAPI<AuthEntity>> login(
          {required String email, required String password}) =>
      _authDataSource.login(email: email, password: password);
}
