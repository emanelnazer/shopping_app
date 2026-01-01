import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/auth_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/repesitory/auth_repo.dart';

class LoginUseCase {
  LoginUseCase(this._authRepo);
  final AuthRepo _authRepo;

  Future<ResultAPI<AuthEntity>> call(String email, String password) =>
      _authRepo.login(email: email, password: password);
}

LoginUseCase injectableloginUseCase() => LoginUseCase(injectAuthRepo);
