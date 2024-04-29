import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/models/account.dart';

class AddMeasureViewController extends GetxController {
  Account account = Get.arguments?["account"] as Account;

  TextEditingController weightController = TextEditingController();
  TextEditingController bodyFatPercentageController = TextEditingController();
  TextEditingController caloricIntakeController = TextEditingController();
  TextEditingController neckController = TextEditingController();
  TextEditingController shouldersController = TextEditingController();
  TextEditingController chestController = TextEditingController();
  TextEditingController leftBicepController = TextEditingController();
  TextEditingController rightBicepController = TextEditingController();
  TextEditingController leftForeArmController = TextEditingController();
  TextEditingController rightForeArmController = TextEditingController();
  TextEditingController upperAbsController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController lowerAbsController = TextEditingController();
  TextEditingController hipsController = TextEditingController();
  TextEditingController leftThighController = TextEditingController();
  TextEditingController rightThighController = TextEditingController();
  TextEditingController leftCalfController = TextEditingController();
  TextEditingController rightCalfController = TextEditingController();
  TextEditingController measureDateController = TextEditingController();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void saveMeasure() async {
    print("saveMeasure");
    if (weightController.text == "" || bodyFatPercentageController.text == "" || caloricIntakeController.text == "" || neckController.text == "" || shouldersController.text == "" || chestController.text == "" || leftBicepController.text == "" || rightBicepController.text == "" || leftForeArmController.text == "" || rightForeArmController.text == "" || upperAbsController.text == "" || waistController.text == "" || lowerAbsController.text == "" || hipsController.text == "" || leftThighController.text == "" || rightThighController.text == "" || leftCalfController.text == "" || rightCalfController.text == "") {
      Get.dialog(CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text("Set all values!"),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      ));
    } else if (isNumeric(weightController.text) && isNumeric(bodyFatPercentageController.text) && isNumeric(caloricIntakeController.text) && isNumeric(neckController.text) && isNumeric(shouldersController.text) && isNumeric(chestController.text) && isNumeric(leftBicepController.text) && isNumeric(rightBicepController.text) && isNumeric(leftForeArmController.text) && isNumeric(rightForeArmController.text) && isNumeric(upperAbsController.text) && isNumeric(waistController.text) && isNumeric(lowerAbsController.text) && isNumeric(hipsController.text) && isNumeric(leftThighController.text) && isNumeric(rightThighController.text) && isNumeric(leftCalfController.text) && isNumeric(rightThighController.text)) {
      int weight = int.parse(weightController.text);
      int bodyFatPercentage = int.parse(bodyFatPercentageController.text);
      int caloricIntake = int.parse(caloricIntakeController.text);
      int neck = int.parse(neckController.text);
      int shoulders = int.parse(shouldersController.text);
      int chest = int.parse(chestController.text);
      int leftBicep = int.parse(leftBicepController.text);
      int rightBicep = int.parse(rightBicepController.text);
      int leftForeArm = int.parse(leftForeArmController.text);
      int rightForeArm = int.parse(rightForeArmController.text);
      int upperAbs = int.parse(upperAbsController.text);
      int waist = int.parse(waistController.text);
      int lowerAbs = int.parse(lowerAbsController.text);
      int hips = int.parse(hipsController.text);
      int leftThigh = int.parse(leftThighController.text);
      int rightThigh = int.parse(rightThighController.text);
      int leftCalf = int.parse(leftCalfController.text);
      int rightCalf = int.parse(rightCalfController.text);
      if (weight != 0 && bodyFatPercentage != 0 && caloricIntake != 0 && neck != 0 && shoulders != 0 && chest != 0 && leftBicep != 0 && rightBicep != 0 && leftForeArm != 0 && rightForeArm != 0 && upperAbs != 0 && waist != 0 && lowerAbs != 0 && hips != 0 && leftThigh != 0 && rightThigh != 0 && leftCalf != 0 && rightCalf != 0) {
        print("ifif");
        update();
        await Backend.POST(route: "/newMeasure", body: {
          "weight": weightController.text,
          "accountID": account.accountID,
          "bodyFatPercentage": bodyFatPercentageController.text,
          "caloricIntake": caloricIntakeController.text,
          "neck": neckController.text,
          "shoulders": shouldersController.text,
          "chest": chestController.text,
          "leftBicep": leftBicepController.text,
          "rightBicep": rightBicepController.text,
          "leftForeArm": leftForeArmController.text,
          "rightForeArm": rightForeArmController.text,
          "upperAbs": upperAbsController.text,
          "waist": waistController.text,
          "lowerAbs": lowerAbsController.text,
          "hips": hipsController.text,
          "leftThigh": leftThighController.text,
          "rightThigh": rightThighController.text,
          "leftCalf": leftCalfController.text,
          "rightCalf": rightCalfController.text,
        });
        print(">>>>>>>>>>>>>>>SIKER");
        Get.back(result: {"success": true, "account": account});
        update();
      } else {
        Get.dialog(CupertinoAlertDialog(
          title: Text("Hiba"),
          content: Text("Minden mezőt ki kell tölteni!"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("ok"),
              onPressed: () => Get.back(),
            ),
          ],
        ));
      }
    }
  }
}
