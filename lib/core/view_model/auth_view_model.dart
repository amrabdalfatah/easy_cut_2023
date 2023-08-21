import 'package:easycut/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  // final LocalStorageData localStorageData = Get.find();
  String countryKey = '+20';
  var shownPassword = true.obs;
  var action = false.obs;
  String email = '', password = '', name = '';
  String confirmPassword = '';
  String phone = '';
  String userId = '';
  var isVerified = false.obs;

  Future<void> scanQR() async {
    try {
      Get.snackbar(
        'Camera Attention',
        'This camera is registered to its owner \ntry another camera',
        snackPosition: SnackPosition.TOP,
      );
      Get.off(() => Login());
    } catch (e) {
      Get.snackbar(
        'Auth',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.red,
      );
    }
    update();
  }

  // This method to change Password from visible to un_visible
  void changeShownPassword() {
    shownPassword.value = !shownPassword.value;
  }

  // Method to sign with email and password
  void signInWithEmailAndPassword() async {
    // action.value = true;
    // try {
    //   await _auth
    //       .signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   )
    //       .then((value) async {
    //     AppConstants.loginId = value.user!.uid;
    //     if (await FireStoreUser().checkUser(value.user!.uid)) {
    //       AppConstants.typePerson = TypePerson.owner;
    //       if (value.user!.emailVerified) {
    //         AppConstants.userId = value.user!.uid;
    //         UserModel? userData;
    //         await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
    //           userData =
    //               UserModel.fromJson(value.data() as Map<dynamic, dynamic>?);
    //         }).whenComplete(() async {
    //           if (userData!.isVerified!) {
    //             action.value = false;
    //             Get.to(() => const HomeView());
    //             // Get.to(() => const FaceAuthenticateView());
    //           } else {
    //
    //             await FireStoreUser()
    //                 .updateUserInfo(
    //               userModel: userData!,
    //               key: 'isVerified',
    //               value: true,
    //             )
    //                 .then((value) async {
    //               await FireStoreCamera().updateSettingsCamera(
    //                 key: 'finished',
    //                 value: false,
    //                 cameraId: userData!.cameraId!,
    //                 document: 'training_results',
    //               );
    //             });
    //             action.value = false;
    //             Get.to(() => const HomeView());
    //             // Get.to(() => const FaceAuthenticateView());
    //           }
    //         });
    //       } else {
    //         action.value = false;
    //         Get.snackbar(
    //           'Verify',
    //           'Please Verify your email via going to inbox and verify it',
    //           snackPosition: SnackPosition.BOTTOM,
    //           colorText: Colors.deepOrange,
    //         );
    //       }
    //     } else if (await FireStoreMember().checkMember(value.user!.uid)) {
    //       AppConstants.typePerson = TypePerson.member;
    //       action.value = false;
    //       Get.offAll(() => const HomeView());
    //     } else {
    //       AppConstants.typePerson = TypePerson.securityCompany;
    //       action.value = false;
    //       Get.offAll(() => const SecurityPage());
    //     }
    //   });
    // } catch (e) {
    //   action.value = false;
    //   Get.snackbar(
    //     'Error Login',
    //     e.toString(),
    //     snackPosition: SnackPosition.BOTTOM,
    //     colorText: Colors.red,
    //   );
    // }
  }

  Future<void> createAccountWithEmailAndPassword() async {
    // action.value = true;
    // try {
    //   action.value = true;
    //   await _auth
    //       .createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   )
    //       .then((user) async {
    //     userId = user.user!.uid;
    //     UserModel userModel = UserModel(
    //       userId: userId,
    //       email: email,
    //       phone: '$countryKey$phone',
    //       firstName: firstName,
    //       lastName: lastName,
    //       image: '',
    //       cameraName: cameraName,
    //       dateOfBirth: '${month.value}, ${day.value}, ${year.value}',
    //       address: {
    //         'Latitude': latitude.value,
    //         'Longitude': longitude.value,
    //       },
    //       cameraId: AppConstants.cameraId,
    //       securityCompany: securityCompany,
    //       numberFamilyMembers: numberFamilyMembers,
    //       trainingHours: trainingHours,
    //       isVerified: user.user!.emailVerified,
    //       membersId: [],
    //       faceId: '',
    //       report: 3,
    //     );
    //     await FireStoreUser().addUserToFirestore(userModel).then((value) {
    //       action.value = false;
    //       Get.snackbar(
    //         'Successfully',
    //         'Create User Successfully, \nYou can now verify your email first and then login',
    //         snackPosition: SnackPosition.TOP,
    //         colorText: Colors.green,
    //       );
    //     });
    //     await FireStoreCaseAlert().startCaseAlert(
    //       cameraId: AppConstants.cameraId!,
    //       userId: userId,
    //     );
    //     await FireStoreCamera().updateCamera(
    //       cameraId: AppConstants.cameraId!,
    //       key: 'userId',
    //       value: userId,
    //     );
    //     await FireStoreCamera().updateSettingsCamera(
    //       key: 'mode',
    //       value: 'manual',
    //       cameraId: AppConstants.cameraId!,
    //       document: 'training',
    //     );
    //     await FireStoreCamera().updateSettingsCamera(
    //       key: 'num_faces',
    //       value: numberFamilyMembers + 1,
    //       cameraId: AppConstants.cameraId!,
    //       document: 'training',
    //     );
    //     await FireStoreCamera().updateSettingsCamera(
    //       key: 'training_time',
    //       value: trainingHours,
    //       cameraId: AppConstants.cameraId!,
    //       document: 'training',
    //     );
    //     await FireStoreCamera().updateSettingsCamera(
    //       key: 'required_num_faces',
    //       value: numberFamilyMembers + 1,
    //       cameraId: AppConstants.cameraId!,
    //       document: 'training_results',
    //     );
    //     action.value = false;
    //     await user.user!.sendEmailVerification();
    //     return user;
    //   });
    // } catch (e) {
    //   action.value = false;
    //   Get.snackbar(
    //     'Error Register',
    //     e.toString(),
    //   );
    // }
  }

  String emailPasswordReset = '';

  void forgetPassword() async {
    // await _auth.sendPasswordResetEmail(email: emailPasswordReset);
  }

  // Map Controller
  // LocationData? locationData;
  // var markers = RxSet<Marker>();
  // var isLoading = false.obs;
  // var longitude = 0.0.obs;
  // var latitude = 0.0.obs;
  //
  // fetchLocation() async {
  //   try {
  //     isLoading(true);
  //     locationData = await getLocationData();
  //     longitude.value = locationData!.longitude!;
  //     latitude.value = locationData!.latitude!;
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error while getting data',
  //       e.toString(),
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.red,
  //     );
  //   } finally {
  //     isLoading(false);
  //     createMarkers();
  //   }
  // }
  //
  // createMarkers() {
  //   markers.add(
  //     Marker(
  //       markerId: const MarkerId('Location'),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //       position: LatLng(latitude.value, longitude.value),
  //       onTap: () {},
  //     ),
  //   );
  // }
  //
  // getLocationData() async {
  //   Location location = Location();
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //   LocationData locationData;
  //
  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (serviceEnabled) {
  //       return;
  //     }
  //   }
  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //   locationData = await location.getLocation();
  //   return locationData;
  // }
}
