import 'package:autogas/src/config/theme/app_theme.dart';
import 'package:autogas/src/presentation/page/auth/auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(isDarkmode: true,selectedColor: 4).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const RegisterContent(),
    );
  }
}