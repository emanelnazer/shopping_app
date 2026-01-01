import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/auth_entity.dart';
import 'package:shopping_app/feature/auth/domain/usercase/login_use_case.dart';
import 'package:shopping_app/feature/auth/domain/usercase/register_use_case.dart';
import 'package:shopping_app/feature/auth/presenation/view_model/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase, this._registerUseCase) : super(IntialState());

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthEntity? user;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoadingState());

    final result = await _loginUseCase(email, password);

    switch (result) {
      case SuccessAPI<AuthEntity>():
        user = result.data;
        emit(SucessState());
        break;

      case ErrorAPI<AuthEntity>():
        emit(ErrorSate(result.messageError));
        break;

      default:
        emit(ErrorSate("Unexpected result"));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(LoadingState());

    final result =
        await _registerUseCase(name: name, email: email, password: password);

    switch (result) {
      case SuccessAPI<AuthEntity>():
        user = result.data;
        emit(SucessState());
        break;

      case ErrorAPI<AuthEntity>():
        emit(ErrorSate(result.messageError));
        break;

      default:
        emit(ErrorSate("Unexpected result"));
    }
  }
}
