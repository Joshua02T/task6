import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;
  var isHeartFilled = false.obs;
  void setScreenSize(BuildContext context) {
    screenWidth.value = MediaQuery.of(context).size.width;
    screenHeight.value = MediaQuery.of(context).size.height;
  }

  void toggleHeart() {
    isHeartFilled.value = !isHeartFilled.value;
  }
}
