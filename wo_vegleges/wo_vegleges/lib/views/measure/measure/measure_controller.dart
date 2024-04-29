import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/models/measure.dart';
import 'package:wo_vegleges/views/measure/one_measure/one_measure_view.dart';
import '../../../backend/backend.dart';
import '../../../models/account.dart';
import '../add_measure/add_measure_view.dart';

class MeasureViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;
  List<Measure> measures = [];
  List<Widget> rows = [];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Account account = Get.arguments["account"] as Account;
    print(account.accountID);
    getAllMeasureDataToOneAccount(account.accountID);
    update();
  }

  void getAllMeasureDataToOneAccount(int accountID) async {
    print("Get all measure datas");
    List response = await Backend.GET(route: '/getMeasure/$accountID');
    measures = response.map((e) => Measure.fromJson(e)).toList();
    rows = [];
    for (var measure in measures) {
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

  void openTheAddMeasureView() async {
    var result = await Get.to(
      AddMeasureView(),
      transition: Transition.cupertino,
      arguments: {"account": account},
    );
    if (result["success"] == true) {
      getAllMeasureDataToOneAccount(account.accountID);
    }
  }
}
