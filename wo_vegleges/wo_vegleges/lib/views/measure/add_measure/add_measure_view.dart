import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/components%20copy/custom_text_field.dart';

import 'add_measure_view_controller.dart';

class AddMeasureView extends StatelessWidget {
  AddMeasureViewController controller = Get.put(AddMeasureViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMeasureViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Add new measure"),
              centerTitle: true,
            ),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomTextField(
                    controller: controller.weightController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Weight',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.bodyFatPercentageController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Bodyfat Percentage',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.caloricIntakeController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Caloric Intake',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.neckController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Neck',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.shouldersController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Shoulders',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.chestController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Chest',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.leftBicepController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Left Bicep',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.rightBicepController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Right Bicep',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.leftForeArmController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Left Forearm',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.rightForeArmController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Right Forearm',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.upperAbsController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Upper Abs',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.waistController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Waist',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.lowerAbsController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Lower Abs',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.hipsController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Hips',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.leftThighController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Left Thigh',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.rightThighController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Right Thigh',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.leftCalfController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Left Calf',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: controller.rightCalfController,
                    prefixIcon: Icon(Icons.linear_scale_sharp),
                    labelText: 'Right Calf',
                    padding: EdgeInsets.all(10),
                    isPassword: false,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(255, 68, 207, 47),
                onPressed: () {
                  controller.saveMeasure();
                }),
          );
        });
  }
}
