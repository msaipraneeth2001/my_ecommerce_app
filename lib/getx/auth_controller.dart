import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/screens/home_screen.dart';
import '../../screens/signin_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final getStorage = GetStorage();
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.to(() => const HomeScreen());
    }
  }

  void signup(String email, password, name) async {
    try {
      await getStorage.write("email", email);
      await getStorage.write("name", name);
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Signup failed",
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await getStorage.write("email", email);
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
