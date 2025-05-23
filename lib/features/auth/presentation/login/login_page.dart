import 'package:autogas/features/auth/auth.dart';
import 'package:autogas/features/auth/data/data.dart';
import 'package:autogas/features/auth/domain/entities/auth_response.dart';
import 'package:autogas/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const String name = 'login_page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    // final loginBloc = context.watch<LoginBloc>();
    // LoginBloc bloc = BlocProvider.of(context);

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            snackBar(context, response.message);
          } else if (response is Success) {
            print('Success DATA LOGIN: ${response.data}');

            late final AuthResponse authResponse;

            if (response.data is AuthResponseModel) {
              authResponse = (response.data as AuthResponseModel).toEntity();
            snackBar(context, '¡Bienvenido: ${authResponse.user.name}!');
            } else if (response.data is AuthResponse) {
              authResponse = response.data as AuthResponse;
            snackBar(context, '¡Bienvenido: ${authResponse.user.name}!');
            } else {
              snackBar(context, 'Error: Unexpected data type');
              print(
                'Error: Expected AuthResponseModel or AuthResponse but got ${response.data.runtimeType}',
              );
              return;
            }

            context.read<LoginBloc>().add(
              SaveUserSession(authResponse: authResponse),
            );
            context.go('/client/home');
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final content = LoginContent(
              loginState: state,
              obscurePassword: _obscurePassword,
              onToggleVisibility: _togglePasswordVisibility,
            );

            // if (state.formStatus == FormStatus.validating) {
            //   return Stack(
            //     children: [
            //       content,

            //       // Fondo gris trasparente
            //       FadeIn(
            //         duration: const Duration(milliseconds: 200),
            //         child: Container(
            //           color: Colors.black.withOpacity(0.3),
            //         ),
            //       ),

            //       // CircularProgressIndicator en la parte superior centrado
            //       Positioned(
            //         top: 40,
            //         left: MediaQuery.of(context).size.width / 2 - 20,
            //         child: const CircularProgressIndicator(strokeWidth: 1,),
            //       ),

            //       // Animación del coche subiendo como un cohete

            //     ],
            //   );
            // }

            return content;
          },
        ),
      ),
    );
  }
}
