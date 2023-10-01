import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/screen/drawerscreen/currency/currency_model_bootom_sheet.dart';

import '../../utils/appbarwidget.dart';
import '../../utils/color.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var indexNumber;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          AppBarWidgt(text: "Settings"),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/dollar.jpg"))),
                ),
                Container(
                  height: height * 0.1,
                  color: blue.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Settings",
                            style: TextStyle(
                                color: white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.07,
                  left: width * 0.05,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.blue[900],
                    child: GetBuilder<HomeController>(builder: (obj) {
                      return Container(
                        height: height * 0.75,
                        width: width * 0.9,
                        color: white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Basic Setting",
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text(
                                "Language",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                "English",
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              InkWell(
                                onTap: () {
                                  CureencyBottomSheet.addCurrencyBottomSheet(
                                      context: context,
                                      height: height,
                                      width: width);
                                },
                                child: Text(
                                  "Currency",
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                obj.profilemodel!.data!.currency!,
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Text(
                                "Other",
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text(
                                "Feedback & Support",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                "FAQ",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                "Privacy",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                "Terms of service",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                "Quick start guide",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                "Licenses",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
