import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/views/measure/one_measure/one_measure_controller.dart';

class OneMeasureView extends StatelessWidget {
  OneMeasureViewController controller = Get.put(OneMeasureViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Text("Your measurement data"),
            Text(
              controller.measure.formattedDate(),
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: GetBuilder<OneMeasureViewController>(
          init: controller,
          builder: (_) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: controller.dataWidget,
              ),
            );
          }),
    );
  }
}
