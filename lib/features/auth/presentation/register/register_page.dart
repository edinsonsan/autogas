import 'package:autogas/features/auth/auth.dart';
import 'package:autogas/features/auth/data/data.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  static const String name = 'register_page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    void snackBar(BuildContext context, String errorMessage) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        final response = state.response;
        if (response is ErrorData) {
          snackBar(context, response.message);
        } else if (response is Success) {
            snackBar(context, 'Registro Exitoso');
            print('Success DATA REGISTER: ${response.data}');

            late final AuthResponse authResponse;

            if (response.data is AuthResponseModel) {
              authResponse = (response.data as AuthResponseModel).toEntity();
            } else if (response.data is AuthResponse) {
              authResponse = response.data as AuthResponse;
            } else {
              snackBar(context, 'Error: Unexpected data type');
              print(
                'Error: Expected AuthResponseModel or AuthResponse but got ${response.data.runtimeType}',
              );
              return;
            }

            context.read<RegisterBloc>().add(
              SaveUserSession(authResponse: authResponse),
            );
            context.go('/client/home');
          }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return RegisterContent(
            state: state,
            obscurePassword: _obscurePassword,
            onToggleVisibility: _togglePasswordVisibility,
          );
        },
      ),
    );
  }
}
