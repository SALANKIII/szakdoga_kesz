import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/components%20copy/custom_text_field.dart';

class ExerciseFieldController extends GetxController {
  void Update() {
    update();
  }
}

class ExerciseField extends StatelessWidget {
  ExerciseField({
    required this.delete,
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.weight,
  });

  int id; //(columns.length + 1).toString()
  String name;
  void Function(int) delete;

  TextEditingController sets;
  TextEditingController reps;
  TextEditingController weight;

  bool IsReadyForSave() {
    return sets.text.isNum && reps.text.isNum && weight.text.isNum;
  }

  ExerciseFieldController controller = Get.put(ExerciseFieldController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseFieldController>(
        init: controller,
        builder: (_) {
          return Card(
            color: Color.fromARGB(255, 21, 21, 21),
            child: ListTile(
              leading: Text((id + 1).toString()),
              title: Column(
                children: [
                  Text(name),
                  CustomTextField(
                    controller: sets,
                    prefixIcon: Icon(Icons.near_me),
                    labelText: 'Sets',
                    padding: EdgeInsets.all(5),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: reps,
                    prefixIcon: Icon(Icons.near_me),
                    labelText: 'Reps',
                    padding: EdgeInsets.all(5),
                    isPassword: false,
                  ),
                  CustomTextField(
                    controller: weight,
                    prefixIcon: Icon(Icons.near_me),
                    labelText: 'Weight',
                    padding: EdgeInsets.all(5),
                    isPassword: false,
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => delete(id),
              ),
            ),
          );
        });
  }
}
