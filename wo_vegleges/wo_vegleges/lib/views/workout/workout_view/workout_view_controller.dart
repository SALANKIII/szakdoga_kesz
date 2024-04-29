import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/models/account.dart';
import 'package:wo_vegleges/models/workouts.dart';
import 'package:wo_vegleges/views/workout/add_workout/add_workout_view.dart';
import 'package:wo_vegleges/views/workout/one_workout/one_workout_view.dart';

class WorkoutViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;
  List<Workouts> workouts = [];
  List<Widget> rows2 = [];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Account account = Get.arguments["account"] as Account;
    print("--------------" + account.accountID.toString());
    getAllWorkoutDataToOneAccount(account.accountID);
    update();
  }

  void openTheAddWorkoutView() async {
    var result = await Get.to(
      () => AddWorkoutView(),
      transition: Transition.cupertino,
      arguments: {"account": account},
    );
    getAllWorkoutDataToOneAccount(account.accountID);
  }

  void getAllWorkoutDataToOneAccount(int accountID) async {
    print("Get all workout data");
    List response = await Backend.GET(route: '/workouts/$accountID');
    workouts = response.map((e) => Workouts.fromJson(e)).toList();
    rows2 = [];
    for (var workout in workouts.reversed) {
      rows2.add(
        GestureDetector(
          child: Card(
            color: Color.fromARGB(255, 21, 21, 21),
            child: ListTile(
              leading: Icon(Icons.run_circle_outlined),
              title: Text(workout.wname),
            ),
          ),
          onTap: () async {
            print(">>>workoutid" + workout.workoutID.toString());
            await Get.to(() => OneWorkoutView(), arguments: {'id': workout.workoutID, 'title': workout.wname});
            getAllWorkoutDataToOneAccount(account.accountID);
          },
        ),
      );
    }
    update();
  }
}
