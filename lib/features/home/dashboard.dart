// import 'package:alyamama_app/core/utils/colors.dart';
// import 'package:alyamama_app/core/utils/dimensions.dart';
// import 'package:alyamama_app/core/view_model/home_view_model.dart';
// import 'package:alyamama_app/core/widgets/back_icon_text_button.dart';
// import 'package:alyamama_app/core/widgets/big_text.dart';
// import 'package:alyamama_app/core/widgets/custom_app_bar.dart';
// import 'package:alyamama_app/core/widgets/main_button.dart';
// import 'package:alyamama_app/core/widgets/small_text.dart';
// import 'package:alyamama_app/features/home/views/add_members_view.dart';
// import 'package:alyamama_app/model/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DashboardView extends GetWidget<HomeViewModel> {
//   const DashboardView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         height: Dimensions.screenHeight,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const CustomAppBar(
//               loginView: false,
//               text: "Dashboard",
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: Dimensions.width10,
//                 vertical: Dimensions.height10,
//               ),
//               child: const BackIconTextButton(),
//             ),
//             Center(
//               child: Container(
//                 height: Dimensions.screenHeight * 0.23,
//                 width: Dimensions.screenWidth * 0.7,
//                 padding: EdgeInsets.all(Dimensions.height10),
//                 decoration: BoxDecoration(
//                   color: AppColors.mainColor,
//                   borderRadius: BorderRadius.circular(Dimensions.radius15),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MainButton(
//                       text: 'Change Security Company',
//                       color: Colors.black,
//                       onTap: () {},
//                     ),
//                     MainButton(
//                       text: 'Finish Day: DD-MM-YYYY',
//                       color: Colors.black,
//                       onTap: () {},
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Stack(
//                           alignment: Alignment.centerRight,
//                           children: [
//                             Container(
//                               height: Dimensions.height45,
//                               width: Dimensions.screenWidth * 0.3,
//                               alignment: Alignment.centerLeft,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: const Radius.circular(5),
//                                   bottomLeft: const Radius.circular(5),
//                                   topRight:
//                                       Radius.circular(Dimensions.radius20),
//                                   bottomRight:
//                                       Radius.circular(Dimensions.radius20),
//                                 ),
//                               ),
//                               child: const SmallText(
//                                 text: 'Net Total',
//                                 fontWeight: FontWeight.w400,
//                                 fontFamily: 'Montserrat',
//                               ),
//                             ),
//                             Container(
//                               height: Dimensions.height45,
//                               width: Dimensions.height64,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius:
//                                     BorderRadius.circular(Dimensions.radius15),
//                               ),
//                               child: const SmallText(
//                                 text: '6 KD',
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Montserrat',
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           height: Dimensions.height45,
//                           width: Dimensions.width70,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: BigText(
//                             text: 'Pay Now',
//                             size: Dimensions.font12,
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 left: Dimensions.width20,
//                 right: Dimensions.width20,
//                 top: Dimensions.height15,
//                 bottom: Dimensions.height10,
//               ),
//               child: const SmallText(
//                 text: 'A report on the library of recognized faces',
//                 color: AppColors.mainColor,
//                 fontFamily: 'OpenSans',
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: Dimensions.width20,
//               ),
//               child: Container(
//                 height: Dimensions.screenHeight * 0.19,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: AppColors.mainColor,
//                   ),
//                 ),
//                 child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('Users')
//                       .doc(controller.userData!.userId)
//                       .snapshots(
//                         includeMetadataChanges: true,
//                       ),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return const Text('Error happened');
//                     }
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CupertinoActivityIndicator(),
//                       );
//                     }
//                     int? actualReport;
//                     if (snapshot.hasData) {
//                       var data = snapshot.data!.data();
//                       actualReport = data!['report'];
//                     }
//                     print(actualReport);
//                     return GetX<HomeViewModel>(
//                       builder: (report) {
//                         report.getReportData(actualReport!);
//                         return Column(
//                           children: [
//                             RadioMenuButton(
//                               value: report.daily.value,
//                               groupValue: true,
//                               onChanged: (value) {
//                                 report.changeToDaily();
//                               },
//                               child: SmallText(
//                                 text: 'Daily',
//                                 fontFamily: 'OpenSans',
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.mainColor,
//                                 size: Dimensions.font16,
//                               ),
//                             ),
//                             RadioMenuButton(
//                               value: report.weekly.value,
//                               groupValue: true,
//                               onChanged: (value) {
//                                 report.changeToWeekly();
//                               },
//                               child: SmallText(
//                                 text: 'Weekly',
//                                 fontFamily: 'OpenSans',
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.mainColor,
//                                 size: Dimensions.font16,
//                               ),
//                             ),
//                             RadioMenuButton(
//                               value: report.monthly.value,
//                               groupValue: true,
//                               onChanged: (value) {
//                                 report.changeToMonthly();
//                               },
//                               child: SmallText(
//                                 text: 'Monthly',
//                                 fontFamily: 'OpenSans',
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.mainColor,
//                                 size: Dimensions.font16,
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//             FutureBuilder(
//               future: FirebaseFirestore.instance
//                   .collection('Users')
//                   .doc(controller.userData!.userId)
//                   .get(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return const Text('Some Error Happened when getting Data');
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CupertinoActivityIndicator(),
//                   );
//                 }
//
//                 UserModel? userModel;
//                 if (snapshot.hasData) {
//                   userModel = UserModel.fromJson(snapshot.data!.data());
//                 }
//
//                 return userModel!.membersId!.length <
//                         userModel.numberFamilyMembers!
//                     ? Padding(
//                         padding: EdgeInsets.only(
//                           top: Dimensions.height10,
//                           left: Dimensions.width45,
//                           right: Dimensions.width45,
//                         ),
//                         child: MainButton(
//                           text: 'Add Members',
//                           onTap: () {
//                             Get.to(() => const AddMembersView());
//                           },
//                         ),
//                       )
//                     : const SizedBox();
//               },
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: Dimensions.height10,
//                 left: Dimensions.width45,
//                 right: Dimensions.width45,
//               ),
//               child: MainButton(
//                 text: 'Reset The System',
//                 onTap: () {},
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: Dimensions.height10,
//                 left: Dimensions.width45,
//                 right: Dimensions.width45,
//               ),
//               child: MainButton(
//                 text: 'Start New Training Period',
//                 onTap: () {},
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: Dimensions.height10,
//                 left: Dimensions.width45,
//                 right: Dimensions.width45,
//               ),
//               child: MainButton(
//                 text: 'Press to Pause System',
//                 onTap: () {},
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
