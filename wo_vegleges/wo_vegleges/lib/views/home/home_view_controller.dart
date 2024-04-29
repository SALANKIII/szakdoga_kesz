import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/models/account.dart';
import 'package:wo_vegleges/models/measure.dart';
import 'package:wo_vegleges/models/workouts.dart';
import 'package:wo_vegleges/views/measure/one_measure/one_measure_view.dart';
import 'package:wo_vegleges/views/profile_details/profile_details_view.dart';
import 'package:wo_vegleges/views/workout/one_workout/one_workout_view.dart';
import '../measure/measure/measure_view.dart';
import '../workout/workout_view/workout_view.dart';
import '../your_bmi/your_bmi_view.dart';

class HomeViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;
  List<Measure> measures = [];
  List<Workouts> workouts = [];
  List<Widget> rows = [];
  List<Widget> rows2 = [];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Account account = Get.arguments["account"] as Account;
    print(account.accountID);
    getAllMeasureDataToOneAccount(account.accountID);
    getAllWorkoutDataToOneAccount(account.accountID);
    update();
  }

  void openTheProfileDetailsView() async {
   await Get.to(
      ProfileDetailsView(),
      transition: Transition.cupertino,
      arguments: {"account": account},
    );
    update();
    
  }

  void goToBmi() async{
   await Get.to(
      () => YourBMIView(),
      transition: Transition.cupertinoDialog,
      arguments: {"account": account},
    );
    update();
  }

  void goToMeasureView() async {
    await Get.to(() => MeasureView(), transition: Transition.cupertino, arguments: {"account": account});
    // frissiteni a nezetet
    getAllMeasureDataToOneAccount(account.accountID);
  }

  void goToWorkoutView()async {
    await Get.to(() => WorkoutView(), transition: Transition.cupertino, arguments: {"account": account});
    getAllWorkoutDataToOneAccount(account.accountID);
    update();
  }

  void getAllMeasureDataToOneAccount(int accountID) async {
    print("Get all measure datas");
    List response = await Backend.GET(route: '/getMeasure/$accountID');
    measures = response.map((e) => Measure.fromJson(e)).toList();
    rows = [];
    for (var measure in measures.take(4)) {
      rows.add(
        GestureDetector(
          child: Card(color: Color.fromARGB(255, 21, 21, 21), child: ListTile(leading: Icon(Icons.date_range), title: Text(measure.formattedDate()))),
          onTap: () {
            Get.to(() => OneMeasureView(), arguments: {"measure": measure});
          },
        ),
      );
    }
    update();
  }

  void getAllWorkoutDataToOneAccount(int accountID) async {
    print("Get all workout data");
    List response = await Backend.GET(route: '/workouts/$accountID');
    workouts = response.map((e) => Workouts.fromJson(e)).toList();
    rows2 = [];
    for (var workout in workouts.reversed.take(4)) {
      rows2.add(
        GestureDetector(
          child: Card(color: Color.fromARGB(255, 21, 21, 21), child: ListTile(leading: Icon(Icons.run_circle_outlined), title: Text(workout.wname))),
          onTap: () async {
            print(">>>workoutid" + workout.workoutID.toString());
            await Get.to(() => OneWorkoutView(), arguments: {'id': workout.workoutID, 'title': workout.wname});
            getAllWorkoutDataToOneAccount(account.accountID);
            print("visszaléptem");
            update();
          },
        ),
      );
    }
    update();
  }
}
