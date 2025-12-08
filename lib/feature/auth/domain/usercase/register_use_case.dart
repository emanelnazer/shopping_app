import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/registerRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/register_entity.dart';
import 'package:shopping_app/feature/auth/domain/repo/repesitory/auth_repo.dart';

class RegisterUseCase {
  RegisterUseCase(this._authRepoo);
  final AuthRepo _authRepoo;

  Future<ResultAPI<RegisterEntities>> call(RegisterRequestEntities requestt) =>
      _authRepoo.RegisterAuth(requestt);
}
