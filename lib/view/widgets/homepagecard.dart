import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/view/home/controller/homecontroller.dart';

class ProductCard extends StatelessWidget {
  final HomeController controller;
  final dynamic data;
  const ProductCard({super.key, required this.controller, this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(controller.screenWidth.value * 0.03),
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius:
                BorderRadius.circular(controller.screenWidth.value * 0.04),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(
                    () => Transform.translate(
                      offset: Offset(0, controller.screenHeight.value * -0.043),
                      child: InkWell(
                        onTap: () => controller.toggleHeart(),
                        child: controller.isHeartFilled.value
                            ? MyIcons.heartfilled
                            : MyIcons.heartoutlined,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('details',
                        arguments: {'product': data, 'controller': controller}),
                    child: Transform.translate(
                      offset: Offset(controller.screenWidth.value * 0.024, 0),
                      child: Image.network(
                        data.image,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.broken_image,
                            size: 93,
                            color: MyColors.red,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: controller.screenHeight.value * 0.008),
              Text(
                data.name,
                style: TextStyle(
                  color: MyColors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: controller.screenWidth.value * 0.029,
                ),
              ),
              SizedBox(height: controller.screenHeight.value * 0.005),
              Text(
                data.subCategory,
                style: TextStyle(
                  color: MyColors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: controller.screenWidth.value * 0.034,
                ),
              ),
              SizedBox(height: controller.screenHeight.value * 0.013),
              Row(
                children: [
                  Transform.translate(
                      offset: Offset(0, controller.screenHeight.value * 0.013),
                      child: Text(
                        '\$${data.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: controller.screenWidth.value * 0.04,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: controller.screenWidth.value * 0.003,
          top: controller.screenHeight.value * 0.21,
          child: InkWell(
            onTap: () async => await controller.addToCartAPI(data),
            child: MyIcons.pluscard,
          ),
        ),
      ],
    );
  }
}
