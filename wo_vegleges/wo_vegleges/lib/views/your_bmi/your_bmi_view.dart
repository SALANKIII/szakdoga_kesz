import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/views/your_bmi/your_bmi_view_controller.dart';

class YourBMIView extends StatelessWidget {
  YourBMIViewController controller = Get.put(YourBMIViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourBMIViewController>(
        init: controller,
        builder: (_) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text("Your BMI is ${controller.myBmiNum()}"),
                  centerTitle: true,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(controller.getBmiIcon()),
                    )
                  ],
                ),
                backgroundColor: Colors.black,
                body: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(width: 2, color: const Color.fromARGB(255, 122, 122, 122))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Underweight <18.5",
                                    style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 87, 143, 189)),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Normal 18.6-24.9",
                                    style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 77, 226, 82)),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Overweight 25-29.9",
                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 224, 128, 49)),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Obese 30-34.9",
                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 211, 54, 67)),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Extreme 35<",
                                    style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 0, 0)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        color: Color.fromRGBO(65, 221, 41, 1),
                        child: Text(
                          "Calculate new BMI",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          controller.getToCalculateBMIView();
                        }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              (controller.getBmiIcon() == Icons.sentiment_satisfied_alt_outlined)
                  ? ConfettiWidget(
                      confettiController: controller.confettiController,
                      shouldLoop: true,
                      blastDirectionality: BlastDirectionality.explosive,
                    )
                  : Container()
            ],
          );
        });
  }
}
