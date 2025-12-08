import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/loginRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/login_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/registerRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/register_entity.dart';

abstract class AuthRepo {
  Future<ResultAPI<LoginEntites>> loginAuth(LoginRequestEntities requst);
  Future<ResultAPI<RegisterEntities>> RegisterAuth(
      RegisterRequestEntities requstt);
}
