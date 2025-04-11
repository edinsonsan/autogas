import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.asset(
                  "assets/images/logoAutoDark.png",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.35,
                )),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                // key: _formkey,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFedf0f8),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter E-mail';
                          }
                          return null;
                        },
                        // controller: mailcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(
          color: isDark ? Colors.grey[400] : const Color(0xFFb2b7bf),
          fontSize: 18.0,
        ),),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFedf0f8),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        // controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(
          color: isDark ? Colors.grey[400] : const Color(0xFFb2b7bf),
          fontSize: 18.0,
        ),),
                   obscureText: true,   ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        // if(_formkey.currentState!.validate()){
                        //   setState(() {
                        //     email= mailcontroller.text;
                        //     password=passwordcontroller.text;
                        //   });
                        // }
                        // userLogin();
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.0, horizontal: 30.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF273671),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                              child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500),
                          ))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
              },
              child: const Text("Forgot Password?",
                  style: TextStyle(
                      color: Color(0xFF8c8e98),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "or LogIn with",
              style: TextStyle(
                  color: Color(0xFF273671),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    // AuthMethods().signInWithGoogle(context);
                  },
                  child: Image.asset(
                    "assets/images/google.png",
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                GestureDetector(
                  onTap: (){
                    // AuthMethods().signInWithApple();
                  },
                  child: Image.asset(
                    "assets/images/apple1.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",
                    style: TextStyle(
                        color: Color(0xFF8c8e98),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                        color: Color(0xFF273671),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}