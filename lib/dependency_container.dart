import 'package:get/get.dart';
import 'package:my_ecommerce_app/getx/product_controller.dart';

import 'getx/auth_controller.dart';
import '/getx/product_controller.dart';

Future<void> init() async {
  Get.put(AuthController());
  Get.put(ProductController());
}
