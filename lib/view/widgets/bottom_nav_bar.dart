import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task6/constants/colors/colors.dart';
import 'package:task6/view/widgets/bmb_custom_painter.dart';

class BottomNavBar extends StatelessWidget {
  final Function()? onpressed1;
  final Function()? onpressed2;
  final Function()? onpressed3;
  final Function()? onpressed4;
  final Function()? onpressed5;
  final bool isSelectedHome;
  final bool isSelectedFavourite;

  const BottomNavBar({
    super.key,
    this.onpressed1,
    this.onpressed2,
    this.onpressed3,
    this.onpressed4,
    this.onpressed5,
    this.isSelectedHome = false, // Default value
    this.isSelectedFavourite = false, // Default value
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CustomPaint(
          size: Size(screenWidth, screenHeight * 0.12),
          painter: BMBCustomPainter(),
        ),
        Center(
          heightFactor: 1.3,
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: MyColors.green,
            child: Icon(
              Ionicons.bag_handle_outline,
              size: 25,
              color: MyColors.white,
            ),
            onPressed: onpressed3,
          ),
        ),
        Container(
          width: screenWidth,
          height: screenHeight * 0.125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onpressed1,
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                  color:
                      isSelectedHome ? MyColors.green : MyColors.textblackcolor,
                ),
              ),
              IconButton(
                onPressed: onpressed2,
                icon: Icon(
                  Ionicons.heart_outline,
                  size: 30,
                  color: isSelectedFavourite
                      ? MyColors.green
                      : MyColors.textblackcolor,
                ),
              ),
              SizedBox(
                width: screenWidth * 0.15,
              ),
              IconButton(
                onPressed: onpressed4,
                icon: Icon(Ionicons.notifications_outline, size: 30),
              ),
              IconButton(
                icon: Icon(
                  Ionicons.person_outline,
                  size: 30,
                ),
                onPressed: onpressed5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
