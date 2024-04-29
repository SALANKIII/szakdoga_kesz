import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/views/workout/edit_workout/edit_workout_controller.dart';

class EditWorkoutView extends StatelessWidget {
  EditWorkoutController controller = Get.put(EditWorkoutController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditWorkoutController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(controller.title),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.save),
                  color: Color.fromRGBO(65, 221, 41, 1),
                  onPressed: controller.updateData,
                ),
              ],
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: controller.columns,
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.black,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromRGBO(65, 221, 41, 1),
              onPressed: controller.moveToAddExerciseView,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
