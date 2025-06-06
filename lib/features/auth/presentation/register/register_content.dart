import 'package:autogas/features/shared/infrastructure/inputs/inputs.dart';
import 'package:autogas/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:autogas/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState state;
  final bool obscurePassword;
  final VoidCallback onToggleVisibility;
  const RegisterContent({
    super.key,
    required this.state,
    required this.obscurePassword,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.watch<RegisterBloc>();
    final name = registerBloc.state.name;
    final lastname = registerBloc.state.lastname;
    final email = registerBloc.state.email;
    final phone = registerBloc.state.phone;
    final password = registerBloc.state.password;
    final confirmPassword = registerBloc.state.confirmPassword;

    final colors = Theme.of(context).colorScheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildLogo(context),
              _buildForm(
                context,
                isDark,
                colors,
                name,
                lastname,
                email,
                phone,
                password,
                confirmPassword,
              ),
              const SizedBox(height: 40.0),
              _buildSocialLoginSection(),
              const SizedBox(height: 40.0),
              _buildFooter(context),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  // Logo Section
  Widget _buildLogo(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Image.asset(
        "assets/images/logoAutoDark.png",
        fit: BoxFit.contain,
        width: MediaQuery.of(context).size.width * 0.80,
        height: MediaQuery.of(context).size.height * 0.35,
      ),
    );
  }

  // Form Section
  Widget _buildForm(
    BuildContext context,
    bool isDark,
    ColorScheme colors,
    Username name,
    Username lastname,
    Email email,
    Phone phone,
    Password password,
    Confirmpassword confirmPassword,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        child: Column(
          children: [
            _buildTextField(
              label: 'Nombre',
              hint: 'Ingresar Nombres',
              prefixIcon: Icons.supervised_user_circle_outlined,
              keyboardType: TextInputType.text,
              isDark: isDark,
              colors: colors,
              // validator:
              //     (value) =>
              //         value == null || value.isEmpty
              //             ? 'Ingrese el Nombre'
              //             : null,
              onChanged: (value) {
                context.read<RegisterBloc>().add(
                  NameChanged(Username.dirty(value: value)),
                );
              },
              errorMessage: name.errorMessage,
            ),

            const SizedBox(height: 20),
            _buildTextField(
              label: 'Apellido',
              hint: 'Ingresar Apellido',
              prefixIcon: Icons.supervised_user_circle_outlined,
              keyboardType: TextInputType.text,
              isDark: isDark,
              colors: colors,
              // validator:
              //     (value) =>
              //         value == null || value.isEmpty
              //             ? 'Ingrese el Apellido'
              //             : null,
              onChanged: (value) {
                context.read<RegisterBloc>().add(
                  LastnameChanged(Username.dirty(value: value)),
                );
              },
              errorMessage: lastname.errorMessage,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Correo',
              hint: 'ejemplo@correo.com',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              isDark: isDark,
              colors: colors,
              // validator:
              //     (value) =>
              //         value == null || value.isEmpty
              //             ? 'Ingrese el Correo'
              //             : null,
              onChanged: (value) {
                context.read<RegisterBloc>().add(
                  EmailChanged(Email.dirty(value: value)),
                );
              },
              errorMessage: email.errorMessage,
            ),

            const SizedBox(height: 20),
            _buildTextField(
              label: 'Número de celular',
              hint: '987654321',
              prefixIcon: Icons.phone_in_talk_outlined,
              keyboardType: TextInputType.phone,
              isDark: isDark,
              colors: colors,
              // validator:
              //     (value) =>
              //         value == null || value.isEmpty
              //             ? 'Ingrese el Número de celular'
              //             : null,
              onChanged: (value) {
                context.read<RegisterBloc>().add(
                  PhoneChanged(Phone.dirty(value: value)),
                );
              },
              errorMessage: phone.errorMessage,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Contraseña',
              hint: '*************',
              prefixIcon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility, color: colors.primary,
                ),
                onPressed: onToggleVisibility,
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscurePassword,
              isDark: isDark,
              colors: colors,
              // validator:
              //     (value) =>
              //         value == null || value.isEmpty
              //             ? 'Ingrese la Contraseña'
              //             : null,
              onChanged: (value) {
                context.read<RegisterBloc>().add(
                  PasswordChanged(Password.dirty(value: value)),
                );
              },
              errorMessage: password.errorMessage,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Confirmar Contraseña',
              hint: 'Ingresar Contraseña',
              prefixIcon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility, color: colors.primary,
                ),
                onPressed: onToggleVisibility,
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: obscurePassword,
              isDark: isDark,
              colors: colors,
              // validator:
              //     (value) =>
              //         value == null || value.isEmpty ? '*************' : null,
              // onChanged: (value) {},
              onChanged: (value) {
                context.read<RegisterBloc>().add(
                  ConfirmPasswordChanged(
                    Confirmpassword.dirty(
                      value: value,
                      password: state.password.value,
                    ),
                  ),
                );
              },
              errorMessage: confirmPassword.errorMessage,
            ),
            const SizedBox(height: 30.0),
            _buildRegisterButton(
              onPressed: (state.formStatus == FormStatus.validating)
            ? null
            : () {
                if (state.isValid) {
                  context.read<RegisterBloc>().add(FormSubmit());
                }
                context.read<RegisterBloc>().add(ForceValidate());
              },
        customChild: (state.formStatus == FormStatus.validating)
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
          ],
        ),
      ),
    );
  }

  // Custom Text Field
  // (BuildContext context)
  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData prefixIcon,
    Widget? suffixIcon,
    required TextInputType keyboardType,
    bool obscureText = false,
    required bool isDark,
    required ColorScheme colors,
    required dynamic Function(String)? onChanged,
    required String? errorMessage,
  }) {
    return CustomTextFormField(
      label: label,
      hint: hint,
      prefixIcon: Icon(prefixIcon, color: colors.primary),
      suffixIcon: suffixIcon,
      keyboardType: keyboardType,
      obscureText: obscureText,
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
      // validator: validator,
      errorMessage: errorMessage,
      onChanged: onChanged,
    );
  }

  // Register Button
  Widget _buildRegisterButton({void Function()? onPressed, Widget? customChild}) {
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
          child: CustomFilledButton(
            text: 'Registrate',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            buttonColor: const Color(0xFF273671),
            onPressed: onPressed, customChild: customChild,
          ),
        ),
      ),
    );
  }

  // Social Login Section
  Widget _buildSocialLoginSection() {
    return Column(
      children: [
        const Text(
          "o Inicia sesión con",
          style: TextStyle(
            color: Color(0xFF273671),
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google.png",
              height: 45,
              width: 45,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 30.0),
            Image.asset(
              "assets/images/apple1.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }

  // Footer Section
  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "¿Tienes una cuenta?",
          style: TextStyle(
            color: Color(0xFF8c8e98),
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: () {
            context.pop();
            // Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
          },
          child: const Text(
            "Ingresar",
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
