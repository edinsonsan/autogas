import 'package:autogas/bloc_providers.dart';
import 'package:autogas/config/config.dart';
import 'package:autogas/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Environment.initEnvironment();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print(Environment.apiUrl);
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
