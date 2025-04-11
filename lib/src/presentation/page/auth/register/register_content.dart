import 'package:flutter/material.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5.0),
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
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                // key: _formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 30.0,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isDark
                                ? const Color(0xFF1E1E1E)
                                : const Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color:
                                isDark
                                    ? Colors.grey[400]
                                    : const Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 30.0,
                      ),
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? const Color(
                                  0xFF1E1E1E,
                                ) // fondo para modo oscuro
                                : const Color(
                                  0xFFedf0f8,
                                ), // fondo para modo claro
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                        // controller: mailcontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 30.0,
                      ),
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? const Color(
                                  0xFF1E1E1E,
                                ) // fondo para modo oscuro
                                : const Color(
                                  0xFFedf0f8,
                                ), // fondo para modo claro
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        // controller: passwordcontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,

                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color(0xFFb2b7bf),
                            fontSize: 18.0,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        // if(_formkey.currentState!.validate()){
                        //   setState(() {
                        //     email=mailcontroller.text;
                        //     name= namecontroller.text;
                        //     password=passwordcontroller.text;
                        //   });
                        // }
                        // registration();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          vertical: 13.0,
                          horizontal: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF273671),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              "or LogIn with",
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
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
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
                    //     MaterialPageRoute(builder: (context) => LogIn()));
                  },
                  child: const Text(
                    "LogIn",
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
