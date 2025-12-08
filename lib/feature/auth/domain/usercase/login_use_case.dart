import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/loginRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/login_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/repesitory/auth_repo.dart';

class LoginUseCase {
  LoginUseCase(this._authRepo);
  final AuthRepo _authRepo;

  Future<ResultAPI<LoginEntites>> call(LoginRequestEntities requset) =>
      _authRepo.loginAuth(requset);
}
