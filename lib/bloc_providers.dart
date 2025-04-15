import 'package:autogas/src/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:autogas/src/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
];
