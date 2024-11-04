import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/fonts/fontsize.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/view/mycart/controller/cartcontroller.dart';

class CartItem extends StatelessWidget {
  final dynamic data;
  final MyCartController controller;

  const CartItem({super.key, required this.controller, this.data});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          Container(
            decoration: BoxDecoration(
                color: MyColors.green,
                borderRadius:
                    BorderRadius.circular(controller.screenWidth.value / 51.5)),
            width: controller.screenWidth.value / 7.103,
            height: controller.screenHeight.value / 8.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => controller.increaseQuantity(data),
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                ),
                SizedBox(height: controller.screenHeight.value / 228.75),
                Obx(
                  () => Text(
                    '${data.quantity.value.toInt()}',
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: MyFontSize.f14(context),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: controller.screenHeight.value / 228.75),
                GestureDetector(
                    onTap: () => controller.decreaseQuantity(data),
                    child: Icon(Icons.remove, color: MyColors.white)),
              ],
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          InkWell(
            onTap: () => controller.removeFromCart(data),
            child: Container(
                width: controller.screenWidth.value / 7.103,
                height: controller.screenHeight.value / 8.8,
                margin: EdgeInsets.symmetric(
                    horizontal: controller.screenWidth.value / 51.1),
                decoration: BoxDecoration(
                  color: MyColors.slidablered,
                  borderRadius: BorderRadius.circular(
                      controller.screenWidth.value / 51.5),
                ),
                child: MyIcons.trash),
          ),
        ],
      ),
      child: Container(
        height: controller.screenHeight.value / 8.78,
        padding: EdgeInsets.all(controller.screenWidth.value / 34.33),
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(MyFontSize.f12(context)),
          boxShadow: [
            BoxShadow(
              color: MyColors.verylightgrey,
              blurRadius: controller.screenHeight.value / 152.5,
              offset: Offset(0, controller.screenHeight.value / 304),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius:
                    BorderRadius.circular(controller.screenWidth.value / 51.5),
                child: Image.network(
                  data.image,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                )),
            SizedBox(width: controller.screenWidth.value / 25.75),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                      fontSize: MyFontSize.f18(context),
                    ),
                  ),
                  SizedBox(height: controller.screenHeight.value / 114.375),
                  Text(
                    '\$${data.price}',
                    style: TextStyle(
                      fontSize: MyFontSize.f16(context),
                      color: MyColors.itemtextcolor,
                      fontFamily: 'poppins',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
