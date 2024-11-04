import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task6/view/details/screen/details.dart';
import 'package:task6/view/favorite/screen/favorite.dart';
import 'package:task6/view/home/screen/homepage.dart';
import 'package:task6/view/mycart/screen/mycart.dart';
import 'package:task6/view/profile/screen/profile.dart';
import 'package:task6/view/sidemenu/screen/sidemenu.dart';

class Routes {
  static const String details = '/details';
  static const String homepage = '/homepage';
  static const String favorite = '/favorite';
  static const String mycart = '/mycart';
  static const String sidemenu = '/sidemenu';
  static const String profile = '/profile';

  static final List<GetPage> pages = [
    GetPage(
        name: '/details',
        page: () => const Details(),
        transition: Transition.fade),
    GetPage(name: '/homepage', page: () => const HomePage()),
    GetPage(
        name: '/favorite',
        page: () => const Favorite(),
        transition: Transition.fade),
    GetPage(
        name: '/mycart',
        page: () => const MyCart(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: '/sidemenu',
        page: () => const SideMenu(),
        transition: Transition.leftToRightWithFade),
    GetPage(name: '/profile', page: () => const Profile()),
  ];
}
