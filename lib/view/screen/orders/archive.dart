import 'package:easycut/controller/orders/archive_controller.dart';
import 'package:easycut/controller/orders/pending_controller.dart';
import 'package:easycut/core/class/handlingdataview.dart';
import 'package:easycut/view/widget/orders/orderslistcard.dart';
import 'package:easycut/view/widget/orders/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) => CardOrdersListArchive(
                        listdata: controller.data[index])),
                  )))),
        ));
  }
}
