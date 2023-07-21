import 'package:easycut/old/controllers/popular_product_controller.dart';
import 'package:easycut/old/controllers/recommended_product_controller.dart';
import 'package:easycut/old/data/api/api_client.dart';
import 'package:easycut/old/data/repository/popular_product_repo.dart';
import 'package:easycut/old/data/repository/recommended_product_repo.dart';
import 'package:easycut/old/utils/constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  // repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}