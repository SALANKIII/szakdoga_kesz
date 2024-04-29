import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wo_vegleges/backend/backend.dart';
import 'package:wo_vegleges/models/account.dart';
import 'package:wo_vegleges/views/home/home_view.dart';

class LogRegViewController extends GetxController {
  // login
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // reg
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPwdController = TextEditingController();
  TextEditingController regPwd2Controller = TextEditingController();
  TextEditingController regUsernameController = TextEditingController();
  TextEditingController regUserHeight = TextEditingController();
  TextEditingController regUserWeight = TextEditingController();
  DateTime dateTime = DateTime.now();
  List<String> checkBoxList = [
    "Male",
    "Female",
  ];
  String selectedText = "";

  void setSelectedText(String currentText) {
    selectedText = currentText;
    update();
  }

  int site = 0;

  void buttonClickEvent() {
    if (site == 0) {
      login();
    } else {
      reg();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void reg() async {
    print("reg");
    if (regEmailController.text == "" ||
        regPwdController.text == "" ||
        regPwd2Controller.text == "" ||
        regUsernameController.text == "" ||
        regUserHeight.text == "" ||
        regUserWeight.text == "" ||
        selectedText == "") {
      Get.dialog(CupertinoAlertDialog(
        title: new Text("Hiba"),
        content: new Text("Minden mezőt kötelező kitölteni"),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      ));
    } else if (regPwdController.text == regPwd2Controller.text) {
      // email, username, gender, weight, height, birthDate, password
      if (isNumeric(regUserHeight.text) && isNumeric(regUserWeight.text)) {
        double height = double.parse(regUserHeight.text);
        double weight = double.parse(regUserWeight.text);
        if (height >= 100 && weight >= 30) {
          List response = await Backend.POST(route: "/regMobil", body: {
            "email": regEmailController.text,
            "username": regUsernameController.text,
            "password": regPwd2Controller.text,
            "gender": selectedText == "Male" ? 1 : 0,
            "weight": regUserWeight.text,
            "height": regUserHeight.text,
            "birthDate": dateTime.toString().split(' ')[0],
          });
          print(response);
          List accounts = response.map((e) => Account.fromJson(e)).toList();
          if (accounts.length != 0) {
            // sikeres reg
            saveMyMail(regEmailController.text);
            Get.offAll(
              () => HomeView(),
              arguments: {"account": accounts[0]},
              transition: Transition.cupertino,
            );
          }
        } else {
          Get.dialog(CupertinoAlertDialog(
            title: new Text("Error"),
            content: new Text("You entered an incorrect weight or height"),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text("ok"),
                onPressed: () => Get.back(),
              ),
            ],
          ));
        }
      } else {
        Get.dialog(CupertinoAlertDialog(
          title: new Text("Error"),
          content: new Text("You have to give numbers at weight and height"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("ok"),
              onPressed: () => Get.back(),
            ),
          ],
        ));
      }
    } else {
      Get.dialog(CupertinoAlertDialog(
        title: new Text("Error"),
        content: new Text("The password does not match"),
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

  void login() async {
    List response = await Backend.POST(route: "/loginMobile", body: {
      "email": loginEmailController.text,
      "password": loginPasswordController.text,
    });
    List accounts = response.map((e) => Account.fromJson(e)).toList();
    print(accounts);
    print(accounts.length);
    // amikor a length nem 0
    if (accounts.length != 0) {
      // sikeres bejelentkezés
      saveMyMail(loginEmailController.text);
      Get.offAll(
        () => HomeView(),
        arguments: {
          "account": accounts[0]
        }, // az első elem a talált felhasználó
        transition: Transition.cupertino,
      );
    }
  }

  // sikeres login/reg után elmenti az email címemet
  void saveMyMail(String mail) {
    final box = GetStorage();
    box.write("email", mail);
  }

  // keresi, hogy van-e lementve email adat
  // kinyeri, hogy van-e olyan felhasználó, aki már
  // egyszer bejelentkezett, de még nem jelentkezett ki
  void loadUser() async {
    final box = GetStorage();
    print("loading account data");
    if (await box.hasData("email")) {
      String mail = await box.read("email");
      loginWithEmail(mail);
    }
  }

  // automatikusan bejelentkeztet egy felhasználót
  void loginWithEmail(String mail) async {
    print("logging with mail");
    List response = await Backend.GET(route: '/mobilAutoLogin/$mail');
    print(response);
    List accounts = response.map((e) => Account.fromJson(e)).toList();
    if (accounts.length != 0) {
      Get.offAll(
        () => HomeView(),
        arguments: {"account": accounts[0]},
        transition: Transition.cupertino,
      );
    }
  }
}
