import 'package:easycut/pages/home/home_page.dart';
import 'package:easycut/pages/salon/popular_salon_detail.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularSalon = "/popular-salon";

  static String getInitial() => '$initial';
  static String getPopularSalon(int pageId) => '$popularSalon?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularSalon,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularSalonDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}