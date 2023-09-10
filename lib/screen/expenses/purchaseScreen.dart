import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller/homeController.dart';
import '../../models/dataclassgraphModel.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (obj) {
      return Container(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: height * 0.21,
                width: width,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      "Purchase",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w800,
                          color: darkblue),
                    ),
                    Container(
                        height: height * 0.16,
                        width: width,
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              interval: 15,
                              desiredIntervals:
                                  7, // Set this to the number of desired ticks (7 in this case)
                            ),
                            tooltipBehavior: obj.tooltip,
                            series: <ChartSeries<Chartdata, String>>[
                              ColumnSeries<Chartdata, String>(
                                dataSource: obj.data,
                                xValueMapper: (Chartdata data, _) => data.x,
                                yValueMapper: (Chartdata data, _) => data.y,
                                name: 'Purchase',
                                color: darkblue,
                              ),
                            ])),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                height: height * 0.05,
                width: width * 0.6,
                color: darkblue,
                child: Center(
                  child: Text(
                    "Purchase Transactions",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: height * 0.015),
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width,
                            decoration: BoxDecoration(
                              color: darkblue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Recieve Payment 11,000 PKR ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.03,
                                        color: white),
                                  ),
                                  Text(
                                    "Balamce Amount: 11,000 PKR ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.03,
                                        color: white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.1,
                            width: width,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  backgroundColor: darkblue,
                                  child: Image.asset(
                                    "images/wallet.png",
                                    color: white,
                                  ),
                                ),
                                Text(
                                  "Product 1",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: darkblue),
                                ),
                                Container(
                                  height: height * 0.1,
                                  width: width * 0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: height * 0.02,
                                        width: width * 0.2,
                                        decoration: BoxDecoration(
                                          color: darkblue,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "27,0000 PKR",
                                            style: TextStyle(
                                                fontSize: width * 0.02,
                                                fontWeight: FontWeight.bold,
                                                color: white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        "06/07/2023",
                                        style: TextStyle(
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
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
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
