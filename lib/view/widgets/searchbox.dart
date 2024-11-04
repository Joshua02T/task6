import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/view/home/controller/homecontroller.dart';

class SearchBox extends StatelessWidget {
  final HomeController controller;
  const SearchBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: controller.screenWidth.value * 0.05,
              vertical: controller.screenHeight.value * 0.013,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(controller.screenWidth.value * 0.03),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, controller.screenWidth.value * 0.01),
                ),
              ],
            ),
            child: Row(
              children: [
                MyIcons.searchIcon,
                SizedBox(width: controller.screenWidth.value * 0.03),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Looking for ......',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: MyColors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: controller.screenWidth.value * 0.03,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: controller.screenWidth.value * 0.03),
        Container(
            width: controller.screenWidth.value * 0.13,
            height: controller.screenWidth.value * 0.13,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                fit: BoxFit.contain,
                width: 24,
                height: 24,
              ),
            )),
      ],
    );
  }
}
