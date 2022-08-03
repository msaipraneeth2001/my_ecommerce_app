import 'package:flutter/material.dart';
import 'package:my_ecommerce_app/getx/auth_controller.dart';
import 'package:my_ecommerce_app/screens/profile_screen.dart';
import 'package:my_ecommerce_app/screens/signin_screen.dart';
import '/getx/product_controller.dart';
import '/custom_widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'ProductDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductController productController = Get.find<ProductController>();
  final getStorage = GetStorage();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = getStorage.read("email");
    final name = getStorage.read("name");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 200, 233),
        title: const Text('Shopping App'),
        actions: [
          cartIcon(productController),
        ],
      ),
      //backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            accountEmail: Text(email ?? ""),
            accountName: Text(name ?? ""),
          ),
          ListTile(
            onTap: () {
              Get.to(ProfilePage());
            },
            leading: const Icon(Icons.account_circle),
            title: const Text("Profile"),
          ),
          ListTile(
            onTap: () {
              AuthController.instance.logout();
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Log out"),
          ),
        ]),
      ),
      body: FutureBuilder<dynamic>(
          future: productController.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.79),
                itemBuilder: (context, index) {
                  final data = snapshot.data.elementAt(index);

                  //print(data);
                  return InkWell(
                    onTap: () {
                      productController.selectedProduct = data;

                      Get.to(() => const ProductDetailScreen());
                    },
                    child: Stack(
                      children: [
                        Card(
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 170,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data['thumbnail']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 10),
                                child: textView(data['title']),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 5),
                                child: textView("Price \$${data['price']}",
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              //print('i am fav $index');
                            },
                            icon: productController.favList.contains(data['id'])
                                ? const Icon(Icons.favorite)
                                : const Icon(Icons.favorite_border_outlined),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
