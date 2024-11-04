import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/constants/constdata.dart';
import 'package:task6/constants/service/service.dart';
import 'package:task6/modules/orders.dart';
import 'package:http/http.dart' as http;

class MyCartController extends GetxController {
  RxDouble screenWidth = 0.0.obs;
  RxDouble screenHeight = 0.0.obs;
  RxList cartItems = <OrderProducts>[].obs;
  var screenSizeInitialized = false.obs;
  void setScreenSize(BuildContext context) {
    screenWidth.value = MediaQuery.of(context).size.width;
    screenHeight.value = MediaQuery.of(context).size.height;
  }

  Future<void> fetchCartItems() async {
    final response = await http.get(Uri.parse(AppLink.getProduct), headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${ConstData.token}',
    });

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)["data"];

      cartItems
          .assignAll(data.map((json) => OrderProducts.fromJson(json)).toList());
    } else {
      Get.snackbar("Error", "Failed to fetch cart items");
    }
  }

  void removeFromCart(OrderProducts product) async {
    final response = await http.delete(
      Uri.parse("${AppLink.deleteProduct}/${product.generalId}"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${ConstData.token}',
      },
    );

    if (response.statusCode == 200) {
      cartItems.remove(product);
      update();
      Get.snackbar("Success", "Item deleted from cart");
    } else {
      Get.snackbar("Error", "Failed to delete item from cart");
    }
  }

  @override
  void onInit() {
    fetchCartItems();
    calculateTotalPrice();
    super.onInit();
  }

  double calculateTotalPrice() {
    if (cartItems.isEmpty) {
      return 0.0;
    }

    double totalPrice = 0.0;
    for (var item in cartItems) {
      double discountAmount = item.price * (item.discount / 100);
      double itemTotalPrice = item.price - discountAmount;
      totalPrice += itemTotalPrice * item.quantity.value;
    }

    return totalPrice;
  }

  void increaseQuantity(OrderProducts product) {
    int index =
        cartItems.indexWhere((item) => item.generalId == product.generalId);
    if (index != -1) {
      cartItems[index].quantity.value += 1;
      update();
    }
  }

  void decreaseQuantity(OrderProducts product) {
    int index =
        cartItems.indexWhere((item) => item.generalId == product.generalId);
    if (index != -1 && cartItems[index].quantity.value > 1) {
      cartItems[index].quantity.value -= 1;
      update();
    }
  }
}
