import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/components%20copy/exercise_field.dart';
import 'package:wo_vegleges/models/exercises.dart';
import 'package:wo_vegleges/models/w_exercises.dart';
import 'package:wo_vegleges/views/workout/add_workout/add_exercise_to_workout/add_exercise_to_workout.dart';

class EditWorkoutController extends GetxController {
  String title = Get.arguments['title'] as String;
  int workoutId = Get.arguments['id'] as int;
  List<WExercises> wexercises = Get.arguments['exercises'] as List<WExercises>;
  List<Exercises> exercises = [];
  List<ExerciseField> columns = [];
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    for (var we in wexercises) {
      Exercises e = Exercises(exerciseID: we.exerciesID, exercise_name: we.exercise_name ?? "NaN");
      exercises.add(e);
      addWe(e, we);
    }
  }

  void moveToAddExerciseView() async {
    //navigálni az exerciseViewra(getbackel vissza)
    Exercises result = await Get.to(() => AddExerciseToWorkout());
    exercises.add(result);
    print(">>>>>>>>>>>>${result.exerciseID}");
    //a result az gyakolratilag a kivalasztott elem
    add(result);
  }

  void add(Exercises exercise) {
    var card = ExerciseField(
      delete: (id) => remove(id),
      id: exercises.indexOf(exercise),
      name: exercise.exercise_name,
      reps: TextEditingController(),
      sets: TextEditingController(),
      weight: TextEditingController(),
    );
    columns.add(card);
    update();
  }

  void addWe(Exercises exercise, WExercises wexercise) {
    var card = ExerciseField(
      delete: (id) => remove(id),
      id: exercises.indexOf(exercise),
      name: exercise.exercise_name,
      reps: TextEditingController(text: wexercise.repetitions.toString()),
      sets: TextEditingController(text: wexercise.sets.toString()),
      weight: TextEditingController(text: wexercise.weight.toString()),
    );
    columns.add(card);
    update();
  }

  void remove(int id) {
    columns.removeAt(id);
    exercises.removeAt(id);
    for (var i = 0; i < columns.length; i++) {
      columns[i].id = i;
      columns[i].controller.update();
    }
    update();
  }

  void updateData() async {
    int num = columns.where((element) => !element.IsReadyForSave()).length;
    if (num != 0) {
      Get.dialog(CupertinoAlertDialog(
        title: Text("Error"),
        content: Text("Give numbers!"),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      ));
    } else {
      await Backend.DELETE(route: "/w_exercises/${workoutId}");

      for (int i = 0; i < columns.length; i++) {
        await Backend.POST(route: "/w_exercises/${workoutId}/${exercises[i].exerciseID}", body: {
          "sets": columns[i].sets.text,
          "repetitions": columns[i].reps.text,
          "weight": columns[i].weight.text,
        });
      }
      Get.back();
    }
  }
}
