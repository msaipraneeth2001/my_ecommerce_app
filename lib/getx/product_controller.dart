import 'dart:convert';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../custom_widgets.dart';

class ProductController extends GetxController {

  var isWorking = false.obs;
  var productsList = [].obs;
  var products = {}.obs;
  var favList = [].obs;
  var isFav = false.obs;
  var isAddedToCart = false.obs;
  var selectedProduct = {};
  var cartProducts = [].obs;

  getProducts() async {

    isWorking.value = true;
    const productUrl = 'https://dummyjson.com/products/';

    try {
      var response = await http.get(Uri.parse(productUrl));

      final data = json.decode(response.body);
      productsList.value = data['products'];
    } catch (e) {
      productsList.value = [];

      showSnackBar(title: 'Error', message: 'Failed to get products');
    } finally {
      isWorking.value = false;
    }

    return productsList;
  }

  getProductDetail(id) async {
    isWorking.value = true;

    final productUrl = 'https://dummyjson.com/products/$id';

    try {
      var response = await http.get(Uri.parse(productUrl));
      final data = json.decode(response.body);
      products.value = data;
    } catch (e) {
      products.value = {};
      showSnackBar(title: 'Error', message: 'Failed to get products');
    } finally {
      isWorking.value = false;
    }
    return products;
  }

  addRemoveToFavorite() async {
    if (favList.contains(selectedProduct['id'])) {
      favList.remove(selectedProduct['id']);
      isFav.value = false;
    } else {
      favList.add(selectedProduct['id']);
      isFav.value = true;
    }
  }

  checkFavorite() {
    if (favList.contains(selectedProduct['id'])) {
      isFav.value = true;
    } else {
      isFav.value = false;
    }
  }

  addToCart() async {
    if (!cartProducts.contains(selectedProduct)) {
      cartProducts.add(selectedProduct);
      isAddedToCart.value = true;
    } else {
      showSnackBar(title: 'Opps', message: 'Product Already In Cart');
    }
  }

  removeFromCart(product) async {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product);
    }
  }

  checkCart() {
    if (cartProducts.contains(selectedProduct)) {
      isAddedToCart.value = true;
    } else {
      isAddedToCart.value = false;
    }
  }
}
