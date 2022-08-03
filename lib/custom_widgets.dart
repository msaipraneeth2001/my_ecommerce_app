import 'package:flutter/material.dart';
import '/getx/product_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/list_cart_products.dart';

showSnackBar(
    {required title,
    required message,
    Duration? duration,
    position = SnackPosition.BOTTOM}) {
  Get.snackbar(title, message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: position,
      duration: duration ?? const Duration(seconds: 3));
}

Widget textView(String text,
    {double fontSize = 14,
    var color = Colors.black87,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    Alignment alignment = Alignment.centerLeft,
    int maxLines = 2,
    bool multiLine = true,
    var textOverflow = TextOverflow.ellipsis,
    var textAlign = TextAlign.left,
    var textDirection = TextDirection.ltr,
    var height = 1.2,
    var wordSpacing = 1.0,
    var letterSpacing = 1.0,
    bool needLineThrough = false,
    bool needUnderLine = false,
    needFancyFont = false}) {
  return Align(
    alignment: alignment,
    child: Text(
      text,
      style: needFancyFont
          ? GoogleFonts.fjallaOne(
              decoration: needLineThrough
                  ? TextDecoration.lineThrough
                  : needUnderLine
                      ? TextDecoration.underline
                      : TextDecoration.none,
              color: color,
              wordSpacing: wordSpacing,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontStyle: fontStyle,
              height: height)
          : GoogleFonts.fjallaOne(
              decoration: needLineThrough
                  ? TextDecoration.lineThrough
                  : needUnderLine
                      ? TextDecoration.underline
                      : TextDecoration.none,
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              height: height),
      overflow: textOverflow,
      maxLines: maxLines == 0 ? null : maxLines,
//softWrap: true,
      textAlign: textAlign,
      textDirection: textDirection,
    ),
  );
}

vSpace(height) {
  return SizedBox(
    height: height.toDouble(),
  );
}

hSpace(width) {
  return SizedBox(
    width: width.toDouble(),
  );
}

Widget cartIcon(ProductController productController) {
  return Obx(
    () => Stack(
      children: [
        IconButton(
          onPressed: () {
            Get.to(() => const CartProductsList());
          },
          icon: const Icon(Icons.shopping_cart),
        ),
        if (productController.cartProducts.isNotEmpty)
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  color: Colors.black87, shape: BoxShape.circle),
              child: textView('${productController.cartProducts.length}',
                  color: Colors.white,
                  alignment: Alignment.center,
                  fontSize: 10),
            ),
          )
      ],
    ),
  );
}
