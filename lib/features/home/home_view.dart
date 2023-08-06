//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeViewModel>(
//       init: HomeViewModel(),
//       builder: (controller) {
//         return controller.dataLoaded.value
//             ? Scaffold(
//                 body: SizedBox(
//                   height: Dimensions.screenHeight,
//                   child: Column(
//                     children: [
//                       CustomAppBar(
//                         loginView: false,
//                         text:
//                             "Marhaba, ${controller.isOwner ? controller.userData!.firstName : controller.memberData!.firstName}",
//                       ),
//                       SizedBox(
//                         height: Dimensions.height30,
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                             right: Dimensions.width15,
//                           ),
//                           child: GestureDetector(
//                             onTap: () {
//                               controller.signOut();
//                               Get.offAll(() => LoginView());
//                               Get.put(AuthViewModel());
//                             },
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 SmallText(
//                                   text: 'Logout',
//                                   color: Colors.red,
//                                   size: Dimensions.font16,
//                                 ),
//                                 SizedBox(
//                                   width: Dimensions.width15,
//                                 ),
//                                 const Icon(
//                                   Icons.logout,
//                                   color: Colors.red,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: Dimensions.width10,
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               StreamBuilder(
//                                 stream: FirebaseFirestore.instance
//                                     .collection('CaseAlert')
//                                     .doc('x7Cj6cLzWGnwrakRYvLY')
//                                     .snapshots(includeMetadataChanges: true),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.hasError) {
//                                     return const Text('Something went wrong');
//                                   }
//
//                                   if (snapshot.connectionState ==
//                                       ConnectionState.waiting) {
//                                     return const Text("Loading");
//                                   }
//
//                                   controller.caseAlert =
//                                       CaseAlertModel.fromJson(
//                                           snapshot.data!.data());
//
//                                   if (controller.caseAlert!.alertType ==
//                                       'securityBreach') {
//                                     controller
//                                         .startTimer(controller.caseAlert!);
//                                   } else {
//                                     controller.stopTimer();
//                                   }
//
//                                   switch (controller.caseAlert!.alertType) {
//                                     case 'training':
//                                       return const TrainingAlert();
//
//                                     case 'noAlert':
//                                       return const NoAlert();
//                                     case 'securityBreach':
//                                       return GestureDetector(
//                                         onTap: () {
//                                           controller.stopTimer();
//                                           Get.to(
//                                             () => SecurityBreachView(
//                                               caseAlert: controller.caseAlert!,
//                                             ),
//                                           );
//                                         },
//                                         child: const AlertReported(),
//                                       );
//                                     case 'sendSecurity':
//                                       return const AlertCalledSecurity();
//                                     default:
//                                       return const AlertTimer();
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: Dimensions.height10),
//                               const BatteryStatus(),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: Dimensions.height10),
//                       Container(
//                         height: Dimensions.screenHeight / 3,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: Dimensions.width30,
//                         ),
//                         decoration: BoxDecoration(
//                           color: AppColors.mainColor,
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(Dimensions.radius15),
//                             topLeft: Radius.circular(Dimensions.radius15),
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 Get.to(() => const LiveVideoView());
//                               },
//                               child: Container(
//                                 height: Dimensions.height45,
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: Dimensions.width30,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.circular(
//                                       Dimensions.radius15),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     BigText(
//                                       text: 'Live Video',
//                                       fontFamily: 'OpenSans',
//                                       size: Dimensions.font32,
//                                     ),
//                                     const Icon(
//                                       Icons.online_prediction,
//                                       color: Colors.white,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             controller.isOwner
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       Get.to(() => const DashboardView());
//                                     },
//                                     child: Container(
//                                       height: Dimensions.height45,
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: Dimensions.width30,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Colors.black,
//                                         borderRadius: BorderRadius.circular(
//                                             Dimensions.radius15),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           BigText(
//                                             text: 'Dashboard',
//                                             fontFamily: 'OpenSans',
//                                             size: Dimensions.font32,
//                                           ),
//                                           const Icon(
//                                             Icons.dashboard,
//                                             color: Colors.white,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 : const SizedBox(),
//                             controller.isOwner
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       Get.to(() => ManageFacesView());
//                                     },
//                                     child: Container(
//                                       height: Dimensions.height45,
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: Dimensions.width30,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Colors.black,
//                                         borderRadius: BorderRadius.circular(
//                                             Dimensions.radius15),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           BigText(
//                                             text: 'Manage Faces',
//                                             fontFamily: 'OpenSans',
//                                             size: Dimensions.font32,
//                                           ),
//                                           const Icon(
//                                             Icons.face,
//                                             color: Colors.white,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 : const SizedBox(),
//                             controller.isOwner
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       Get.to(() => const EventHistoryView());
//                                     },
//                                     child: Container(
//                                       height: Dimensions.height45,
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: Dimensions.width30,
//                                       ),
//                                       decoration: BoxDecoration(
//                                         color: Colors.black,
//                                         borderRadius: BorderRadius.circular(
//                                             Dimensions.radius15),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           BigText(
//                                             text: 'Event History',
//                                             fontFamily: 'OpenSans',
//                                             size: Dimensions.font32,
//                                           ),
//                                           const Icon(
//                                             Icons.calendar_today_sharp,
//                                             color: Colors.white,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 : const SizedBox(),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             : const Scaffold(
//                 body: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//       },
//     );
//   }
// }
