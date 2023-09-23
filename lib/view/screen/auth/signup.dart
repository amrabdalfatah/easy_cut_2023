import 'package:easycut/controller/auth/signup_controller.dart';
import 'package:easycut/core/class/handling_data_view.dart';
import 'package:easycut/core/constant/color.dart';
import 'package:easycut/core/constant/dimensions.dart';
import 'package:easycut/core/functions/alert_exit.dart';
import 'package:easycut/core/functions/valid_input.dart';
import 'package:easycut/core/shared/widgets/small_text.dart';
import 'package:easycut/view/widget/auth/custom_button_auth.dart';
import 'package:easycut/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExit,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width15,
            vertical: Dimensions.height15,
          ),
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) {
              return HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      CustomTextFormAuth(
                        myController: controller.name,
                        valid: (val) {
                          return validInput(val!, 10, 40, 'any');
                        },
                        type: TextInputType.text,
                        hintText: "35".tr,
                        prefixIcon: Icons.person,
                      ),
                      CustomTextFormAuth(
                        myController: controller.email,
                        valid: (val) {
                          return validInput(val!, 15, 100, 'email');
                        },
                        type: TextInputType.emailAddress,
                        hintText: "17".tr,
                        prefixIcon: Icons.email,
                      ),
                      CustomTextFormAuth(
                        myController: controller.password,
                        valid: (val) {
                          return validInput(val!, 6, 30, 'password');
                        },
                        type: TextInputType.visiblePassword,
                        obSecure: controller.isShowPassword,
                        hintText: "18".tr,
                        prefixIcon: Icons.lock,
                        suffixIcon: controller.isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        suffixPressed: () {
                          controller.showPassword();
                        },
                      ),
                      CustomTextFormAuth(
                        myController: controller.phone,
                        valid: (val) {
                          return null;
                        },
                        type: TextInputType.phone,
                        hintText: "36".tr,
                        prefixIcon: Icons.phone_android,
                      ),
                      CustomTextFormAuth(
                        myController: controller.country,
                        valid: (val) {
                          return null;
                        },
                        type: TextInputType.text,
                        hintText: "Country",
                        prefixIcon: Icons.flag,
                      ),
                      CustomTextFormAuth(
                        myController: controller.city,
                        valid: (val) {
                          return null;
                        },
                        type: TextInputType.text,
                        hintText: "Government",
                        prefixIcon: Icons.location_city,
                      ),
                      CustomTextFormAuth(
                        myController: controller.address,
                        valid: (val) {
                          return null;
                        },
                        type: TextInputType.text,
                        hintText: "State",
                        prefixIcon: Icons.location_on,
                      ),
                      Container(
                        height: Dimensions.height60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: const Border(
                            top: BorderSide(
                              color: AppColor.grey,
                              width: 1,
                            ),
                            left: BorderSide(
                              color: AppColor.grey,
                              width: 1,
                            ),
                            right: BorderSide(
                              color: AppColor.grey,
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: AppColor.grey,
                              width: 1,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Icon(
                                Icons.person_pin,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            Expanded(
                              child: GetBuilder<SignUpControllerImp>(
                                builder: (con) {
                                  return DropdownButton(
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: AppColor.primaryColor,
                                    ),
                                    underline: const SizedBox(),
                                    value: con.gender,
                                    items: [
                                      DropdownMenuItem(
                                        value: Gender.gender,
                                        onTap: () {},
                                        child: Text(
                                          '38'.tr,
                                          style: const TextStyle(
                                            color: AppColor.grey,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Gender.male,
                                        onTap: () {},
                                        child: Text(
                                          '39'.tr,
                                          style: const TextStyle(
                                            color: AppColor.grey,
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Gender.female,
                                        onTap: () {},
                                        child: Text(
                                          '40'.tr,
                                          style: const TextStyle(
                                            color: AppColor.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      con.changeGender(value!);
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButtonAuth(
                          onPressed: () async {
                            XFile? xFile = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                            );
                            controller.addFilePath(xFile!.path);
                          },
                          text: "Select Image",
                        ),
                      ),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.signUp();
                        },
                        text: "22".tr,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmallText(
                            text: "37".tr,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.goBackLogin();
                            },
                            child: SmallText(
                              text: "20".tr,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
