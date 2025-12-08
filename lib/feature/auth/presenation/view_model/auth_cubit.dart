import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network/result_api.dart';
import 'package:shopping_app/feature/auth/domain/entites/loginRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/login_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/registerRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/entites/register_entity.dart';
import 'package:shopping_app/feature/auth/domain/usercase/login_use_case.dart';
import 'package:shopping_app/feature/auth/domain/usercase/register_use_case.dart';
import 'package:shopping_app/feature/auth/presenation/view_model/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({LoginUseCase? loginUseCase, RegisterUseCase? registerUseCase})
      : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        super(IntialState());

  LoginEntites? token;
  RegisterEntities? datauser;

  final LoginUseCase? _loginUseCase;
  final RegisterUseCase? _registerUseCase;

  Future<void> login(LoginRequestEntities requst) async {
    if (_loginUseCase == null) return;

    emit(LoadingState());
    final result = await _loginUseCase!.call(requst);

    switch (result.runtimeType) {
      case SuccessAPI<LoginEntites>():
        token = (result as SuccessAPI<LoginEntites>).data;
        emit(SucessState());
        break;
      case ErrorAPI<LoginEntites>():
        emit(ErrorSate((result as ErrorAPI<LoginEntites>).messageError));
        break;
    }
  }

  Future<void> register(RegisterRequestEntities requstt) async {
    print("Register started"); // ← اضيفي
    emit(LoadingState());

    try {
      final resultt = await _registerUseCase!.call(requstt);
      print("Result received: $resultt"); // ← اضيفي

      switch (resultt) {
        case SuccessAPI<RegisterEntities>():
          datauser = resultt.data as RegisterEntities;
          print("Register success: $datauser"); // ← اضيفي
          emit(SucessState());
        case ErrorAPI<RegisterEntities>():
          print("Register failed: ${resultt.messageError}"); // ← اضيفي
          emit(ErrorSate(resultt.messageError));
        default:
          print("Unexpected result"); // ← اضيفي
          emit(ErrorSate("Unexpected result"));
      }
    } catch (e, st) {
      print("Exception: $e");
      print(st);
      emit(ErrorSate("Something went wrong: $e"));
    }
  }

  /* Future<void> register(RegisterRequestEntities requstt) async {
  print("Register started");

    emit(LoadingState());
    final result = await _registerUseCase!.call(requstt);

    switch (result.runtimeType) {
      case SuccessAPI<RegisterEntities>():
        datauser = (result as SuccessAPI<RegisterEntities>).data;
        emit(SucessState());
        break;
      case ErrorAPI<RegisterEntities>():
        emit(ErrorSate((result as ErrorAPI<RegisterEntities>).messageError));
        break;
    }
  }*/
}
