import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/views/workout/one_workout/one_workout_view_controller.dart';

class OneWorkoutView extends StatelessWidget {
  OneWorkoutViewController controller = Get.put(OneWorkoutViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OneWorkoutViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(controller.workoutTitle),
              centerTitle: true,
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  onPressed: controller.editWorkout,
                  icon: Icon(Icons.edit_note_outlined),
                ),
                IconButton(
                  onPressed: controller.deleteWorkout,
                  icon: Icon(Icons.delete),
                )
              ],
            ),
            backgroundColor: Colors.black,
            body: (controller.column.length == 0)
                ? Center(child: Center(child: Text('There are no exercises in this workout!', style: TextStyle(fontSize: 18),)))
                : SingleChildScrollView(
                    child: Column(
                      children: controller.column,
                    ),
                  ),
          );
        });
  }
}
