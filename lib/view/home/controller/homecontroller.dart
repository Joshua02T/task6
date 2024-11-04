import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:task6/constants/constdata.dart';
import 'package:http/http.dart' as http;
import 'package:task6/constants/service/service.dart';
import 'package:task6/modules/category.dart';
import 'package:task6/modules/product.dart';

class HomeController extends GetxController {
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;
  var isHeartFilled = false.obs;
  void setScreenSize(BuildContext context) {
    screenWidth.value = MediaQuery.of(context).size.width;
    screenHeight.value = MediaQuery.of(context).size.height;
  }

  RxList<Category> categories = <Category>[].obs;
  RxList<Products> products = <Products>[].obs;
  RxList<Products> filteredProducts = <Products>[].obs;
  RxString selectedCategory = ''.obs;
  void toggleHeart() {
    isHeartFilled.value = !isHeartFilled.value;
  }

  void fetchCategories() async {
    try {
      ConstData.isLoading.value = true;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ConstData.token}',
      };

      final response = await http.get(
        Uri.parse(AppLink.categories),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['data'] != null && jsonData['data'] is List) {
          final List<Category> fetchedCategories = (jsonData['data'] as List)
              .map((data) => Category.fromJson(data))
              .toList();
          categories.assignAll(fetchedCategories);
        } else {
          Get.snackbar("Error", "Invalid response format from the server");
        }
      } else {
        Get.snackbar("Error",
            "Failed to load categories. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching categories");
    } finally {
      ConstData.isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchCategories();
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      ConstData.isLoading.value = true;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ConstData.token}',
      };

      final response = await http.get(
        Uri.parse(AppLink.allProducts),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['data'] != null && jsonData['data'] is List) {
          final List<Products> fetchedProducts = (jsonData['data'] as List)
              .map((data) => Products.fromJson(data))
              .toList();
          products.assignAll(fetchedProducts);
          filteredProducts.assignAll(fetchedProducts);
        } else {
          Get.snackbar("Error", "Invalid response format from the server");
        }
      } else {
        Get.snackbar("Error",
            "Failed to load products. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching products");
    } finally {
      ConstData.isLoading.value = false;
    }
  }

  RxList cartItems = <Products>[].obs;

  Future<void> addToCartAPI(Products product) async {
    final response = await http.post(
      Uri.parse(AppLink.orderProduct),
      body: jsonEncode({
        "product_id": product.id,
        "quantity": 1,
      }),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${ConstData.token}',
      },
    );

    if (response.statusCode == 200) {
      cartItems.add(product);
      update();
      Get.snackbar("Success", "Product added to your cart");
    } else {
      Get.snackbar("Error", "Failed to add product to cart");
    }
  }

  void filterProductsByCategory(String categoryName) {
    if (categoryName.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      // Filter products by the selected category
      filteredProducts.assignAll(products
          .where((product) => product.category == categoryName)
          .toList());
    }
    selectedCategory.value = categoryName;
  }
}
