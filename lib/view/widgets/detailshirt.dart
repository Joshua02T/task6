import 'package:flutter/material.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/images/images.dart';
import 'package:task6/view/details/controller/detailcontroller.dart';

class DetailShirt extends StatelessWidget {
  final DetailsController controller;
  const DetailShirt({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: controller.screenWidth.value * 0.2,
      height: controller.screenHeight.value * 0.1,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: controller.screenWidth.value * 0.2,
          height: controller.screenHeight.value * 0.1,
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius:
                BorderRadius.circular(controller.screenWidth.value * 0.15),
          ),
          child: MyImages.image2,
        ),
      ),
    );
  }
}
