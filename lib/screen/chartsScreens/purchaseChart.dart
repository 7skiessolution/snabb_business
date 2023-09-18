import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/pinch_zoom_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../controller/homeController.dart';

class PurchaseChart extends StatefulWidget {
  PurchaseChart({super.key, required this.home});
  bool home;

  @override
  State<PurchaseChart> createState() => _PurchaseChartState();
}

class _PurchaseChartState extends State<PurchaseChart> {
  Future<void> showImageDialog(BuildContext context, data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return AlertDialog(
          elevation: 10,
          shadowColor: darkblue,
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
                              color: darkblue,
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "${AppLocalizations.of(context)!.walletname}: ",
                                  style: TextStyle(
                                      color: darkblue,
                                      fontSize: width * 0.035,
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
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
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
                                          color: darkblue,
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.amount.toString(),
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
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
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
                                          fontSize: width * 0.035,
                                          color: darkblue,
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
                                          fontSize: width * 0.035,
                                          color: darkblue,
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
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "${AppLocalizations.of(context)!.notes}: ",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: darkblue,
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
                            child: data.files != null && data.files != ""
                                ? PinchZoomImage(
                                    image:
                                        '${StaticValues.imageUrl}${data.files!}',
                                  )
                                // ? FadeInImage.assetNetwork(
                                //     fit: BoxFit.cover,
                                //     placeholder: 'assets/images/bell.png',
                                //     image:
                                //         '${StaticValues.imageUrl}${data.files!}',
                                //     placeholderErrorBuilder:
                                //         (context, error, stackTrace) {
                                //       return const CircularProgressIndicator();
                                //     },
                                //   )
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
                        decoration: BoxDecoration(
                            color: darkblue, shape: BoxShape.circle),
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
          body: SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  widget.home
                      ? const SizedBox()
                      : AppBarWidgt(text: "Purchase"),
                  Container(
                    height: height * 0.21,
                    width: width,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        // Text(
                        //   "Purchase",
                        //   style: TextStyle(
                        //       fontSize: width * 0.04,
                        //       fontWeight: FontWeight.w800,
                        //       color: darkblue),
                        // ),
                        SizedBox(
                            height: height * 0.20,
                            width: width,
                            child: SfCartesianChart(
                                plotAreaBorderWidth: 0.2,
                                backgroundColor: white,
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
                                  ColumnSeries<Chartdata, String>(
                                    dataSource: obj.purchasedata,
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
                      itemCount: obj.purchaseData.length,
                      itemBuilder: (context, index) {
                        var data = obj.purchaseData[index];
                        return InkWell(
                          onTap: () {
                            showImageDialog(context, obj.purchaseData[index]);
                          },
                          child: Padding(
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Recieve Payment ${(data.partialAmount ?? 0.0)} ${obj.curency}",
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
                                        backgroundColor: darkblue,
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
                                            color: darkblue),
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
                                                color: darkblue,
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
