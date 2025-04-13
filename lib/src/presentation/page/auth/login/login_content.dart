import 'package:autogas/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.asset(
                "assets/images/logoAutoDark.png",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                // key: _formkey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: 'Correo',
                      hint: 'ejemplo@correo.com',
                      prefixIcon: Icon(Icons.email_outlined, color: colors.primary,),
                      keyboardType: TextInputType.emailAddress,
                      backgroundColor:
                          isDark
                              ? const Color(0xFF1E1E1E)
                              : const Color(0xFFedf0f8),
                      textColor: isDark ? Colors.grey[300] : Colors.black87,
                      hintStyle: TextStyle(
                        color:
                            isDark ? Colors.grey[400] : const Color(0xFFb2b7bf),
                        fontSize: 18.0,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Ingrese la Contraseña';
                          }
                          return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormField(
                      label: 'Contraseña',
                      obscureText: true,
                      hint: '************',
                      prefixIcon: Icon(Icons.lock_outline,color: colors.primary,),
                      keyboardType: TextInputType.emailAddress,
                      backgroundColor:
                          isDark
                              ? const Color(0xFF1E1E1E)
                              : const Color(0xFFedf0f8),
                      textColor: isDark ? Colors.grey[300] : Colors.black87,
                      hintStyle: TextStyle(
                        color:
                            isDark ? Colors.grey[400] : const Color(0xFFb2b7bf),
                        fontSize: 18.0,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Ingrese la contraseña';
                          }
                          return null;
                      },
                    ),
                    
                    const SizedBox(height: 30.0),
                    GestureDetector(
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 13.0,
                          horizontal: 15.0,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          // height: 50,
                          child: CustomFilledButton(
                            text: 'Ingresar',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            buttonColor: const Color(0xFF273671),
                            onPressed: () {
                              // Acción de login
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
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
            ),
            const SizedBox(height: 40.0),
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
            ),
            const SizedBox(height: 40.0),
            Row(
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
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
