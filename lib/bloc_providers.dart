import 'package:autogas/core/usesCases/auth/auth_usescases.dart';
import 'package:autogas/features/auth/auth.dart';
import 'package:autogas/features/auth/presentation/forgot_password/bloc/forgot_bloc.dart';
import 'package:autogas/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:autogas/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:autogas/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUsescases>())),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(locator<AuthUsescases>())),
  BlocProvider<ForgotBloc>(create: (context) => ForgotBloc(locator<AuthUsescases>()), child: const ForgotPassword(),)
];
