import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../getx/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../screens/signin_screen.dart';

class signupPage extends StatefulWidget {
  signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

// ignore: camel_case_types
class _signupPageState extends State<signupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
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
                            color: const Color.fromARGB(255, 221, 215, 215),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _nameController,
                          style: TextStyle(
                              fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                              color: Colors.black87),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Full Name',
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
                            "Sign Up",
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
                      AuthController.instance.signup(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          _nameController.text);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(
                          fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                        ),
                      ),
                      GestureDetector(
                        child: Text(' Sign in',
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 70, 218),
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.arimaMadurai().fontFamily,
                            )),
                        onTap: () {
                          Get.to(LoginPage());
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
