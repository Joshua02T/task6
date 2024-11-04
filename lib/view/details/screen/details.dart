import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/fonts/fontsize.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/constants/images/images.dart';
import 'package:task6/view/widgets/bottom_nav_bar.dart';
import 'package:task6/view/widgets/detailshirt.dart';
import '../controller/detailcontroller.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailsController controller = Get.put(DetailsController());
    controller.setScreenSize(context);

    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          onpressed1: () => Get.offAllNamed('homepage'),
          onpressed2: () => Get.offAllNamed('favorite'),
          onpressed3: () => Get.toNamed('mycart'),
          onpressed5: () => Get.toNamed('profile'),
        ),
        backgroundColor: MyColors.backgroundcolor,
        body: Obx(() {
          final product = controller.product.value;
          final homeController = controller.homeController.value;
          if (product == null) {
            return const Center(child: Text('there is no product'));
          }
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: controller.screenWidth.value * 0.05,
              vertical: controller.screenHeight.value * 0.02,
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
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
                    Text(
                      'T-shirt Shop',
                      style: TextStyle(
                          color: MyColors.textblackcolor,
                          fontSize: controller.screenWidth.value * 0.04,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('mycart'),
                      child: Container(
                        width: controller.screenWidth.value * 0.12,
                        height: controller.screenWidth.value * 0.12,
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(
                              controller.screenWidth.value * 0.06),
                        ),
                        child: MyIcons.bag,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: controller.screenHeight.value * 0.03),
                Text(
                  product.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: MyColors.textblackcolor,
                      fontSize: controller.screenWidth.value * 0.07),
                ),
                SizedBox(height: controller.screenHeight.value * 0.015),
                Text(
                  product.subCategory,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: MyColors.lightgreycolor,
                      fontSize: controller.screenWidth.value * 0.04),
                ),
                SizedBox(height: controller.screenHeight.value * 0.02),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        product.image,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.broken_image,
                            size: 150,
                            color: MyColors.red,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: controller.screenHeight.value * 0,
                      left: controller.screenWidth.value * 0.01,
                      child: Text(
                        '\$${product.price}',
                        style: TextStyle(
                            fontSize: controller.screenWidth.value * 0.06,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w600,
                            color: MyColors.textblackcolor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: controller.screenHeight.value * 0.03),
                SizedBox(
                    height: controller.screenHeight.value * 0.05,
                    child: Stack(alignment: Alignment.center, children: [
                      Positioned(
                        top: controller.screenHeight.value * -0.22,
                        child: MyImages.ellipse,
                      ),
                      Positioned(
                          top: controller.screenHeight.value * 0.01,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      controller.screenWidth.value * 0.012),
                              width: controller.screenWidth.value * 0.0933,
                              height: controller.screenHeight.value * 0.018,
                              decoration: BoxDecoration(
                                color: MyColors.lightgreycolor,
                                borderRadius: BorderRadius.circular(
                                  controller.screenWidth.value * 0.0933,
                                ),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: MyFontSize.f12(context),
                                        color: MyColors.white,
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Icon(Icons.arrow_forward_ios,
                                            size: MyFontSize.f12(context),
                                            color: MyColors.white))
                                  ])))
                    ])),
                SizedBox(
                    height: controller.screenHeight.value / 12.9,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    controller.screenWidth.value / 51.5),
                            child: DetailShirt(controller: controller),
                          );
                        })),
                SizedBox(height: controller.screenHeight.value * 0.02),
                Text(
                  'Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there .....',
                  style: TextStyle(
                      fontSize: controller.screenWidth.value * 0.035,
                      color: MyColors.lightgreycolor,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text('Read More',
                        style: TextStyle(
                            fontSize: controller.screenWidth.value * 0.037,
                            color: MyColors.green,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400)),
                    onPressed: () {},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('favorite');
                      },
                      child: Container(
                        width: controller.screenWidth.value / 8,
                        height: controller.screenHeight.value / 17.6,
                        decoration: BoxDecoration(
                            color: MyColors.verylightgrey,
                            borderRadius: BorderRadius.circular(
                                controller.screenWidth.value * 0.06)),
                        child: MyIcons.heartDetails,
                      ),
                    ),
                    MaterialButton(
                      minWidth: controller.screenWidth.value * 0.504,
                      height: controller.screenHeight.value * 0.054,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              controller.screenWidth.value * 0.035)),
                      onPressed: () async {
                        await homeController!.addToCartAPI(product);
                      },
                      color: MyColors.green,
                      child: Row(
                        children: [
                          MyIcons.bag,
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontSize: controller.screenWidth.value * 0.04,
                                fontWeight: FontWeight.w600,
                                color: MyColors.white),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }));
  }
}
