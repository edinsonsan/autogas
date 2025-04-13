// import 'package:autogas/src/presentation/page/auth/login/login_content.dart';
import 'package:autogas/src/config/theme/app_theme.dart';
// import 'package:autogas/src/presentation/page/auth/forgot_password/forgot_password.dart';
import 'package:autogas/src/presentation/page/auth/login/login_content.dart';
// import 'package:autogas/src/presentation/page/auth/login/login_content.dart';
// import 'package:autogas/src/presentation/page/auth/register/register_content.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(isDarkmode: false).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const LoginContent(),
    );
  }
}