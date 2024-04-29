import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/components%20copy/custom_text_field.dart';
import 'package:wo_vegleges/views/workout/add_workout/add_exercise_to_workout/add_exercise_to_workout_controller.dart';

class AddExerciseToWorkout extends StatelessWidget {
  AddExerciseToWorkoutController controller =
      Get.put(AddExerciseToWorkoutController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddExerciseToWorkoutController>(
        init: controller,
        builder: (_) {
          return (controller.loading)
              ? Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(child: CircularProgressIndicator()))
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    title: Text("Select Exercise"),
                    centerTitle: true,
                      bottom: PreferredSize(child:  CustomTextField(
                        controller: controller.controller,
                        prefixIcon: Icon(Icons.search),
                        labelText: "Search",
                        padding: EdgeInsets.only(bottom: 20, right: 20, left:20),
                        isPassword: false,
                      ),preferredSize: Size.fromHeight(80),),
                  ),
                  backgroundColor: Colors.black,
                  body: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: (!controller.found)? Center(child: Text("There's no such exercises!")) : Column(
                      children: controller.colums,
                    ),
                  ),
                );
        });
  }
}
