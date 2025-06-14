import 'package:flutter/material.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/forget_password.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/login_screen.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/register_screen.dart';
import 'package:handora_e_commerce/Features/Home/presentation/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName:(_)=> const LoginScreen(),
        RegisterScreen.routeName:(_)=>const RegisterScreen(),
        ForgetPassword.routeName:(_)=>const ForgetPassword(),
        HomeScreen.routeName:(_)=>HomeScreen(),
      },
      initialRoute: RegisterScreen.routeName,
    );
  }
}
