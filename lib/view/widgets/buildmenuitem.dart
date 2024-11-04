import 'package:flutter/material.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/view/sidemenu/controller/sidemenucontroller.dart';

Widget buildMenuItem({
  required Image icon,
  required SideMenuController controller,
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: icon,
    title: Text(title,
        style: TextStyle(
            color: MyColors.white,
            fontSize: controller.screenWidth.value / 25.75)),
    onTap: onTap,
    contentPadding: EdgeInsets.zero,
    trailing: Icon(
      Icons.arrow_forward_ios_rounded,
      color: MyColors.white,
      size: controller.screenWidth.value / 25,
    ),
    horizontalTitleGap: controller.screenWidth.value / 27.5,
  );
}
