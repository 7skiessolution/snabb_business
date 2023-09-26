import 'package:flutter/material.dart';
import 'package:snabb_business/screen/budget/BudgetView.dart';
import 'package:snabb_business/screen/drawerscreen/Calender.dart';
import 'package:snabb_business/screen/homeScreen.dart';
import 'package:snabb_business/screen/sale/Sale.dart';
import 'package:snabb_business/screen/summary/summary_detail.dart';
import 'package:snabb_business/screen/summary/summary_screen.dart';
import 'package:snabb_business/screen/transactions/transactionScreen.dart';
import 'package:snabb_business/utils/colors.dart';

import '../../models/pagemodel.dart';
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
                  color: AppColors.blue.withOpacity(0.9),
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
                    child: Container(
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
                              "Lanugauge",
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
                            Text(
                              "Currency",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.012,
                            ),
                            Text(
                              "Dollar",
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
                              "Feedback & Supory",
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
                    ),
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
