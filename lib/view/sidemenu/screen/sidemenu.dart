import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/fonts/fontsize.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/constants/images/images.dart';
import 'package:task6/view/favorite/screen/favorite.dart';
import 'package:task6/view/mycart/screen/mycart.dart';
import 'package:task6/view/profile/screen/profile.dart';
import 'package:task6/view/sidemenu/controller/sidemenucontroller.dart';
import 'package:task6/view/widgets/buildmenuitem.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    SideMenuController controller = Get.put(SideMenuController());
    controller.setScreenSize(context);
    return Scaffold(
      backgroundColor: MyColors.profilebg,
      body: Padding(
        padding: EdgeInsets.only(
          left: controller.screenWidth.value / 13.8,
          right: controller.screenWidth.value / 13.8,
          top: controller.screenHeight.value / 12.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                  radius: controller.screenWidth.value / 10.3,
                  backgroundImage: AssetImage(MyImages.profileImage)),
              SizedBox(height: controller.screenHeight.value / 114.375),
              Text('Programmer X',
                  style: TextStyle(
                    fontSize: MyFontSize.f20(context),
                    color: MyColors.white,
                  ))
            ]),
            SizedBox(height: controller.screenHeight.value / 45.75),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: MyIcons.profileicon,
                    title: Text('Profile',
                        style: TextStyle(
                            color: MyColors.white,
                            fontSize: controller.screenWidth.value / 25.75)),
                    onTap: () {
                      Get.to(() => const Profile(),
                          transition: Transition.fade);
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: MyColors.white,
                      size: controller.screenWidth.value / 25,
                    ),
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: controller.screenWidth.value / 27.5,
                  ),
                  ListTile(
                    leading: MyIcons.profilebag,
                    title: Text('My Cart',
                        style: TextStyle(
                            color: MyColors.white,
                            fontSize: controller.screenWidth.value / 25.75)),
                    onTap: () {
                      Get.to(() => MyCart(), transition: Transition.fade);
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: MyColors.white,
                      size: controller.screenWidth.value / 25,
                    ),
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: controller.screenWidth.value / 27.5,
                  ),
                  buildMenuItem(
                    controller: controller,
                    icon: MyIcons.profileheart,
                    title: 'Favorite',
                    onTap: () {
                      Get.to(() => const Favorite(),
                          transition: Transition.fade);
                    },
                  ),
                  buildMenuItem(
                    controller: controller,
                    icon: MyIcons.profileorder,
                    title: 'Orders',
                    onTap: () {},
                  ),
                  buildMenuItem(
                    controller: controller,
                    icon: MyIcons.profilenoti,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  buildMenuItem(
                    controller: controller,
                    icon: MyIcons.profilesettings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  Divider(
                      color: MyColors.sidemenudividerwhite,
                      thickness: controller.screenWidth.value / 206),
                  ListTile(
                    leading: MyIcons.profileout,
                    title: Text('Sign Out',
                        style: TextStyle(
                            color: MyColors.white,
                            fontSize: controller.screenWidth.value / 25.75)),
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: controller.screenWidth.value / 27.5,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
