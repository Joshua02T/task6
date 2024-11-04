import 'package:flutter/material.dart';

class MyImages {
  static String rootImage = 'assets/images/';
  static Image tshirt = Image.asset(
    '${rootImage}tshirt.png',
    width: 93,
  );
  static Image tshirtarrival = Image.asset(
    '${rootImage}tshirtarrival.png',
  );
  static Image tshirtdetails = Image.asset(
    '${rootImage}imagedetails.png',
    width: 217,
    height: 220,
  );
  static Image ellipse = Image.asset(
    '${rootImage}Ellipse.png',
    width: 325,
    height: 340,
  );
  static Image image2 = Image.asset(
    '${rootImage}image2.png',
    width: 40,
    height: 40,
  );
  static Image image3 = Image.asset(
    '${rootImage}image3.png',
  );

  static String profileImage = '${rootImage}profileimage.png';
}
