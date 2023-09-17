// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller/homeController.dart';

class ExpenceByCategory extends StatefulWidget {
  String? type;
  ExpenceByCategory({super.key, required this.type});

  @override
  State<ExpenceByCategory> createState() => _ExpenceByCategoryState();
}

class _ExpenceByCategoryState extends State<ExpenceByCategory> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: GetBuilder<HomeController>(builder: (obj) {
          return SizedBox(
            height: height,
            width: width,
            child: Column(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: AppBarWidgt(text: "Chart")),
              Expanded(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "${widget.type} By Category",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.25,
                            ),
                            Icon(
                              Icons.pie_chart,
                              color: white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.1,
                      left: width * 0.05,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: Container(
                            height: height * 0.35,
                            width: width * 0.9,
                            color: white,
                            child: SizedBox(
                              height: height * 0.2,
                              width: width,
                              child: widget.type == "Expense"
                                  ? SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(
                                        minimum: 0,
                                        numberFormat: NumberFormat.compact(),
                                        // interval: 1000,
                                        // desiredIntervals:
                                        //     7, // Set this to the number of desired ticks (7 in this case)
                                      ),
                                      tooltipBehavior: obj.tooltip,
                                      series: <ChartSeries<Chartdata, String>>[
                                          BarSeries<Chartdata, String>(
                                              dataSource: obj.expensedata,
                                              xValueMapper:
                                                  (Chartdata data, _) => data.x,
                                              yValueMapper:
                                                  (Chartdata data, _) => data.y,
                                              name: 'Expesense',
                                              color: expensecolor)
                                        ])
                                  : widget.type == "Purchase"
                                      ? SfCartesianChart(
                                          primaryXAxis: CategoryAxis(),
                                          primaryYAxis: NumericAxis(
                                            minimum: 0,
                                            numberFormat:
                                                NumberFormat.compact(),
                                            // interval: 1000,
                                            // desiredIntervals:
                                            //     7, // Set this to the number of desired ticks (7 in this case)
                                          ),
                                          tooltipBehavior: obj.tooltip,
                                          series: <ChartSeries<Chartdata,
                                              String>>[
                                              BarSeries<Chartdata, String>(
                                                  dataSource: obj.purchasedata,
                                                  xValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.y,
                                                  name: 'puchase',
                                                  color: darkblue)
                                            ])
                                      : widget.type == "Expense"
                                          ? SfCartesianChart(
                                              primaryXAxis: CategoryAxis(),
                                              primaryYAxis: NumericAxis(
                                                minimum: 0,
                                                numberFormat:
                                                    NumberFormat.compact(),
                                                // interval: 1000,
                                                // desiredIntervals:
                                                //     7, // Set this to the number of desired ticks (7 in this case)
                                              ),
                                              tooltipBehavior: obj.tooltip,
                                              series: <ChartSeries<Chartdata,
                                                  String>>[
                                                  BarSeries<Chartdata, String>(
                                                      dataSource:
                                                          obj.expensedata,
                                                      xValueMapper:
                                                          (Chartdata data, _) =>
                                                              data.x,
                                                      yValueMapper:
                                                          (Chartdata data, _) =>
                                                              data.y,
                                                      name: 'Expesense',
                                                      color: expensecolor)
                                                ])
                                          : SfCartesianChart(
                                              primaryXAxis: CategoryAxis(),
                                              primaryYAxis: NumericAxis(
                                                minimum: 0,
                                                numberFormat:
                                                    NumberFormat.compact(),
                                                // interval: 1000,
                                                // desiredIntervals:
                                                //     7, // Set this to the number of desired ticks (7 in this case)
                                              ),
                                              tooltipBehavior: obj.tooltip,
                                              series: <ChartSeries<Chartdata,
                                                  String>>[
                                                  BarSeries<Chartdata, String>(
                                                      dataSource:
                                                          obj.saledatalist,
                                                      xValueMapper:
                                                          (Chartdata data, _) =>
                                                              data.x,
                                                      yValueMapper:
                                                          (Chartdata data, _) =>
                                                              data.y,
                                                      name: 'sale',
                                                      color: Colors.lightGreen)
                                                ]),
                            )),
                      ),
                    ),
                    Positioned(
                      top: height * 0.47,
                      left: width * 0.01,
                      child: Container(
                          height: height * 0.42,
                          width: width * 0.98,
                          color: Colors.transparent,
                          child: widget.type == "Expense"
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: obj.expenseData.length,
                                    itemBuilder: (context, index) {
                                      var data = obj.expenseData[index];

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
                                                  color: expensecolor,
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
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  width * 0.025,
                                                              color: white),
                                                        ),
                                                        Text(
                                                          "Balamce Amount ${(data.amount ?? 0.0) - (data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                          expensecolor,
                                                      child: Image.asset(
                                                        data.imageUrl!,
                                                        color: white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${data.category}",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: expensecolor),
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
                                                            height:
                                                                height * 0.02,
                                                            width: width * 0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  expensecolor,
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
                                                                    color:
                                                                        white),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                height * 0.01,
                                                          ),
                                                          Text(
                                                            data.dateTime
                                                                .toString()
                                                                .substring(
                                                                    0, 10),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    width *
                                                                        0.02,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    lightgray),
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
                                  ),
                                )
                              : widget.type == "Purchase"
                                  ? Expanded(
                                      child: ListView.builder(
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
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 8,
                                                                bottom: 8),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              "Recieve Payment ${(data.partialAmount ?? 0.0)} ${obj.curency}",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
                                                                  color: white),
                                                            ),
                                                            Text(
                                                              "Balamce Amount ${(data.amount ?? 0.0) - (data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
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
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              darkblue,
                                                          child: Image.asset(
                                                            data.imageUrl!,
                                                            color: white,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${data.category}",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                                height: height *
                                                                    0.02,
                                                                width:
                                                                    width * 0.2,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      darkblue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "${data.amount} ${obj.curency}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            width *
                                                                                0.02,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color:
                                                                            white),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                data.dateTime
                                                                    .toString()
                                                                    .substring(
                                                                        0, 10),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        width *
                                                                            0.02,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        lightgray),
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
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
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
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: height *
                                                                    0.005),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              "Recieve Payment ${(data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
                                                                  color: white),
                                                            ),
                                                            Text(
                                                              "Balamce Amount ${(data.amount ?? 0.0) - (data.partialAmount ?? 0.0)} ${obj.curency} ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
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
                                                          BorderRadius.circular(
                                                              6),
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
                                                              fontSize:
                                                                  width * 0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .lightGreen),
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
                                                                height: height *
                                                                    0.02,
                                                                width:
                                                                    width * 0.2,
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
                                                                        color:
                                                                            white),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.01,
                                                              ),
                                                              Text(
                                                                data.dateTime
                                                                    .toString()
                                                                    .substring(
                                                                        0, 10),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        width *
                                                                            0.02,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        lightgray),
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
                                      ),
                                    )),
                    )
                  ],
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }
}

class CardOfExpence extends StatelessWidget {
  CardOfExpence({
    super.key,
    this.image,
    required this.rs,
    required this.subtitle,
    required this.title,
  });

  String? image;
  String title;
  String subtitle;
  String rs;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: height * 0.1,
        decoration:
            BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.04,
              ),
              CircleAvatar(
                  radius: 25,
                  backgroundColor: darkblue,
                  child: image == null
                      ? const CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.money,
                          ),
                        )
                      : CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(image!),
                        )),
              SizedBox(
                width: width * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.2,
              ),
              SizedBox(
                height: height * 0.1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            rs,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            " Rs",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(fontSize: 14, color: lightgray),
                          ),
                          Text(
                            rs,
                            style: TextStyle(fontSize: 14, color: lightgray),
                          ),
                          Text(
                            " 0PKR",
                            style: TextStyle(fontSize: 14, color: lightgray),
                          ),
                        ],
                      )
                    ]),
              ),
            ]),
      ),
    );
  }
}
