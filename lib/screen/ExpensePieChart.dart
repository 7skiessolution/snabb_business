// ignore_for_file: camel_case_types, must_be_immutable, unused_local_variable., file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'package:snabb_business/utils/color.dart';

import '../utils/appbarwidget.dart';

class ExpencePieChart extends StatefulWidget {
  const ExpencePieChart({super.key});

  @override
  State<ExpencePieChart> createState() => _ExpencePieChartState();
}

class _ExpencePieChartState extends State<ExpencePieChart> {
  var dataMap;
  @override
  Widget build(BuildContext context) {
    dataMap = <String, double>{
      "Income": 0,
      "expence": 1,
    };
    dataMap = <String, double>{
      "Income": 30,
      "expence": 70,
    };
    var colorList = <Color>[darkblue!, Colors.red];
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: AppBarWidgt(text: "Chart")),
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: SizedBox(
                  height: height * 0.3,
                  width: width,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.3,
                        width: width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/dollar.jpg"))),
                      ),
                      Container(
                        height: height * 0.3,
                        color: Colors.blue[900]!.withOpacity(0.9),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "Expence By Category",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.3,
                              ),
                              Icon(
                                Icons.insert_chart_outlined_sharp,
                                color: white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.2),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.blue[900],
                    child: Container(
                      height: height * 0.35,
                      width: width * 0.7,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: height * 0.2,
                          width: width * 0.6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 7.0, // Border width
                            ),
                          ),
                          child: pie.PieChart(
                            chartRadius: 180,
                            animationDuration: const Duration(seconds: 1),
                            chartValuesOptions: const pie.ChartValuesOptions(
                              showChartValueBackground: false,
                              chartValueBackgroundColor: Colors.amber,
                              // showChartValues: true,
                              showChartValues: false,
                              // chartValueBackgroundColor: Colors.amber,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                            ),
                            centerText: "Expense",
                            centerTextStyle:
                                const TextStyle(color: Colors.white),
                            totalValue: 100,
                            legendOptions:
                                const pie.LegendOptions(showLegends: false),
                            dataMap: dataMap,
                            chartType: pie.ChartType.disc,
                            baseChartColor: Colors.grey[300]!,
                            colorList: colorList,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.6,
                left: width * 0.05,
                child: SizedBox(
                  height: height * 0.42,
                  width: width * 0.9,
                  child: ListView(children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.blue[900],
                      child: Container(
                        height: height * 0.12,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            Divider(
                              color: lightgray,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, right: width * 0.03),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        backgroundImage:
                                            AssetImage("images/expensive.png")),
                                    SizedBox(
                                      height: height * 0.08,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Expenses",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Total:",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: lightgray),
                                                ),
                                                Text(
                                                  "12000.00 PKR",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: lightgray),
                                                ),
                                              ],
                                            )
                                          ]),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
