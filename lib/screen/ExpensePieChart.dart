// ignore_for_file: camel_case_types, must_be_immutable, unused_local_variable., file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/utils/color.dart';

import '../utils/appbarwidget.dart';

class ExpencePieChart extends StatefulWidget {
  String? type;
  ExpencePieChart({super.key, required this.type});

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
        body: GetBuilder<HomeController>(builder: (obj) {
          return SizedBox(
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
                          width: width,
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
                                  width: width * 0.28,
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
                  child: Container(
                      height: height * 0.42,
                      width: width * 0.98,
                      color: Colors.transparent,
                      child: widget.type == "Expense"
                          ? ListView.builder(
                              itemCount: obj.expenseData.length,
                              itemBuilder: (context, index) {
                                var data = obj.expenseData[index];

                                return InkWell(
                                  onTap: () {
                                    // showImageDialog(context, obj.expenseData[index]);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.015),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: height * 0.13,
                                          width: width,
                                          decoration: BoxDecoration(
                                            color: expensecolor,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: height * 0.005),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    "Recieve Payment ${(data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width * 0.025,
                                                        color: white),
                                                  ),
                                                  Text(
                                                    "Balamce Amount ${(data.amount ?? 0.0) - (data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width * 0.025,
                                                        color: white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: height * 0.1,
                                          width: width,
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: expensecolor,
                                                child: Image.asset(
                                                  data.imageUrl!,
                                                  color: white,
                                                ),
                                              ),
                                              Text(
                                                "${data.category}",
                                                style: TextStyle(
                                                    fontSize: width * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                    color: expensecolor),
                                              ),
                                              SizedBox(
                                                height: height * 0.1,
                                                width: width * 0.3,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: height * 0.02,
                                                      width: width * 0.2,
                                                      decoration: BoxDecoration(
                                                        color: expensecolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${data.amount}",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.02,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: white),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    Text(
                                                      data.dateTime
                                                          .toString()
                                                          .substring(0, 10),
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.02,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: lightgray),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : widget.type == "Purchase"
                              ? ListView.builder(
                                  itemCount: obj.purchaseData.length,
                                  itemBuilder: (context, index) {
                                    var data = obj.purchaseData[index];
                                    return InkWell(
                                      onTap: () {
                                        /// showImageDialog(context, obj.purchaseData[index]);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: height * 0.015),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: height * 0.13,
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: darkblue,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8, bottom: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        "Recieve Payment ${(data.details!.partialAmount ?? 0.0)} ${obj.curency}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                width * 0.025,
                                                            color: white),
                                                      ),
                                                      Text(
                                                        "Balamce Amount ${(data.totalAmount ?? 0.0) - (data.details!.partialAmount ?? 0.0)} ${obj.curency} ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                width * 0.025,
                                                            color: white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: height * 0.1,
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: darkblue,
                                                    child: Image.asset(
                                                      "images/sale.png",
                                                      color: white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${data.details!.name}",
                                                    style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: darkblue),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.1,
                                                    width: width * 0.3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: height * 0.02,
                                                          width: width * 0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: darkblue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "${data.totalAmount} ${obj.curency}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      width *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: white),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.01,
                                                        ),
                                                        Text(
                                                          data.dateTime
                                                              .toString()
                                                              .substring(0, 10),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.02,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: lightgray),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : ListView.builder(
                                  itemCount: obj.salaDatalist.length,
                                  itemBuilder: (context, index) {
                                    var data = obj.salaDatalist[index];

                                    return InkWell(
                                      onTap: () {
                                        // showImageDialog(context, obj.expenseData[index]);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: height * 0.015),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: height * 0.13,
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: Colors.lightGreen,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: height * 0.005),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        "Recieve Payment ${(data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                width * 0.025,
                                                            color: white),
                                                      ),
                                                      Text(
                                                        "Balamce Amount ${(data.amount ?? 0.0) - (data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                width * 0.025,
                                                            color: white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: height * 0.1,
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.lightGreen,
                                                    child: Image.asset(
                                                      data.imageUrl!,
                                                      color: white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${data.category}",
                                                    style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.lightGreen),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.1,
                                                    width: width * 0.3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: height * 0.02,
                                                          width: width * 0.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .lightGreen,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "${data.amount}",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      width *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: white),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.01,
                                                        ),
                                                        Text(
                                                          data.dateTime
                                                              .toString()
                                                              .substring(0, 10),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.02,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: lightgray),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
