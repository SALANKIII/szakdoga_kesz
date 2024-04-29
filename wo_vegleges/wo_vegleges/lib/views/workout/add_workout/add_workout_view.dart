import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/components%20copy/custom_text_field.dart';
import 'package:wo_vegleges/views/workout/add_workout/add_workout_view_controller.dart';

class AddWorkoutView extends StatelessWidget {
  AddWorkoutViewController controller = Get.put(AddWorkoutViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddWorkoutViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: controller.moveToAddExerciseView,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Color.fromARGB(255, 68, 207, 47),
            ),
            appBar: AppBar(
              title: Text("Add new workout"),
              centerTitle: true,
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  icon: Icon(Icons.save),
                  color: Color.fromRGBO(65, 221, 41, 1),
                  onPressed: controller.saveWorkout,
                ),
              ],
            ),
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    controller: controller.newWorkoutName,
                    prefixIcon: Icon(Icons.near_me),
                    labelText: 'Name your workout',
                    padding: EdgeInsets.all(20),
                    isPassword: false,
                  ),
                  Column(
                    children: controller.columns,
                  )
                ],
              ),
            ),
          );
        });
  }
}