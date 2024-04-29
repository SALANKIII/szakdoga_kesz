import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/views/home/home_view_controller.dart';

class HomeView extends StatelessWidget {
  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: controller.goToBmi,
                        iconSize: 40,
                        icon: Icon(
                          Icons.calculate,
                          color: Color.fromRGBO(65, 221, 41, 1),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good to see you,",
                              style: TextStyle(color: Colors.white54),
                            ),
                            Text(
                              "${controller.account.username}",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: controller.openTheProfileDetailsView,
                        iconSize: 25,
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Last Measurements",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      CupertinoButton(
                        child: Text(
                          "All/+",
                          style: TextStyle(color: Color.fromRGBO(65, 221, 41, 1), fontSize: 20),
                        ),
                        onPressed: () {
                          controller.goToMeasureView();
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: controller.rows,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Last Workouts",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      CupertinoButton(
                        child: Text(
                          "All/+",
                          style: TextStyle(color: Color.fromRGBO(65, 221, 41, 1), fontSize: 20),
                        ),
                        onPressed: () {
                          controller.goToWorkoutView();
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: controller.rows2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
