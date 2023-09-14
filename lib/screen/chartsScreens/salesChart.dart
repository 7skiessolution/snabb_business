import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/utils/color.dart';

class SalesChart extends StatefulWidget {
  const SalesChart({super.key});

  @override
  State<SalesChart> createState() => _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  @override
  void initState() {
    Get.put(HomeController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (obj) {
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: width * 0.065,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Sale",
            style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w800,
                color: white),
          ),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 12),
                  child: Container(
                    height: height * 0.20,
                    width: width,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: height * 0.14,
                          width: width,
                          // child: SfCartesianChart(
                          //   primaryYAxis: NumericAxis(
                          //     minimum: 0,
                          //     interval: 15,
                          //     desiredIntervals:
                          //         7, // Set this to the number of desired ticks (7 in this case)
                          //   ),
                          //   backgroundColor: Colors.white,
                          //   selectionGesture: ActivationMode.doubleTap,
                          //   enableMultiSelection: true,
                          //   enableAxisAnimation: true,
                          //   primaryXAxis: DateTimeAxis(),
                          //   series: <ChartSeries>[
                          //     LineSeries<SalesData, DateTime>(
                          //       legendIconType: LegendIconType.rectangle,
                          //       animationDuration: 5,
                          //       animationDelay: 3,
                          //       name: "Sale",
                          //       color: lightgreen,
                          //       markerSettings: MarkerSettings(
                          //         isVisible: true,
                          //         width: 5,
                          //         height: 5,
                          //         borderWidth: 0.5,
                          //         color: lightgreen,
                          //       ),
                          //       // dataLabelSettings: DataLabelSettings(
                          //       //   isVisible:
                          //       //       true, // Show data labels (optional)
                          //       // ),
                          //       enableTooltip: true,
                          //       isVisible: true,
                          //       dataSource: obj.chartData,
                          //       xValueMapper: (SalesData sales, _) =>
                          //           sales.year,
                          //       yValueMapper: (SalesData sales, _) =>
                          //           sales.sales,
                          //     ),
                          //     LineSeries<SalesData, DateTime>(
                          //       legendIconType: LegendIconType.rectangle,
                          //       animationDuration: 5,
                          //       animationDelay: 3,
                          //       color: lightgreen,
                          //       markerSettings: MarkerSettings(
                          //         isVisible: true,
                          //         width: 5,
                          //         height: 5,
                          //         borderWidth: 0.5,
                          //         color: lightgreen,
                          //       ),
                          //       enableTooltip: true,
                          //       isVisible: true,
                          //       dataSource: obj.chart,
                          //       xValueMapper: (SalesData sales, _) =>
                          //           sales.year,
                          //       yValueMapper: (SalesData sales, _) =>
                          //           sales.sales,
                          //     )
                          //   ],
                          // ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: height * 0.05,
                  width: width * 0.6,
                  color: lightgreen,
                  child: Center(
                    child: Text(
                      "Sales Transactions",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: obj.salesTransaction.length,
                    itemBuilder: (context, index) {
                      var data = obj.salesTransaction[index];
                      return Padding(
                        padding: EdgeInsets.only(top: height * 0.015),
                        child: Stack(
                          children: [
                            Container(
                              height: height * 0.13,
                              width: width,
                              decoration: BoxDecoration(
                                color: lightgreen,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                      backgroundColor: lightgreen,
                                      child: Image.asset(data.imageUrl!)),
                                  Text(
                                    "${data.category}",
                                    style: TextStyle(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.bold,
                                        color: lightgreen),
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
                                            color: lightgreen,
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
      );
    });
  }
}
