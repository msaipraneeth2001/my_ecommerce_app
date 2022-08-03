import 'package:flutter/material.dart';
import '/custom_widgets.dart';
import 'package:get/get.dart';

import '../getx/product_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfafafa),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 180, 250),
        title: textView('Product Detail', color: Colors.white, fontSize: 16),
        actions: [
          cartIcon(productController),
        ],
      ),
      body: FutureBuilder(
        future: productController
            .getProductDetail(productController.selectedProduct['id']),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return detailScreen();
              }
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottomNavBar() {
    productController.checkFavorite();
    return Container(
      height: 45,
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        children: <Widget>[
          Obx(
            () => IconButton(
              icon: productController.isFav.value
                  ? const Icon(
                      Icons.favorite,
                      color: Color(0xFFff665e),
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Color(0xFFff665e),
                    ),
              onPressed: () {
                productController.addRemoveToFavorite();
              },
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              productController.addToCart();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  side: BorderSide(
                    color: Color(0xFFff665e),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            child: textView("Add to cart".toUpperCase(),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFff665e)),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFFff665e)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
            ),
            child: textView("Check other products".toUpperCase(),
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget detailScreen() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: Get.width * 0.5,
            height: Get.width * .6,
            child: Image.network(
              // ignore: invalid_use_of_protected_member
              productController.products.value['images'][0],
              fit: BoxFit.fill,
            ),
          ),
          vSpace(10),
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ignore: invalid_use_of_protected_member
                textView(productController.products.value['title'],
                    color: Colors.red, fontSize: 20),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                textView("Price".toUpperCase(),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF565656)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // ignore: invalid_use_of_protected_member
                    textView("\$${(productController.products.value['price'])}",
                        color: const Color(0xFF0dc2cd),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textView(
                        // ignore: invalid_use_of_protected_member
                        "Discount % ${(productController.products.value['discountPercentage'])}",
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                textView('Descriptions'),
                vSpace(15),
                textView(
                  // ignore: invalid_use_of_protected_member
                  "${productController.products.value['description']}",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
