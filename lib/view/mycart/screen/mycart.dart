import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/fonts/fontsize.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/view/mycart/controller/cartcontroller.dart';
import 'package:task6/view/widgets/slidableitem.dart';
import 'package:dotted_line/dotted_line.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    MyCartController controller = Get.put(MyCartController());
    controller.setScreenSize(context);
    return Scaffold(
      backgroundColor: MyColors.backgroundcolor,
      body: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MyFontSize.f20(context),
                    right: MyFontSize.f20(context),
                    top: controller.screenHeight.value * 0.04),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: controller.screenWidth.value * 0.12,
                        height: controller.screenWidth.value * 0.12,
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(
                              controller.screenWidth.value * 0.06),
                        ),
                        child: MyIcons.backIcon,
                      ),
                    ),
                    SizedBox(width: controller.screenWidth.value * 0.266),
                    Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: MyFontSize.f16(context),
                        color: MyColors.textblackcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: controller.screenHeight.value * 0.04),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: MyFontSize.f20(context)),
                child: Text(
                  '${controller.cartItems.length.toString()} items',
                  style: TextStyle(
                    fontSize: controller.screenWidth.value / 25.75,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                    color: MyColors.itemtextcolor,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: MyFontSize.f20(context)),
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.cartItems[index];
                      return Column(
                        children: [
                          CartItem(
                            controller: controller,
                            data: item,
                          ),
                          SizedBox(
                              height: controller.screenHeight.value * 0.02),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(controller.screenWidth.value / 25.75),
                color: MyColors.white,
                child: Column(
                  children: [
                    // Subtotal Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                              fontSize: MyFontSize.f16(context),
                              fontWeight: FontWeight.w500,
                              color: MyColors.lightgreycolor),
                        ),
                        Text(
                          '\$${controller.calculateTotalPrice().toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: MyFontSize.f16(context),
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              color: MyColors.itemtextcolor),
                        ),
                      ],
                    ),

                    SizedBox(height: controller.screenHeight.value / 91),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              fontSize: MyFontSize.f16(context),
                              fontWeight: FontWeight.w500,
                              color: MyColors.lightgreycolor),
                        ),
                        Text(
                          '\$0.00',
                          style: TextStyle(
                              fontSize: MyFontSize.f16(context),
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              color: MyColors.itemtextcolor),
                        ),
                      ],
                    ),

                    SizedBox(height: controller.screenHeight.value / 60),
                    DottedLine(
                        dashColor: MyColors.lightgreycolor,
                        lineThickness: controller.screenWidth.value / 206),
                    SizedBox(height: controller.screenHeight.value / 60),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Cost',
                          style: TextStyle(
                              fontSize: MyFontSize.f16(context),
                              fontWeight: FontWeight.w600,
                              color: MyColors.textblackcolor),
                        ),
                        Text(
                          '\$${controller.calculateTotalPrice().toStringAsFixed(2)}',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: MyFontSize.f16(context),
                            fontWeight: FontWeight.w600,
                            color: MyColors.green,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: controller.screenHeight.value / 57.1875),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: controller.screenWidth.value / 1.23,
                      height: controller.screenHeight.value / 18.3,
                      color: MyColors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              controller.screenWidth.value / 34.33)),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            fontSize: MyFontSize.f14(context),
                            color: MyColors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
