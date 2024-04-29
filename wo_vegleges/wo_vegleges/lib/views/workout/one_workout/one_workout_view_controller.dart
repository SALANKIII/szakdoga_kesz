import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/models/w_exercises.dart';
import 'package:wo_vegleges/views/workout/edit_workout/edit_workout_view.dart';

class OneWorkoutViewController extends GetxController {
  int workoutId = Get.arguments['id'] as int;
  String workoutTitle = Get.arguments['title'] as String;

  List<WExercises> exercises = [];
  List<Widget> column = [];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    exercises = [];
    column = [];
    loadExercises();
  }

  void deleteWorkout() {
    Get.dialog(CupertinoAlertDialog(
      title: Text("Delete '${workoutTitle}' workout"),
      content: Text("Are you sure?"),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(
            "No",
          ),
          onPressed: () {
            Get.back();
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () async {
            await Backend.DELETE(route: '/workouts/$workoutId');
            Get.back();
            Get.back();
          },
        ),
      ],
    ));
  }

  void editWorkout() async {
    await Get.to(
      () => EditWorkoutView(),
      arguments: {"title": workoutTitle, "exercises": exercises, "id": workoutId},
      transition: Transition.cupertino,
    );
    exercises = [];
    column = [];
    loadExercises();
  }

  void loadExercises() async {
    List response = await Backend.GET(route: '/w_exercises/$workoutId');
    exercises = response.map((e) => WExercises.fromJson(e)).toList();
    draw();
  }

  void draw() {
    print(exercises.length);
    for (var exercise in exercises) {
      //valami
      column.add(Card(
        color: Color.fromARGB(255, 21, 21, 21),
        child: ListTile(
          title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              exercise.exercise_name.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text("${exercise.sets} x ${exercise.repetitions}, Weight: ${exercise.weight}kg")
          ]),
        ),
      ));
    }
    update();
  }
}
