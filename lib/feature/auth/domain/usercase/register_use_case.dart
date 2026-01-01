import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/auth_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/repesitory/auth_repo.dart';

class RegisterUseCase {
  RegisterUseCase(this._authRepoo);
  final AuthRepo _authRepoo;

  Future<ResultAPI<AuthEntity>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return _authRepoo.register(name: name, email: email, password: password);
  }
}

RegisterUseCase injectableregisterUseCase() => RegisterUseCase(injectAuthRepo);
