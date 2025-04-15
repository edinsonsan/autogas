import 'package:autogas/bloc_providers.dart';
import 'package:autogas/src/config/router/app_router.dart';
import 'package:autogas/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      // create: (context) => LoginBloc()..add(LoginInitEvent()),
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: AppTheme(isDarkmode: true, selectedColor: 4).getTheme(),
        debugShowCheckedModeBanner: false,
        title: 'AuTogas',
      ),
    );
  }
}
