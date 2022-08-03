import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecommerce_app/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'getx/auth_controller.dart';
import 'getx/controller_binding.dart';
import 'screens/home_screen.dart';
import 'dependency_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    ((value) => Get.put(
          AuthController(),
        )),
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'EcommerceApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
