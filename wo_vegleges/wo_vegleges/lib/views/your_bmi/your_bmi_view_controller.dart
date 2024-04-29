import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/models/account.dart';
import 'package:wo_vegleges/views/calculate_bmi/calculate_bmi_view.dart';
import 'package:wo_vegleges/views/profile_details/profile_details_view.dart';

class YourBMIViewController extends GetxController {
  Account account = Get.arguments["account"] as Account;
  ConfettiController confettiController = ConfettiController();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    confettiController.play();
  }

  String myBmiNum() {
    double heightInMeters = account.height / 100;
    double bmi = account.weight / (heightInMeters * heightInMeters);
    //return (180 / 80).toString(); //teszt
    return (bmi).toStringAsFixed(2);
  }

  IconData getBmiIcon() {
    IconData state = Icons.sentiment_neutral_outlined;
    double heightInMeters = account.height / 100;
    double bmi = account.weight / (heightInMeters * heightInMeters);
    if (bmi >= 18.6 && bmi <= 24.9)
      state = Icons.sentiment_satisfied_alt_outlined;
    else if (bmi >= 30) state = Icons.sentiment_dissatisfied_outlined;
    return state;
  }

  void getToCalculateBMIView() async {
    await Get.to(
      BMICalculator(),
      transition: Transition.cupertino,
      arguments: {"account": account},
    );
    confettiController.play();
    update();
  }
}
