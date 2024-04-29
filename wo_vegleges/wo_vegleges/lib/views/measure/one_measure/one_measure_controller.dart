import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/models/measure.dart';

class OneMeasureViewController extends GetxController {
  Measure measure = Get.arguments["measure"] as Measure;

  List<Widget> dataWidget = [];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    for (var data in measure.getData()) {
      dataWidget.add(Padding(
        padding: EdgeInsets.zero,
        child: Card(
          color: Color.fromARGB(255, 21, 21, 21),
          child: ListTile(
            leading: Icon(data['icon']),
            title: Text(data['title']),
            trailing: Text(data['value'].toString(), style: TextStyle(fontSize: 15),),
          ),
        ),
      ));
    }
    update();
  }
}
