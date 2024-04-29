import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wo_vegleges/components%20copy/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:wo_vegleges/components%20copy/custom_button.dart';
import 'package:wo_vegleges/components%20copy/custom_list_tile.dart';
import 'package:wo_vegleges/components%20copy/custom_text_field.dart';
import 'package:wo_vegleges/views/profile_details/profile_details_view_controller.dart';

class ProfileDetailsView extends StatelessWidget {
  ProfileDetailsViewController controller = Get.put(ProfileDetailsViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileDetailsViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text("Profile details"),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomListTile(
                              prefixIcon: Icons.person,
                              mainTitle: "Username",
                              subTitle: "@${controller.account.username}",
                              iconButton: IconButton(
                                icon: Icon(Icons.edit, color: Color.fromRGBO(65, 221, 41, 1)),
                                onPressed: () {
                                  Get.bottomSheet(CustomBottomSheet(
                                    children: (_) => [
                                      CustomTextField(
                                        controller: controller.userNameController,
                                        prefixIcon: Icon(Icons.person, size: 18),
                                        labelText: "Username",
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        isPassword: false,
                                      ),
                                      CustomButton(
                                        background: Color.fromRGBO(65, 221, 41, 1),
                                        text: "Save Changes",
                                        onPressed: controller.sendEditUsernameRequest,
                                      ),
                                    ],
                                  ));
                                },
                              )),
                          CustomListTile(
                            prefixIcon: Icons.mail,
                            mainTitle: "Email",
                            subTitle: controller.account.email,
                          ),
                          CustomListTile(
                              prefixIcon: Icons.date_range,
                              mainTitle: "Birth Date",
                              subTitle: controller.account.birthDate.toLocal().toString().split(' ')[0],
                              iconButton: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(65, 221, 41, 1),
                                ),
                                onPressed: () {
                                  Get.bottomSheet(
                                    CustomBottomSheet(
                                      children: (_) => [
                                        SizedBox(
                                          height: 200,
                                          child: CupertinoDatePicker(
                                            initialDateTime: controller.account.birthDate,
                                            mode: CupertinoDatePickerMode.date,
                                            dateOrder: DatePickerDateOrder.ymd,
                                            use24hFormat: true,
                                            onDateTimeChanged: (date) {
                                              controller.dateTime = date.toLocal();
                                            },
                                          ),
                                        ),
                                        CustomButton(
                                          background: Color.fromRGBO(65, 221, 41, 1),
                                          text: "Save Changes",
                                          onPressed: controller.sendEditDateRequest,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                          CustomListTile(
                              prefixIcon: Icons.lock,
                              mainTitle: "Password",
                              subTitle: "*************",
                              iconButton: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(65, 221, 41, 1),
                                ),
                                onPressed: () {
                                  Get.bottomSheet(CustomBottomSheet(
                                    children: (_) => [
                                      CustomTextField(
                                        controller: controller.pwdController,
                                        prefixIcon: Icon(Icons.lock, size: 18),
                                        labelText: "New password",
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        isPassword: true,
                                      ),
                                      CustomTextField(
                                        controller: controller.pwd2Controller,
                                        prefixIcon: Icon(Icons.lock, size: 18),
                                        labelText: "New password again",
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        isPassword: true,
                                      ),
                                      CustomButton(
                                        background: Color.fromRGBO(65, 221, 41, 1),
                                        text: "Save Changes",
                                        onPressed: controller.sendEditPwdRequest,
                                      ),
                                    ],
                                  ));
                                },
                              )),
                          CustomListTile(
                            prefixIcon: Icons.accessibility,
                            mainTitle: "Role",
                            subTitle: controller.account.role == 0 ? "User" : "Admin",
                          ),
                        ],
                      ),
                    ),
                    CupertinoButton(
                      child: Text(
                        "Log out",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      onPressed: controller.logOut,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
