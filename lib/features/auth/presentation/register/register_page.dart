import 'package:autogas/features/auth/auth.dart';
import 'package:autogas/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
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
          context.read<RegisterBloc>().add(FormReset());
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
