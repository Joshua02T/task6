import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/constdata.dart';
import 'package:task6/constants/fonts/fontsize.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/view/home/controller/homecontroller.dart';
import 'package:task6/view/widgets/arrivals.dart';
import 'package:task6/view/widgets/bottom_nav_bar.dart';
import 'package:task6/view/widgets/categoryhomepage.dart';
import 'package:task6/view/widgets/homepagecard.dart';
import 'package:task6/view/widgets/searchbox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Get.put(HomeController(), permanent: true);
    controller.setScreenSize(context);
    return Scaffold(
        bottomNavigationBar: BottomNavBar(
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
                child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Get.toNamed('sidemenu');
                      },
                      child: MyIcons.hamburger),
                  Row(
                    children: [
                      Transform.translate(
                        offset: Offset(0, controller.screenWidth.value * -0.05),
                        child: MyIcons.exploreVectors,
                      ),
                      Text(
                        'Explore',
                        style: TextStyle(
                            color: MyColors.textblackcolor,
                            fontSize: MyFontSize.f32(context),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('mycart');
                    },
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
              SizedBox(height: controller.screenHeight.value * 0.03),
              SearchBox(controller: controller),
              SizedBox(height: controller.screenHeight.value * 0.03),
              Text('Select Category',
                  style: TextStyle(
                      fontSize: controller.screenWidth.value * 0.04,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: controller.screenHeight.value * 0.02),
              Obx(() {
                if (ConstData.isLoading.value) {
                  return Center(
                      child: CircularProgressIndicator(color: MyColors.green));
                }
                return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                        spacing: controller.screenWidth.value * 0.02,
                        children: controller.categories.map((category) {
                          return CategoryButton(
                            controller: controller,
                            text: category.name,
                            onTap: () => controller
                                .filterProductsByCategory(category.name),
                          );
                        }).toList()));
              }),
              SizedBox(height: controller.screenHeight.value * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular T-shirt',
                      style: TextStyle(
                          fontSize: controller.screenWidth.value * 0.04,
                          fontWeight: FontWeight.w500)),
                  Text('See all',
                      style: TextStyle(
                          fontSize: controller.screenWidth.value * 0.03,
                          color: MyColors.green,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'poppins')),
                ],
              ),
              SizedBox(height: controller.screenHeight.value * 0.02),
              SizedBox(
                height: 215,
                width: 157,
                child: ConstData.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.green))
                    : ListView.builder(
                        itemCount: controller.filteredProducts.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = controller.filteredProducts[index];
                          return Row(
                            children: [
                              ProductCard(
                                controller: controller,
                                data: product,
                              ),
                              SizedBox(
                                width: controller.screenWidth.value * 0.04,
                              )
                            ],
                          );
                        },
                      ),
              ),
              SizedBox(height: controller.screenHeight.value * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Arrivals',
                      style: TextStyle(
                          fontSize: controller.screenWidth.value * 0.04,
                          fontWeight: FontWeight.w600)),
                  Text('See all',
                      style: TextStyle(
                          fontSize: controller.screenWidth.value * 0.03,
                          color: MyColors.green,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'poppins')),
                ],
              ),
              SizedBox(height: controller.screenHeight.value * 0.02),
              NewArrival(controller: controller)
            ])))));
  }
}
