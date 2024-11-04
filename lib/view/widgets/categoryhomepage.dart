import 'package:flutter/material.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/view/home/controller/homecontroller.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final HomeController controller;
  const CategoryButton(
      {required this.text,
      required this.onTap,
      super.key,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: controller.screenHeight.value * 0.02,
            horizontal: controller.screenWidth.value * 0.05),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius:
              BorderRadius.circular(controller.screenWidth.value * 0.02),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, controller.screenWidth.value * 0.02),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: controller.screenWidth.value * 0.03,
              fontWeight: FontWeight.w400,
              letterSpacing: controller.screenWidth.value * 0.004),
        ),
      ),
    );
  }
}
