import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Measure {
  int measureID;
  int accountID;
  int weight;
  int bodyFatPercentage;
  int caloricIntake;
  int neck;
  int shoulders;
  int chest;
  int leftBicep;
  int rightBicep;
  int leftForeArm;
  int rightForeArm;
  int upperAbs;
  int waist;
  int lowerAbs;
  int hips;
  int leftThigh;
  int rightThigh;
  int leftCalf;
  int rightCalf;
  DateTime measureDate;

  Measure({
    required this.measureID,
    required this.accountID,
    required this.weight,
    required this.bodyFatPercentage,
    required this.caloricIntake,
    required this.neck,
    required this.shoulders,
    required this.chest,
    required this.leftBicep,
    required this.rightBicep,
    required this.leftForeArm,
    required this.rightForeArm,
    required this.upperAbs,
    required this.waist,
    required this.lowerAbs,
    required this.hips,
    required this.leftThigh,
    required this.rightThigh,
    required this.leftCalf,
    required this.rightCalf,
    required this.measureDate,
  });

  factory Measure.fromJson(Map<String, dynamic> json) {
    return Measure(measureID: json['measureID'] as int, accountID: json['accountID'] as int, weight: json['weight'] as int, bodyFatPercentage: json['bodyFatPercentage'] as int, caloricIntake: json['caloricIntake'] as int, neck: json['neck'] as int, shoulders: json['shoulders'] as int, chest: json['chest'] as int, leftBicep: json['leftBicep'] as int, rightBicep: json['rightBicep'] as int, leftForeArm: json['leftForeArm'] as int, rightForeArm: json['rightForeArm'] as int, upperAbs: json['upperAbs'] as int, waist: json['waist'] as int, lowerAbs: json['lowerAbs'] as int, hips: json['hips'] as int, leftThigh: json['leftThigh'] as int, rightThigh: json['rightThigh'] as int, leftCalf: json['leftCalf'] as int, rightCalf: json['rightCalf'] as int, measureDate: DateTime.parse(json['measureDate'].toString()).toLocal());
  }
  List getData() {
    List temp = [];
    temp.add({"title": "Weight", "value": weight, "icon": Icons.info});
    temp.add({"title": "Caloric Intake", "value": caloricIntake, "icon": Icons.info});
    temp.add({"title": "Neck", "value": neck, "icon": Icons.info});
    temp.add({"title": "Shoulders", "value": shoulders, "icon": Icons.info});
    temp.add({"title": "Chest", "value": chest, "icon": Icons.info});
    temp.add({"title": "Left Bicep", "value": leftBicep, "icon": Icons.info});
    temp.add({"title": "Right Bicep", "value": rightBicep, "icon": Icons.info});
    temp.add({"title": "Left Fore Arm", "value": leftForeArm, "icon": Icons.info});
    temp.add({"title": "Right Fore Arm", "value": rightForeArm, "icon": Icons.info});
    temp.add({"title": "Upper Abs", "value": upperAbs, "icon": Icons.info});
    temp.add({"title": "Waist", "value": waist, "icon": Icons.info});
    temp.add({"title": "Lower Abs", "value": lowerAbs, "icon": Icons.info});
    temp.add({"title": "Hips", "value": hips, "icon": Icons.info});
    temp.add({"title": "Left Thigh", "value": leftThigh, "icon": Icons.info});
    temp.add({"title": "Right Thigh", "value": rightThigh, "icon": Icons.info});
    temp.add({"title": "Left Calf", "value": leftCalf, "icon": Icons.info});
    temp.add({"title": "Right Calf", "value": rightCalf, "icon": Icons.info});
    return temp;
  }

  String formattedDate() {
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(measureDate);
    // yyyy,MM,dd-->  intl: ^0.16.1 -->measure.measureDate-->TEXT
    return formattedDate;
  }

  Map<String, dynamic> toJson() {
    return {
      "measureID": measureID,
      "accountID": accountID,
      "weight": weight,
      "bodyFatPercentage": bodyFatPercentage,
      "caloricIntake": caloricIntake,
      "neck": neck,
      "shoulders": shoulders,
      "chest": chest,
      "leftBicep": leftBicep,
      "rightBicep": rightBicep,
      "leftForeArm": leftForeArm,
      "rightForeArm": rightForeArm,
      "upperAbs": upperAbs,
      "waist": waist,
      "lowerAbs": lowerAbs,
      "hips": hips,
      "leftThigh": leftThigh,
      "rightThigh": rightThigh,
      "leftCalf": leftCalf,
      "rightCalf": rightCalf,
      "measureDate": measureDate,
    };
  }
}
