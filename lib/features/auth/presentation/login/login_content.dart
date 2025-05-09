import 'package:animate_do/animate_do.dart';
import 'package:autogas/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:autogas/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginContent extends StatelessWidget {
  final LoginState loginState;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;
  const LoginContent({
    super.key,
    required this.loginState,
    required this.obscurePassword,
    required this.onToggleVisibility,
  });

  void snackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  @override
  Widget build(BuildContext context) {
    // BlocListener<LoginBloc, LoginState>(
    //   listenWhen: (previous, current) => current.errorMessage.isNotEmpty,
    //   listener: (context, state) {
    //     snackBar(context, state.errorMessage);
    //   },
    //   child: Container(),
    // );
    // final bloc = loginState;
    final loginBloc = context.watch<LoginBloc>();
    final password = loginBloc.state.password;
    final email = loginBloc.state.email;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              _buildLogo(context),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  // key: loginState.formKey,
                  child: Column(
                    children: [
                      _buildEmailField(
                        isDark,
                        colors,
                        context,
                        loginBloc,
                        email,
                      ),
                      const SizedBox(height: 30.0),
                      _buildPasswordField(isDark, colors, context, password),
                      const SizedBox(height: 30.0),
                      _buildLoginButton(context),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              _buildForgotPasswordText(context),
              const SizedBox(height: 40.0),
              _buildLoginWithText(),
              const SizedBox(height: 30.0),
              _buildSocialButtons(),
              const SizedBox(height: 40.0),
              _buildSignUpPrompt(context),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.80;
    final height = MediaQuery.of(context).size.height * 0.35;
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        "assets/images/logoAutoDark.png",
        fit: BoxFit.contain,
        width: width,
        height: height,
      ),
    );
  }

  Widget _buildEmailField(
    bool isDark,
    ColorScheme colors,
    BuildContext context,
    LoginBloc loginBloc,
    Email email,
  ) {
    return CustomTextFormField(
      label: 'Correo',
      hint: 'ejemplo@correo.com',
      prefixIcon: Icon(Icons.email_outlined, color: colors.primary),

      keyboardType: TextInputType.emailAddress,
      backgroundColor:
          isDark ? const Color(0xFF1E1E1E) : const Color(0xFFedf0f8),
      textColor: isDark ? Colors.grey[300] : Colors.black87,
      hintStyle: TextStyle(
        color: isDark ? Colors.grey[400] : const Color(0xFFb2b7bf),
        fontSize: 18.0,
      ),
      floatingLabelStyle: TextStyle(
        color: colors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Ingrese la Contraseña';
      //   }
      //   return null;
      // },
      errorMessage: email.errorMessage,
      onChanged: (value) {
        loginBloc.add(EmailChanged(Email.dirty(value: value)));
      },
    );
  }

  Widget _buildPasswordField(
    bool isDark,
    ColorScheme colors,
    BuildContext context,
    Password password,
  ) {
    return CustomTextFormField(
      label: 'Contraseña',
      obscureText: obscurePassword,
      hint: '************',
      prefixIcon: Icon(Icons.lock_outline, color: colors.primary),
      suffixIcon: IconButton(
        icon: Icon(obscurePassword ? Icons.visibility_off : Icons.visibility),
        onPressed: onToggleVisibility,
        color: colors.primary,
      ),
      keyboardType: TextInputType.visiblePassword,
      backgroundColor:
          isDark ? const Color(0xFF1E1E1E) : const Color(0xFFedf0f8),
      textColor: isDark ? Colors.grey[300] : Colors.black87,
      hintStyle: TextStyle(
        color: isDark ? Colors.grey[400] : const Color(0xFFb2b7bf),
        fontSize: 18.0,
      ),
      floatingLabelStyle: TextStyle(
        color: colors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Ingrese la contraseña';
      //   }
      //   return null;
      // },
      errorMessage: password.errorMessage,
      onChanged: (value) {
        context.read<LoginBloc>().add(
          PasswordChanged(Password.dirty(value: value)),
        );
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if(_formkey.currentState!.validate()){
        //   setState(() {
        //     email= mailcontroller.text;
        //     password=passwordcontroller.text;
        //   });
        // }
        // userLogin();
      },

child: Padding(
  padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15.0),
  child: SizedBox(
    width: double.infinity,
    child: FadeIn(
      duration: const Duration(milliseconds: 300),
      child: CustomFilledButton(
        text: (loginState.formStatus == FormStatus.validating)
            ? '' // Ocultamos texto mientras carga
            : 'Ingresar',
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        buttonColor: const Color(0xFF273671),
        onPressed: (loginState.formStatus == FormStatus.validating)
            ? null
            : () {
                if (loginState.isValid) {
                  context.read<LoginBloc>().add(FormSubmit());
                }
                context.read<LoginBloc>().add(ForceValidate());
              },
        customChild: (loginState.formStatus == FormStatus.validating)
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : null,
      ),
    ),
  ),
),

    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/forgot-password');
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
      },
      child: const Text(
        "¿Olvidaste tu contraseña?",
        style: TextStyle(
          color: Color(0xFF8c8e98),
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildLoginWithText() {
    return const Text(
      "o Inicia sesión con",
      style: TextStyle(
        color: Color(0xFF273671),
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // AuthMethods().signInWithGoogle(context);
          },
          child: Image.asset(
            "assets/images/google.png",
            height: 45,
            width: 45,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 30.0),
        GestureDetector(
          onTap: () {
            // AuthMethods().signInWithApple();
          },
          child: Image.asset(
            "assets/images/apple1.png",
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "¿Sin cuenta?",
          style: TextStyle(
            color: Color(0xFF8c8e98),
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () {
            context.push('/register');
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            "Regístrate",
            style: TextStyle(
              color: Color(0xFF273671),
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
