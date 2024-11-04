import 'package:flutter/material.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/constants/images/images.dart';
import 'package:task6/view/home/controller/homecontroller.dart';

class NewArrival extends StatelessWidget {
  final HomeController controller;
  const NewArrival({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: controller.screenWidth.value * 0.813,
      height: controller.screenHeight.value * 0.104,
      decoration: BoxDecoration(
          color: MyColors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Transform.translate(
              offset: Offset(0, controller.screenHeight.value * 0.03),
              child: MyIcons.vectorarrival),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: controller.screenHeight.value * 0.016,
              ),
              Text(
                'Summer Sale',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: controller.screenWidth.value * 0.03),
              ),
              Text('15% OFF',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Nunito',
                      color: MyColors.purple,
                      fontSize: controller.screenWidth.value * 0.08))
            ],
          ),
          Transform.translate(
              offset: Offset(controller.screenWidth.value * -0.05,
                  controller.screenHeight.value * -0.03),
              child: MyIcons.vectorarrival),
          Transform.translate(
              offset: Offset(controller.screenWidth.value * 0.04,
                  controller.screenHeight.value * 0.03),
              child: MyIcons.vectorarrival),
          Transform.translate(
              offset: Offset(controller.screenWidth.value * 0.05,
                  controller.screenHeight.value * -0.025),
              child: MyIcons.newarrival),
          Transform.translate(
              offset: Offset(controller.screenWidth.value * 0.05,
                  controller.screenHeight.value * -0.02),
              child: MyImages.tshirtarrival),
          Transform.translate(
              offset: Offset(controller.screenWidth.value * 0.07,
                  controller.screenHeight.value * -0.03),
              child: MyIcons.vectorarrival),
        ],
      ),
    );
  }
}
