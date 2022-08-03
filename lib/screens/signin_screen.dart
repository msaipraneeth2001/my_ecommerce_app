import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_ecommerce_app/screens/home_screen.dart';
import '../getx/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../screens/signup_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(255, 221, 215, 215),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _emailController,
                          style: TextStyle(
                              fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                              color: Colors.black87),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromARGB(255, 221, 215, 215),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(
                              fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                              color: Colors.black87),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 1, 70, 218),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontFamily:
                                    GoogleFonts.arimaMadurai().fontFamily,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      //getStorage.write("email", _emailController.text);
                      AuthController.instance.login(
                          _emailController.text.trim(),
                          _passwordController.text.trim());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account?",
                        style: TextStyle(
                          fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                        ),
                      ),
                      GestureDetector(
                        child: Text(' Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 70, 218),
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                            )),
                        onTap: () {
                          Get.to(signupPage());
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
