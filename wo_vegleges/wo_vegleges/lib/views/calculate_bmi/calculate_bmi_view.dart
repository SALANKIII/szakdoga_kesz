import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/models/account.dart';
import 'package:wo_vegleges/views/calculate_bmi/calculate_bmi_controller.dart';
import 'package:wo_vegleges/views/your_bmi/your_bmi_view.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalculateBmiController controller= Get.put(CalculateBmiController());
    return GetBuilder<CalculateBmiController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Calculate your BMI'),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 37, 37, 37),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white38),
                        ),
                        SizedBox(height: 10),
                        Text(
                          controller.height.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Slider(
                          inactiveColor: Colors.black45,
                          activeColor: Color.fromARGB(255, 68, 207, 47),
                          value: controller.height,
                          min: 100,
                          max: 220,
                          onChanged: (newValue) {
                            controller.changeHeight(newValue.toInt());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 37, 37, 37),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white38),
                        ),
                        SizedBox(height: 10),
                        Text(
                          controller.weight.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Slider(
                          inactiveColor: Colors.black45,
                          activeColor: Color.fromARGB(255, 68, 207, 47),
                          value: controller.weight,
                          min: 30,
                          max: 150,
                          onChanged: (newValue) {
                           controller.changeWeight(newValue.toInt());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CupertinoButton(
                  color: Color.fromARGB(255, 68, 207, 47),
                  onPressed: controller.goBack,
                  child: Text('Calculate BMI', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20),
              ],
            ),
                    ),
          ),
          backgroundColor: Colors.black,
        );
      }
    );
  }
}

