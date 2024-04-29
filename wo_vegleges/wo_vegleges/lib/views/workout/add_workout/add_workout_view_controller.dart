import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/components%20copy/custom_text_field.dart';
import 'package:wo_vegleges/components%20copy/exercise_field.dart';
import 'package:wo_vegleges/models/exercises.dart';
import 'package:wo_vegleges/views/workout/add_workout/add_exercise_to_workout/add_exercise_to_workout.dart';
import '../../../models/account.dart';

class AddWorkoutViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;
  TextEditingController newWorkoutName = TextEditingController();

  List<ExerciseField> columns = [];
  List<Exercises> exercies = [];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    columns = [];
    exercies = [];
    Account account = Get.arguments["account"] as Account;
    print(account.accountID);
    update();
  }

  void saveWorkout() async {
    print("saveWorkout");
    if (newWorkoutName.text == "") {
      Get.dialog(CupertinoAlertDialog(
        title: Text("Error"),
        content: Text("Give it a name!"),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      ));
    } else {
      int num = columns.where((element) => !element.IsReadyForSave()).length;
      if (num != 0) {
        Get.dialog(CupertinoAlertDialog(
          title: Text("Error"),
          content: Text("Only numbers accepted!"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("ok"),
              onPressed: () => Get.back(),
            ),
          ],
        ));
      } else {
        List<dynamic> ids = await Backend.POST(route: "/workouts", body: {
          "wname": newWorkoutName.text,
          "accountID": account.accountID,
        });
        int workoutId = ids.first;
        print("id: ${workoutId}");

        for (int i = 0; i < columns.length; i++) {
          await Backend.POST(route: "/w_exercises/${workoutId}/${exercies[i].exerciseID}", body: {
            "sets": columns[i].sets.text,
            "repetitions": columns[i].reps.text,
            "weight": columns[i].weight.text,
          });
        }
        Get.back();
      }
    }
  }

  void moveToAddExerciseView() async {
    //navigálni az exerciseViewra(getbackel vissza)
    Exercises result = await Get.to(() => AddExerciseToWorkout());
    exercies.add(result);
    print(">>>>>>>>>>>>${result.exerciseID}");
    //a result az gyakolratilag a kivalasztott elem
    add(result);
  }

  void add(exercise) {
    var card = ExerciseField(
      delete: (id) => remove(id),
      id: exercies.indexOf(exercise),
      name: exercise.exercise_name,
      reps: TextEditingController(),
      sets: TextEditingController(),
      weight: TextEditingController(),
    );
    columns.add(card);
    update();
  }

  void remove(int id) {
    columns.removeAt(id);
    exercies.removeAt(id);
    for (var i = 0; i < columns.length; i++) {
      columns[i].id = i;
      columns[i].controller.update();
    }
    update();
  }
}
