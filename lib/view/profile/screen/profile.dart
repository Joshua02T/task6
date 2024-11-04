import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/constants/fonts/fontsize.dart';
import 'package:task6/constants/icons/icons.dart';
import 'package:task6/constants/images/images.dart';
import 'package:task6/view/profile/controller/profilecontroller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    controller.setScreenSize(context);
    return Scaffold(
        backgroundColor: MyColors.white,
        body: Padding(
          padding: EdgeInsets.only(
              left: MyFontSize.f20(context),
              right: MyFontSize.f20(context),
              top: MyFontSize.f18h(context)),
          child: SafeArea(
              child: ListView(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: controller.screenWidth.value * 0.12,
                      height: controller.screenWidth.value * 0.12,
                      decoration: BoxDecoration(
                        color: MyColors.sidemenudividerwhite,
                        borderRadius: BorderRadius.circular(
                            controller.screenWidth.value * 0.06),
                      ),
                      child: MyIcons.backIcon,
                    ),
                  ),
                  SizedBox(width: controller.screenWidth.value * 0.255),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: MyFontSize.f20(context),
                      color: MyColors.textblackcolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: controller.screenHeight.value / 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(MyImages.profileImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: controller.screenWidth.value / 2.88,
                    child: Container(
                      width: controller.screenWidth.value / 20.6,
                      height: controller.screenHeight.value / 45.75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(
                            color: MyColors.white,
                            width: controller.screenWidth.value / 206),
                      ),
                      child: MyIcons.profilepen,
                    ),
                  ),
                ],
              ),
              SizedBox(height: controller.screenHeight.value / 22),
              Text(
                'Your Name',
                style: TextStyle(
                    fontSize: MyFontSize.f16(context),
                    color: MyColors.lightgreycolor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: controller.screenHeight.value * 0.02),
              TextField(
                keyboardType: TextInputType.name,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: MyFontSize.f14(context)),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: controller.screenWidth.value * 0.03,
                        vertical: controller.screenHeight.value * 0.025),
                    fillColor: MyColors.sidemenudividerwhite,
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(
                            controller.screenWidth.value / 30)))),
              ),
              SizedBox(height: controller.screenHeight.value / 40),
              Text(
                'Email Address',
                style: TextStyle(
                    fontSize: MyFontSize.f16(context),
                    color: MyColors.lightgreycolor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: controller.screenHeight.value * 0.02),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: MyFontSize.f14(context)),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: controller.screenWidth.value * 0.03,
                        vertical: controller.screenHeight.value * 0.025),
                    fillColor: MyColors.sidemenudividerwhite,
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(
                            controller.screenWidth.value / 30)))),
              ),
              SizedBox(height: controller.screenHeight.value / 20),
              Text(
                'Password',
                style: TextStyle(
                    fontSize: MyFontSize.f16(context),
                    color: MyColors.lightgreycolor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: controller.screenHeight.value * 0.02),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: MyFontSize.f20(context),
                    color: MyColors.grey),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: controller.screenWidth.value * 0.03,
                        vertical: controller.screenHeight.value * 0.02),
                    fillColor: MyColors.sidemenudividerwhite,
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(
                            controller.screenWidth.value / 30)))),
              ),
              SizedBox(height: controller.screenHeight.value * 0.01),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Recovery Password',
                  style: TextStyle(
                      fontSize: MyFontSize.f12(context),
                      fontFamily: 'poppins',
                      color: MyColors.lightgreycolor),
                ),
              ),
              SizedBox(height: controller.screenHeight.value * 0.05),
              MaterialButton(
                onPressed: () {},
                minWidth: controller.screenWidth.value / 1.23,
                height: controller.screenHeight.value / 18.3,
                color: MyColors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        controller.screenWidth.value / 34.33)),
                child: Text(
                  'Save Now',
                  style: TextStyle(
                      fontSize: MyFontSize.f16(context),
                      color: MyColors.white,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )),
        ));
  }
}
