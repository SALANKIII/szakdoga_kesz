import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/models/exercises.dart';

class AddExerciseToWorkoutController extends GetxController {
  List<Exercises> exercises = [];
  List<Widget> colums = [];
  bool loading = false;
  TextEditingController controller= TextEditingController();
  bool found = true;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    controller.addListener(() {
      String text=controller.text;
      List<Exercises> filtered=filterBy(text);
      drawExercises(text==""?exercises:filtered);
      update();
    });
    loadExercise();
  }

  void loadExercise() async {
    loading = true;
    update();
    List response = await Backend.GET(route: '/exercises');
    exercises = response.map((e) => Exercises.fromJson(e)).toList();
    drawExercises(exercises);
    loading = false;
    update();
  }

  void drawExercises(List<Exercises> exercises) {
    colums = [];
    for (Exercises exercise in exercises) {
      colums.add(
        GestureDetector(
          child: Card(
              color: Color.fromARGB(255, 21, 21, 21),
              child: ListTile(
                title: Text(exercise.exercise_name),
                trailing: Icon(Icons.add),
              )),
          onTap: () {
            Get.back(result: exercise);
          },
        ),
      );
    }
  }
  
  List<Exercises> filterBy(String text) {
    List<Exercises> temp=[];
    for (Exercises exercise in exercises) {
      if(exercise.exercise_name.toLowerCase().contains(text.toLowerCase()))temp.add(exercise);
    }
    found=!temp.isEmpty;
    return temp;
  }

  //KERESÉS
}
