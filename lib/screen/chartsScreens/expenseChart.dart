import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller/homeController.dart';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({super.key});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (obj) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                    AppBarWidgt(text: "Purchase"),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      height: height * 0.26,
                      width: width,
                      decoration: BoxDecoration(
                          color: white, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Text(
                            "Expenses",
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w800,
                                color: expensecolor),
                          ),
                          Container(
                              height: height * 0.2,
                              width: width,
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  primaryYAxis: NumericAxis(
                                    minimum: 0,
                                    numberFormat:
                                        NumberFormat
                                            .compact(),
                                  ),
                                  tooltipBehavior: obj.tooltip,
                                  series: <ChartSeries<Chartdata, String>>[
                                    BarSeries<Chartdata, String>(
                                        dataSource: obj.expensedata,
                                        xValueMapper: (Chartdata data, _) => data.x,
                                        yValueMapper: (Chartdata data, _) => data.y,
                                        name: 'Expesense',
                                        color: expensecolor)
                                  ]))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.05,
                    width: width * 0.6,
                    color: expensecolor,
                    child: Center(
                      child: Text(
                        "Expenses Transactions",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: obj.expenseData.length,
                      itemBuilder: (context, index) {
                        var data = obj.expenseData[index];
                        return Padding(
                          padding: EdgeInsets.only(top: height * 0.015),
                          child: Stack(
                            children: [
                              Container(
                                height: height * 0.13,
                                width: width,
                                decoration: BoxDecoration(
                                  color: expensecolor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(bottom: height * 0.005),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Recieve Payment ${(data.partialAmount ?? 0.0)} ${obj.curency} ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.025,
                                              color: white),
                                        ),
                                        Text(
                                          "Balamce Amount ${(data.amount ?? 0.0) - (data.partialAmount ?? 0.0)} ${obj.curency} ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
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
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                              color: expensecolor,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${data.amount}",
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
                                            data.dateTime
                                                .toString()
                                                .substring(0, 10),
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
          ),
        ),
      );
    });
  }
}
