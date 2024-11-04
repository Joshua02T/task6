import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/modules/product.dart';
import 'package:task6/view/home/controller/homecontroller.dart';

class DetailsController extends GetxController {
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;
  var product = Rxn<Products>();
  var homeController = Rxn<HomeController>();

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    product.value = arguments['product'];
    homeController.value = arguments['controller'];
  }

  void setScreenSize(BuildContext context) {
    screenWidth.value = MediaQuery.of(context).size.width;
    screenHeight.value = MediaQuery.of(context).size.height;
  }
}
