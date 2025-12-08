import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/common/widget/custom_form_text_fiel.dart';
import 'package:shopping_app/core/dialogs/app_dialogs.dart';
import 'package:shopping_app/core/dialogs/app_toasts.dart';
import 'package:shopping_app/core/utils/validator_functions.dart';
import 'package:shopping_app/feature/app_section/app_section.dart';
import 'package:shopping_app/feature/auth/data/api/auth_api.dart';
import 'package:shopping_app/feature/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:shopping_app/feature/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:shopping_app/feature/auth/domain/entites/registerRequset_entity.dart';
import 'package:shopping_app/feature/auth/domain/usercase/register_use_case.dart';
import 'package:shopping_app/feature/auth/presenation/view/login_screen.dart';
import 'package:shopping_app/feature/auth/presenation/view_model/auth_cubit.dart';
import 'package:shopping_app/feature/auth/presenation/view_model/auth_state.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late AuthCubit cubit;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    final authRepo = AuthRepoimpl(AuthDataSourceImpl(AuthApi()));
    final registerUseCase = RegisterUseCase(authRepo);
    cubit = AuthCubit(registerUseCase: registerUseCase); // فقط registerUseCase
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SignUp",
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
            Navigator.pop(context);
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
                  "Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                  controller: nameController,
                  validator: Validator.validateName,
                  hintText: "Enter your name",
                  keyboardType: TextInputType.name,
                  action: TextInputAction.next,
                ),
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
                  validator: Validator.validatePassword,
                  hintText: "Enter your password",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  action: TextInputAction.next,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  validator: (value) => Validator.validateConfirmPassword(
                      value, passwordController.text),
                  hintText: "Enter your confirm password",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  color: const Color(0xff212121),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        print("Before register call");
                        await cubit.register(RegisterRequestEntities(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                        print("After register call");
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      } catch (e, st) {
                        print("Register Exception: $e");
                        print(st);
                      }
                    }
                  },
                  child: const Text(
                    "Sign up",
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
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff6E6A7C),
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
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
