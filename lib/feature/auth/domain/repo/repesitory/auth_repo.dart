import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:shopping_app/feature/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:shopping_app/feature/auth/domain/entites/auth_entity.dart';

abstract class AuthRepo {
  Future<ResultAPI<AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<ResultAPI<AuthEntity>> register({
    required String name,
    required String email,
    required String password,
  });
}

AuthRepo injectAuthRepo = AuthRepoimpl(injectAuthDataSourceImp);
