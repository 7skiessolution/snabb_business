import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../models/dataclassgraphModel.dart';

class SalesChart extends StatefulWidget {
  SalesChart({super.key, required this.home});
  bool home;
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

  Future<void> showImageDialog(BuildContext context, data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return AlertDialog(
          elevation: 10,
          shadowColor: Colors.lightGreen,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.transationdetails,
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "${AppLocalizations.of(context)!.walletname}: ",
                                  style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  data.name,
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "${AppLocalizations.of(context)!.amount}: ",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: Colors.lightGreen,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(data.amount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.03,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "${AppLocalizations.of(context)!.cname}: ",
                                      style: TextStyle(
                                          color: Colors.lightGreen,
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.category!,
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "${AppLocalizations.of(context)!.date}: ",
                                      style: TextStyle(
                                          color: Colors.lightGreen,
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.dateTime.toString().substring(0, 10),
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.12,
                        width: width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "${AppLocalizations.of(context)!.notes}: ",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: Colors.lightGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  data.note!,
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: data.file != null && data.file != ""
                                ? FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: 'assets/images/bell.png',
                                    image:
                                        '${StaticValues.imageUrl}${data.file!}',
                                    placeholderErrorBuilder:
                                        (context, error, stackTrace) {
                                      return const CircularProgressIndicator();
                                    },
                                  )
                                : Text(AppLocalizations.of(context)!
                                    .nofileforthistransaction),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.08,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreen, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.clear,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(data.imageUrl!)),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (obj) {
      return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   leading: InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Icon(
          //       Icons.arrow_back,
          //       color: Colors.white,
          //       size: width * 0.065,
          //     ),
          //   ),
          //   centerTitle: true,
          //   title: Text(
          //     "Sale",
          //     style: TextStyle(
          //         fontSize: width * 0.04,
          //         fontWeight: FontWeight.w800,
          //         color: white),
          //   ),
          // ),

          body: SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  widget.home
                      ? const SizedBox()
                      : AppBarWidgt(
                          text: "Sale",
                        ),
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
                              height: height * 0.19,
                              width: width,
                              child: SfCartesianChart(
                                primaryYAxis: NumericAxis(
                                  minimum: 0,
                                  numberFormat: NumberFormat.compact(),
                                  // interval: 100,
                                  // desiredIntervals:
                                  //     100,
                                ),
                                backgroundColor: Colors.white,
                                selectionGesture: ActivationMode.doubleTap,
                                enableMultiSelection: true,
                                enableAxisAnimation: true,
                                primaryXAxis: DateTimeAxis(),
                                series: <ChartSeries>[
                                  LineSeries<SalesData, DateTime>(
                                    legendIconType: LegendIconType.rectangle,
                                    animationDuration: 5,
                                    animationDelay: 3,
                                    name: "Sale",
                                    color: Colors.lightGreen,
                                    markerSettings: const MarkerSettings(
                                      isVisible: true,
                                      width: 5,
                                      height: 5,
                                      borderWidth: 0.5,
                                      color: Colors.lightGreen,
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
                                    color: Colors.lightGreen,
                                    markerSettings: const MarkerSettings(
                                      isVisible: true,
                                      width: 5,
                                      height: 5,
                                      borderWidth: 0.5,
                                      color: Colors.lightGreen,
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
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.05,
                    width: width * 0.6,
                    color: Colors.lightGreen,
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
                        return InkWell(
                          onTap: () {
                            showImageDialog(
                                context, obj.salesTransaction[index]);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.015),
                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.13,
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: height * 0.005),
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
                                      // CircleAvatar(
                                      //     backgroundColor: colors.lightgreen,
                                      //     child: Image.asset(data.imageUrl!)),
                                      Text(
                                        "${data.category}",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen),
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
                                                color: Colors.lightGreen,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${data.amount} ${obj.curency}",
                                                  style: TextStyle(
                                                      fontSize: width * 0.02,
                                                      fontWeight:
                                                          FontWeight.bold,
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
