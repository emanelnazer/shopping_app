import 'package:shopping_app/core/utils/app_theme.dart';
import 'package:shopping_app/feature/app_section/app_section.dart';
import 'package:shopping_app/feature/auth/presenation/view/login_screen.dart';
import 'package:shopping_app/feature/auth/presenation/view/register_screen.dart';
import 'package:shopping_app/feature/home/presentation/view/home_screen.dart';
import 'package:shopping_app/feature/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User App",

      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AppSection.routeName: (context) => const AppSection(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: Apptheme.light,
      darkTheme: Apptheme.dark,
      themeMode: ThemeMode.light,
    );
  }
}
