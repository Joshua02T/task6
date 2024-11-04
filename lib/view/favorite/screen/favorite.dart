import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/fonts/fontsize.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/view/favorite/controller/favoritecontroller.dart';
import 'package:task6/view/widgets/bottom_nav_bar.dart';
import 'package:task6/view/widgets/favoritecard.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.put(FavoriteController());
    controller.setScreenSize(context);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onpressed1: () => Get.offAllNamed('homepage'),
        onpressed2: () => Get.offAllNamed('favorite'),
        onpressed3: () => Get.toNamed('mycart'),
        onpressed5: () => Get.toNamed('profile'),
      ),
      backgroundColor: MyColors.backgroundcolor,
      body: Obx(() => Padding(
            padding: EdgeInsets.only(
              left: MyFontSize.f20(context),
              right: MyFontSize.f20(context),
              top: MyFontSize.f18h(context),
            ),
            child: SafeArea(
                child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed('homepage');
                      },
                      child: Container(
                        width: MyFontSize.f44(context),
                        height: MyFontSize.f44h(context),
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius:
                              BorderRadius.circular(MyFontSize.f44(context)),
                        ),
                        child: MyIcons.backIcon,
                      ),
                    ),
                    Text(
                      'Favourite',
                      style: TextStyle(
                          color: MyColors.textblackcolor,
                          fontSize: controller.screenWidth.value / 25.75,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('mycart'),
                      child: Container(
                        width: MyFontSize.f44(context),
                        height: MyFontSize.f44h(context),
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius:
                              BorderRadius.circular(MyFontSize.f44(context)),
                        ),
                        child: MyIcons.bag,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: controller.screenHeight.value * 0.02),
                GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: controller.screenHeight.value / 4.1,
                      crossAxisSpacing: controller.screenWidth.value / 20.6,
                      mainAxisSpacing: controller.screenHeight.value / 45.75),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    FavoriteCard(controller: controller),
                    FavoriteCard(controller: controller),
                    FavoriteCard(controller: controller),
                    FavoriteCard(controller: controller),
                  ],
                )
              ],
            )),
          )),
    );
  }
}
