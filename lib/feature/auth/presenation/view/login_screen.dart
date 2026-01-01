import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/common/widget/custom_form_text_fiel.dart';
import 'package:shopping_app/core/dialogs/app_dialogs.dart';
import 'package:shopping_app/core/dialogs/app_toasts.dart';
import 'package:shopping_app/core/utils/validator_functions.dart';
import 'package:shopping_app/feature/app_section/app_section.dart';
import 'package:shopping_app/feature/auth/domain/usercase/login_use_case.dart';
import 'package:shopping_app/feature/auth/domain/usercase/register_use_case.dart';
import 'package:shopping_app/feature/auth/presenation/view/register_screen.dart';
import 'package:shopping_app/feature/auth/presenation/view_model/auth_cubit.dart';
import 'package:shopping_app/feature/auth/presenation/view_model/auth_state.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthCubit cubit;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    //final authRepo = AuthRepoimpl(AuthDataSourceImpl(AuthApi()));
    //final loginUseCase = LoginUseCase(authRepo);
    //cubit = AuthCubit(loginUseCase: loginUseCase);
    cubit = AuthCubit(injectableloginUseCase(), injectableregisterUseCase());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff1F1F1F),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is LoadingState) {
            AppDialogs.showLoadingDialog(context);
          } else if (state is ErrorSate) {
            Navigator.pop(context); // close loading dialog
            AppToast.showToast(
              context: context,
              title: "Error",
              description: state.ErrorMessage,
              type: ToastificationType.error,
            );
          } else if (state is SucessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppSection.routeName, (route) => false);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                  controller: emailController,
                  validator: Validator.validateEmail,
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  action: TextInputAction.next,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                  controller: passwordController,
                  // validator: Validator.validatePassword,
                  hintText: "Enter your password",
                  isPassword: true,
                  keyboardType: TextInputType.text,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await cubit.login(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                  color: const Color(0xff212121),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff6E6A7C),
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff212121),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
