import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/get_year_type_sale.dart' as slist;
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/pinch_zoom_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    // TODO: implement initState
    super.initState();
  }

  Future<void> showImageDialog(
    BuildContext context,
    slist.Data obj,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return AlertDialog(
          elevation: 10,
          shadowColor: greencolor,
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
                          "Sale Transaction Details",
                          style: TextStyle(
                              color: greencolor,
                              fontSize: width * 0.025,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      obj.details!.name == "null" ||
                              obj.details!.name == null ||
                              obj.details!.name!.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              height: height * 0.05,
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Name: ",
                                            style: TextStyle(
                                                fontSize: width * 0.025,
                                                color: greencolor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(obj.details!.name!,
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Number: ",
                                            style: TextStyle(
                                                color: greencolor,
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            obj.details!.telePhone.toString(),
                                            style: TextStyle(
                                              fontSize: width * 0.025,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      obj.details!.name == "null" ||
                              obj.details!.name == null ||
                              obj.details!.name!.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              height: height * 0.05,
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Email: ",
                                            style: TextStyle(
                                                fontSize: width * 0.025,
                                                color: greencolor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(obj.details!.email!,
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      obj.details!.payBackDay == null ||
                              obj.details!.payBackDay == "null"
                          ? const SizedBox()
                          : SizedBox(
                              height: height * 0.05,
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "PayBack: ",
                                            style: TextStyle(
                                                color: greencolor,
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            obj.details!.payBackDay
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                              fontSize: width * 0.025,
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
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.totalAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Date: ",
                                      style: TextStyle(
                                          color: greencolor,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.dateTime.toString().substring(0, 10),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                                      "Partial: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.details!.partialAmount!.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Balance: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        obj.details!.remainingAmount!
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
                                  ],
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
                                      "Bank: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.bankAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Cash: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.cashAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Other: ",
                                      style: TextStyle(
                                          color: greencolor,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.otherAmount.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                        height: height * 0.1,
                        width: width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Note: ",
                                style: TextStyle(
                                    fontSize: width * 0.025,
                                    color: greencolor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  obj.note ?? "No Note Available",
                                  style: TextStyle(
                                    fontSize: width * 0.025,
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
                            child: obj.file != null && obj.file != ""
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            elevation: 10,
                                            shadowColor: Colors.blue[900],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.7,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                      height: height,
                                                      width: width,
                                                      child: PinchZoomImage(
                                                        image:
                                                            '${StaticValues.imageUrl}${obj.file!}',
                                                      )
                                                      // decoration: BoxDecoration(
                                                      //     image: DecorationImage(
                                                      //         image: NetworkImage(
                                                      //             "${StaticValues.imageUrl}${data.file!}"))),
                                                      ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      Colors.blue[
                                                                          900],
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.clear,
                                                              size: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
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
                                    },
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/bell.png',
                                      image:
                                          '${StaticValues.imageUrl}${obj.file}',
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        return const CircularProgressIndicator();
                                      },
                                    ),
                                  )
                                : Text(
                                    "No File Available",
                                    style: TextStyle(
                                      fontSize: width * 0.025,
                                    ),
                                  ),
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
                            color: greencolor, shape: BoxShape.circle),
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/sale.png")),
                              shape: BoxShape.circle)),
                    ),
                  ),
                )
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
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/backImage.jpg"))),
                ),
                Container(
                  height: height,
                  width: width,
                  color: Colors.white.withOpacity(0.9),
                ),
                SizedBox(
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
                                color: white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                      height: height * 0.19,
                                      width: width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SfCartesianChart(
                                          primaryYAxis: NumericAxis(
                                            minimum: 0,
                                            numberFormat:
                                                NumberFormat.compact(),
                                            // interval: 100,
                                            // desiredIntervals:
                                            //     100,
                                          ),
                                          backgroundColor: Colors.white,
                                          selectionGesture:
                                              ActivationMode.doubleTap,
                                          enableMultiSelection: true,
                                          enableAxisAnimation: true,
                                          primaryXAxis: CategoryAxis(),
                                          series: <ChartSeries>[
                                            LineSeries<SalesData, String>(
                                              legendIconType:
                                                  LegendIconType.rectangle,
                                              animationDuration: 5,
                                              animationDelay: 3,
                                              name: "Sale",
                                              color: greencolor,
                                              markerSettings: MarkerSettings(
                                                isVisible: true,
                                                width: 5,
                                                height: 5,
                                                borderWidth: 0.5,
                                                color: greencolor,
                                              ),
                                              enableTooltip: true,
                                              isVisible: true,
                                              dataSource: obj.chartData,
                                              xValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.sales,
                                            ),
                                            // LineSeries<SalesData, String>(
                                            //   legendIconType:
                                            //       LegendIconType.rectangle,
                                            //   animationDuration: 5,
                                            //   animationDelay: 3,
                                            //   color: greencolor,
                                            //   markerSettings: MarkerSettings(
                                            //     isVisible: true,
                                            //     width: 5,
                                            //     height: 5,
                                            //     borderWidth: 0.5,
                                            //     color: greencolor,
                                            //   ),
                                            //   enableTooltip: true,
                                            //   isVisible: true,
                                            //   dataSource: obj.chart,
                                            //   xValueMapper:
                                            //       (SalesData sales, _) =>
                                            //           sales.year,
                                            //   yValueMapper:
                                            //       (SalesData sales, _) =>
                                            //           sales.sales,
                                            // )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.6,
                          color: greencolor,
                          child: Center(
                            child: Text(
                              "Sales Transactions".toUpperCase(),
                              style: GoogleFonts.poppins(
                                  color: whitecolor,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: obj.salaData.length,
                            itemBuilder: (context, index) {
                              var data = obj.salaData[index];
                              return InkWell(
                                onTap: () {
                                  showImageDialog(context, data);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: height * 0.015),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: height * 0.13,
                                          width: width,
                                          decoration: BoxDecoration(
                                            color: greencolor,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                    "Recieve: ${(data.totalAmount ?? 0.0)} ${obj.curency} ",
                                                    style: GoogleFonts.poppins(
                                                        color: whitecolor,
                                                        fontSize: width * 0.025,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    "Balance: ${(data.totalAmount ?? 0.0) - (data.details!.partialAmount! ?? 0.0)} ${obj.curency} ",
                                                    style: GoogleFonts.poppins(
                                                        color: whitecolor,
                                                        fontSize: width * 0.025,
                                                        fontWeight:
                                                            FontWeight.w500),
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
                                              SizedBox(
                                                width: width * 0.05,
                                              ),
                                              CircleAvatar(
                                                  backgroundColor: greencolor,
                                                  child: Image.asset(
                                                      "images/sale.png")),
                                              SizedBox(
                                                width: width * 0.05,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: height,
                                                  width: width,
                                                  child: Text(
                                                    data.details!.name ??
                                                        "Daily Sales",
                                                    style: GoogleFonts.poppins(
                                                        color: greencolor,
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.05,
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
                                                        color: greencolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${data.totalAmount} ${obj.curency}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color:
                                                                      whitecolor,
                                                                  fontSize:
                                                                      width *
                                                                          0.02,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.02,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
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
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
