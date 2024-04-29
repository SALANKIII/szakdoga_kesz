import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/views/measure/measure/measure_controller.dart';

class MeasureView extends StatelessWidget {
  MeasureViewController controller = Get.put(MeasureViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeasureViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Your Measurements"),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.openTheAddMeasureView();
              },
              backgroundColor: Color.fromARGB(255, 68, 207, 47),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            body: GetBuilder<MeasureViewController>(
                init: controller,
                builder: (_) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: controller.rows,
                    ),
                  );
                }),
          );
        });
  }
}
