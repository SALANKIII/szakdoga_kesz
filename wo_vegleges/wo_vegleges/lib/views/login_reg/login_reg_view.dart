import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/components%20copy/custom_text_field.dart';
import 'package:wo_vegleges/views/login_reg/login_reg_view_controller.dart';

class LogRegView extends StatelessWidget {
  const LogRegView({super.key});

  @override
  Widget build(BuildContext context) {
    LogRegViewController controller = Get.put(LogRegViewController());
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        var _ = DefaultTabController.of(context);
        _.animation!.addListener(() {
          controller.site = (_.indexIsChanging) ? _.index : _.animation!.value.round();
        });
        return GetBuilder<LogRegViewController>(
            init: controller,
            builder: (_) {
              return Scaffold(
                backgroundColor: Colors.black,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(65, 221, 41, 1),
                  child: Icon(Icons.navigate_next_sharp, color: Colors.white),
                  onPressed: () => controller.buttonClickEvent(),
                ),
                body: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TabBar(
                        indicatorColor: Color.fromRGBO(65, 221, 41, 1),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabAlignment: TabAlignment.center,
                        tabs: [
                          Tab(
                            child: Text("Login", style: TextStyle(fontSize: 20)),
                          ),
                          Tab(
                            child: Text("Registration", style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: controller.loginEmailController,
                                prefixIcon: Icon(Icons.mail, size: 18),
                                labelText: "Email",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                              ),
                              CustomTextField(
                                controller: controller.loginPasswordController,
                                prefixIcon: Icon(Icons.lock, size: 18),
                                labelText: "Password",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: true,
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: controller.regEmailController,
                                prefixIcon: Icon(Icons.mail, size: 18),
                                labelText: "Email",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                              ),
                              CustomTextField(
                                controller: controller.regPwdController,
                                prefixIcon: Icon(Icons.lock, size: 18),
                                labelText: "Password",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: true,
                              ),
                              CustomTextField(
                                controller: controller.regPwd2Controller,
                                prefixIcon: Icon(Icons.lock, size: 18),
                                labelText: "Password again",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: true,
                              ),
                              CustomTextField(
                                controller: controller.regUsernameController,
                                prefixIcon: Icon(Icons.person, size: 18),
                                labelText: "Username",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: FlutGroupedButtons(
                                  activeColor: Color.fromRGBO(65, 221, 41, 1),
                                  checkColor: Colors.white,
                                  isRadio: true,
                                  data: controller.checkBoxList,
                                  isRow: true,
                                  onChanged: (p0) {
                                    if (p0 != null) {
                                      controller.setSelectedText(p0.toString());
                                    } else {
                                      controller.setSelectedText("");
                                    }
                                  },
                                ),
                              ),
                              CustomTextField(
                                controller: controller.regUserHeight,
                                prefixIcon: Icon(Icons.height, size: 18),
                                labelText: "Height",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                                hintText: "at least 100",
                              ),
                              CustomTextField(
                                controller: controller.regUserWeight,
                                prefixIcon: Icon(Icons.fitness_center, size: 18),
                                labelText: "Weight",
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                isPassword: false,
                                hintText: "at least 30",
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey,
                                      ),
                                      title: Text("Birthdate"),
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: CupertinoDatePicker(
                                        initialDateTime: DateTime.now(),
                                        mode: CupertinoDatePickerMode.date,
                                        dateOrder: DatePickerDateOrder.ymd,
                                        use24hFormat: true,
                                        onDateTimeChanged: (date) {
                                          controller.dateTime = date;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
