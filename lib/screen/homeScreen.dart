import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/models/dataclassgraphModel.dart';
import 'package:snabb_business/screen/chartsScreens/purchaseChart.dart';
import 'package:snabb_business/screen/chartsScreens/salesChart.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chartsScreens/expenseChart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(HomeController());
    HomeController.to.saleListOFChart();
    HomeController.to.expenseList(0);
    HomeController.to.expenseList(2);
    TransactionController.to.getCatagoriesdata("income");
    HomeController.to.getUserProfile();
    HomeController.to.getWalletdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (obj) {
      return Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Container(
                  height: height * 0.13,
                  width: width,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: height * 0.15,
                        width: width * 0.3,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height * 0.1,
                              width: width * 0.2,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    "images/images__1_-removebg-preview (1).png"),
                                //   fit: BoxFit.cover,
                              )),
                            ),
                            Text(
                              "July 2023",
                              style: TextStyle(
                                  fontSize: width * 0.02, color: lightgray),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.15,
                        width: width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Summary",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: darkblue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Sale",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: darkblue),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${obj.totalSale.toString()} ${obj.curency}",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: darkblue),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Purchase",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: darkblue),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${obj.totalPurchase.toString()} ${obj.curency}",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: darkblue),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Expenses",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: darkblue),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${obj.totalExpanse.toString()} ${obj.curency}",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: darkblue),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SalesChart(),
                        ));
                    // setState(() {
                    //   sale = true;
                    //   purchase = false;
                    //   expense = false;
                    // });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: Container(
                      height: height * 0.20,
                      width: width,
                      decoration: BoxDecoration(
                          color: white, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Sale",
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w800,
                                color: lightgreen),
                          ),
                          SizedBox(
                            height: height * 0.14,
                            width: width,
                            child: SfCartesianChart(
                              // margin: EdgeInsets.all(20.0),
                              primaryYAxis: NumericAxis(
                                  minimum: 0,
                                  interval: 5,
                                  desiredIntervals:
                                      7 // Set this to the number of desired ticks (7 in this case)
                                  // visibleMaximum: obj.chartData.last.sales
                                  ),
                              backgroundColor: Colors.white,
                              selectionGesture: ActivationMode.doubleTap,
                              enableMultiSelection: true,
                              enableAxisAnimation: true,
                              primaryXAxis: DateTimeAxis(),
                              series: <ChartSeries<SalesData, DateTime>>[
                                LineSeries<SalesData, DateTime>(
                                  legendIconType: LegendIconType.rectangle,
                                  animationDuration: 5,
                                  animationDelay: 3,
                                  name: "Sale",
                                  color: lightgreen,
                                  markerSettings: MarkerSettings(
                                    isVisible: true,
                                    width: 2,
                                    height: 3,
                                    borderWidth: 0.5,
                                    color: lightgreen,
                                  ),
                                  dataLabelSettings: const DataLabelSettings(
                                    isVisible:
                                        true, // Show data labels (optional)
                                  ),
                                  enableTooltip: true,
                                  isVisible: true,
                                  dataSource: obj.chartData,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                ),
                                LineSeries<SalesData, DateTime>(
                                  legendIconType: LegendIconType.rectangle,
                                  animationDuration: 5,
                                  animationDelay: 3,
                                  color: lightgreen,
                                  markerSettings: MarkerSettings(
                                    isVisible: true,
                                    width: 2,
                                    height: 3,
                                    borderWidth: 0.5,
                                    color: lightgreen,
                                  ),
                                  enableTooltip: true,
                                  isVisible: true,
                                  dataSource: obj.chart,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PurchaseChart(),
                        ));
                  },
                  child: Container(
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
                        SizedBox(
                          height: height * 0.16,
                          width: width,
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(
                                minimum: 0,
                                interval: 5,
                                desiredIntervals:
                                    7, // Set this to the number of desired ticks (7 in this case)
                              ),
                              tooltipBehavior: obj.tooltip,
                              series: <ChartSeries<Chartdata, String>>[
                                ColumnSeries<Chartdata, String>(
                                  dataSource: obj.purchasedata,
                                  xValueMapper: (Chartdata data, _) => data.x,
                                  yValueMapper: (Chartdata data, _) => data.y,
                                  name: 'Purchase',
                                  color: const Color.fromRGBO(8, 142, 255, 1),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExpenseChart(),
                        ));
                  },
                  child: Padding(
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
                          SizedBox(
                            height: height * 0.2,
                            width: width,
                            child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                primaryYAxis: NumericAxis(
                                  minimum: 0,
                                  interval: 5,
                                  desiredIntervals:
                                      7, // Set this to the number of desired ticks (7 in this case)
                                ),
                                tooltipBehavior: obj.tooltip,
                                series: <ChartSeries<Chartdata, String>>[
                                  BarSeries<Chartdata, String>(
                                      dataSource: obj.expensedata,
                                      xValueMapper: (Chartdata data, _) =>
                                          data.x,
                                      yValueMapper: (Chartdata data, _) =>
                                          data.y,
                                      name: 'Expesense',
                                      color: expensecolor)
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      );
      //         : const ExpenseChart()
      //     : const PurchaseChart()
      // : const SalesChart();
    });
  }
}
