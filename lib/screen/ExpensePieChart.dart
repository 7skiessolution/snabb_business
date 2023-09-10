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
    var colorList = <Color>[darkblue, Colors.red];
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              AppBarWidgt(text: "Chart"),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width,
                      color: darkblue,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "Expence By Category",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.18,
                            ),
                            Icon(
                              Icons.insert_chart_outlined_sharp,
                              color: white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.1,
                      left: width * 0.15,
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
                    Positioned(
                      top: height * 0.45,
                      left: width * 0.15,
                      child: Container(
                        height: height * 0.42,
                        width: width * 0.7,
                        color: Colors.transparent,
                        child: ListView(children: [
                          Container(
                            height: height * 0.12,
                            color: white,
                            width: width,
                            // decoration:
                            //     BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "images/expensive.png")),
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
