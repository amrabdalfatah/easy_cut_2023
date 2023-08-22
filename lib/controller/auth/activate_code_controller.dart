import 'package:easycut/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class ActivateCodeController extends GetxController {
  checkCode();
}

class ActivateCodeControllerImp extends ActivateCodeController {
  @override
  checkCode() {
    Get.toNamed(AppRoute.success);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
