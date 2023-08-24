import 'package:easycut/core/services/services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? name;
  String? id;

  initialData() {
    name = myServices.sharedPreferences.getString('name');
    id = myServices.sharedPreferences.getString('id');
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
