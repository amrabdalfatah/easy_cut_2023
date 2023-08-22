import 'package:easycut/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  @override
  checkCode() {
    Get.toNamed(AppRoute.resetPassword);
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
