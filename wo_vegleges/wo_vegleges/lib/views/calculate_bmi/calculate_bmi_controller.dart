import 'package:get/get.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/models/account.dart';

class CalculateBmiController extends GetxController{
  double height=100.0;
  double weight=30.0;
  Account account = Get.arguments["account"] as Account;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    this.height=account.height==0?100.0:account.height.toDouble();
    this.weight=account.weight==0?30.0:account.weight.toDouble();
    update();
  }

  void changeHeight(int value){
      this.height=value.toDouble();
      update();
  }

 void changeWeight(int value){
      this.weight=value.toDouble();
      update();
  }

  
  void goBack() async{
    // adatfrissites az backenden
    account.height=height.toInt();
    account.weight=weight.toInt();
    await Backend.PUT(route: "/updateHeightWeight", body: {
      "email":account.email,
      "height": account.height,
      "weight": account.weight,
    });
    Get.back();
    //Get.back(result: {"account": account});
  }
}