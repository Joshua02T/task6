import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyIcons {
  static String rootIcon = 'assets/icons/';
  static SvgPicture backIcon = SvgPicture.asset('${rootIcon}apps-circle.svg');
  static SvgPicture bag = SvgPicture.asset('${rootIcon}bag.svg');

  static SvgPicture exploreVectors = SvgPicture.asset('${rootIcon}vectors.svg');
  static SvgPicture hamburger = SvgPicture.asset('${rootIcon}Hamburger.svg');

  static SvgPicture searchIcon = SvgPicture.asset('${rootIcon}search.svg');
  static SvgPicture filterIcon = SvgPicture.asset('${rootIcon}filter.svg');
  static SvgPicture heartoutlined = SvgPicture.asset('${rootIcon}heart.svg');
  static SvgPicture heartfilled =
      SvgPicture.asset('${rootIcon}heartfilled.svg');
  static SvgPicture pluscard = SvgPicture.asset('${rootIcon}pluscard.svg');
  static SvgPicture newarrival = SvgPicture.asset('${rootIcon}newarrival.svg');
  static SvgPicture vectorarrival =
      SvgPicture.asset('${rootIcon}vectorarrival.svg');
  static Image heartDetails = Image.asset(
    '${rootIcon}heartdetails.png',
    width: 24,
    height: 24,
  );
  static Image bagdetails = Image.asset('${rootIcon}bag-2.png');
  static Image trash = Image.asset('${rootIcon}trash.png');
  static Image profilepen = Image.asset('${rootIcon}profilepen.png');
  //profile icons
  static String rootProfileIcon = 'assets/profileicons/';

  static SvgPicture profilebag =
      SvgPicture.asset('${rootProfileIcon}profilebag.svg');
  static Image profileheart = Image.asset('${rootProfileIcon}profileheart.png');
  static SvgPicture profileicon =
      SvgPicture.asset('${rootProfileIcon}profileicon.svg');
  static Image profilenoti = Image.asset('${rootProfileIcon}profilenoti.png');
  static Image profileorder = Image.asset('${rootProfileIcon}profileorder.png');
  static Image profileout = Image.asset('${rootProfileIcon}profileout.png');
  static Image profilesettings =
      Image.asset('${rootProfileIcon}profilesettings.png');
}
