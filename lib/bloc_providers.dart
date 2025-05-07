import 'package:autogas/features/auth/auth.dart';
import 'package:autogas/features/auth/presentation/forgot_password/bloc/forgot_bloc.dart';
import 'package:autogas/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:autogas/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
  BlocProvider<ForgotBloc>(create: (context) => ForgotBloc(),child: const ForgotPassword(),)
];
