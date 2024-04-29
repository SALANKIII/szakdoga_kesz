import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Backend {
  static String baseURL = "http://localhost:3000";

  // json listat ad vissza (user, series)
  static Future<List<dynamic>> GET({required String route}) async {
    var response = await http.get(Uri.parse(baseURL + route));
    print(">>>>>>" + response.body);
    if (json.decode(response.body) is String) {
      Get.dialog(CupertinoAlertDialog(
        title: new Text(json.decode(response.body)),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("ok"),
            onPressed: () => Get.back(),
          ),
        ],
      ));
    }
    return json.decode(response.body) as List<dynamic>;
  }

  // json listat ad vissza (login, reg)
  static Future<List<dynamic>> POST({required String route, required Map body}) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.post(Uri.parse(baseURL + route), body: jsonEncode(body), headers: headers);
    // hiba van akkor lesz egy alert
    //print("########"+response.body);
    if (json.decode(response.body) is String) {
      return [];
    }
    return json.decode(response.body) as List<dynamic>;
  }

  // uzenetet ad vissza (edit profile)
  static Future<String> PUT({required String route, required Map body}) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await http.put(Uri.parse(baseURL + route), body: jsonEncode(body), headers: headers);
    return json.decode(response.body) as String;
  }

  static Future<List<dynamic>> DELETE({required String route}) async {
    await http.delete(Uri.parse(baseURL + route));
    return [];
  }
}
