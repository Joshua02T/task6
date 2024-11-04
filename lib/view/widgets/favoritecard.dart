import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/constants/images/images.dart';
import 'package:task6/view/favorite/controller/favoritecontroller.dart';

class FavoriteCard extends StatelessWidget {
  final FavoriteController controller;
  const FavoriteCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: controller.screenWidth.value / 2.59,
      height: controller.screenHeight.value / 4.216,
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
              Transform.translate(
                  offset: Offset(controller.screenWidth.value * 0.024, 0),
                  child: MyImages.tshirt),
            ],
          ),
          SizedBox(height: controller.screenHeight.value * 0.008),
          Text(
            'BEST SELLER',
            style: TextStyle(
                color: MyColors.green,
                fontWeight: FontWeight.w500,
                fontSize: controller.screenWidth.value / 34.33,
                fontFamily: 'poppins'),
          ),
          SizedBox(height: controller.screenHeight.value * 0.005),
          Text(
            'Programmer T-shirt',
            style: TextStyle(
              color: MyColors.textblackcolor,
              fontWeight: FontWeight.w500,
              fontSize: controller.screenWidth.value / 30,
            ),
          ),
          SizedBox(height: controller.screenHeight.value * 0.013),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$150.00',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: controller.screenWidth.value / 25.75,
                    fontFamily: 'poppins'),
              ),
              Row(
                children: [
                  Container(
                    width: controller.screenWidth.value / 25.75,
                    height: controller.screenHeight.value / 57.1875,
                    decoration: BoxDecoration(
                        color: MyColors.red,
                        borderRadius: BorderRadius.circular(
                            controller.screenWidth.value * 0.06)),
                  ),
                  SizedBox(width: controller.screenWidth.value * 0.02),
                  Container(
                    width: controller.screenWidth.value / 25.75,
                    height: controller.screenHeight.value / 57.1875,
                    decoration: BoxDecoration(
                        color: MyColors.darkblue,
                        borderRadius: BorderRadius.circular(
                            controller.screenWidth.value * 0.06)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
