import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/auth_entity.dart';

abstract class AuthDataSource {
  Future<ResultAPI<AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<ResultAPI<AuthEntity>> register({
    required String name,
    required String email,
    required String password,
    String? avatar,
  });
}
