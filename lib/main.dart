import 'package:easycut/controllers/popular_product_controller.dart';
import 'package:easycut/controllers/recommended_product_controller.dart';
import 'package:easycut/pages/salon/booking_salon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Cut',
      home: const BookingSalon(),
      // initialRoute: RouteHelper.initial,
      // getPages: RouteHelper.routes,
    );
  }
}
