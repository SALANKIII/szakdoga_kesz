import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/views/workout/workout_view/workout_view_controller.dart';

class WorkoutView extends StatelessWidget {
  WorkoutViewController controller = Get.put(WorkoutViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Your Workouts"),
              centerTitle: true,
            ),
            backgroundColor: Colors.black,
            floatingActionButton: FloatingActionButton(
              onPressed: controller.openTheAddWorkoutView,
              backgroundColor: Color.fromARGB(255, 68, 207, 47),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: controller.rows2,
              ),
            ),
          );
        });
  }
}
