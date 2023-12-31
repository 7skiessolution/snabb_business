import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/pinch_zoom_image.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:snabb_business/models/get_year_type_purchase.dart' as plist;

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../controller/homeController.dart';

class PurchaseChart extends StatefulWidget {
  PurchaseChart({super.key, required this.home});
  bool home;

  @override
  State<PurchaseChart> createState() => _PurchaseChartState();
}

class _PurchaseChartState extends State<PurchaseChart> {
  Future<void> showPurchaseImageDialog(
      BuildContext context, plist.Data obj, var height, var width) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shadowColor: blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                            child: Text(
                          "Purchase Transaction Details",
                          style: TextStyle(
                              color: darkblue,
                              fontSize: width * 0.03,
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
                                height: height,
                                width: width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Name: ",
                                      style: TextStyle(
                                          color: blue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.details!.name!}",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                                      "Number: ",
                                      style: TextStyle(
                                          color: blue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.details!.telePhone!.toString(),
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
                                      "Email: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: blue,
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
                                      'payBackDate:'.capitalize!,
                                      style: TextStyle(
                                          color: blue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " ${obj.details!.payBackDay == null ? "------" : obj.details!.payBackDay.toString().substring(0, 10)}",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                                    Text(
                                      AppLocalizations.of(context)!
                                          .date
                                          .capitalize!,
                                      style: TextStyle(
                                          color: blue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.dateTime.toString().substring(0, 10)}",
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
                                      AppLocalizations.of(context)!
                                          .amount
                                          .capitalize!,
                                      style: TextStyle(
                                          color: blue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.totalAmount.toString()}",
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
                                      'Reg#:'.capitalize!,
                                      style: TextStyle(
                                          color: blue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.details!.companyReg!}",
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
                                          color: blue,
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
                                          color: blue,
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
                                          color: blue,
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
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Note: ",
                                style: TextStyle(
                                    color: blue,
                                    fontSize: width * 0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  obj.note ?? "",
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
                        decoration:
                            BoxDecoration(color: blue, shape: BoxShape.circle),
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
  void initState() {
    Get.put(HomeController());
    HomeController.to.getlistPurchase(0);

    // TODO: implement initState
    super.initState();
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
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        widget.home
                            ? const SizedBox()
                            : AppBarWidgt(text: "Purchase"),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: height * 0.21,
                            width: width,
                            decoration: BoxDecoration(
                                color: whitecolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
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
                                        series: <ChartSeries<Chartdata,
                                            String>>[
                                          ColumnSeries<Chartdata, String>(
                                            dataSource: obj.purchasedata,
                                            xValueMapper: (Chartdata data, _) =>
                                                data.x,
                                            yValueMapper: (Chartdata data, _) =>
                                                data.y,
                                            name: 'Purchase',
                                            color: blue,
                                          ),
                                        ])),
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
                          color: blue,
                          child: Center(
                            child: Text(
                              "Purchase Transactions".toUpperCase(),
                              style: GoogleFonts.poppins(
                                  color: whitecolor,
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                          child: obj.purchaseData.isNotEmpty
                              ? ListView.builder(
                                  itemCount: obj.purchaseData.length,
                                  itemBuilder: (context, index) {
                                    var data = obj.purchaseData[index];
                                    return InkWell(
                                      onTap: () {
                                        showPurchaseImageDialog(
                                            context,
                                            data,
                                            MediaQuery.of(context).size.height,
                                            MediaQuery.of(context).size.width);
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(top: height * 0.01),
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
                                                  color: blue,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8, bottom: 3),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          "Recieve: ${(data.details!.partialAmount ?? 0.0)} ${obj.curency}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color:
                                                                      whitecolor,
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                        Text(
                                                          "Balance: ${(data.totalAmount ?? 0.0) - (data.details!.partialAmount ?? 0.0)} ${obj.curency} ",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color:
                                                                      whitecolor,
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
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
                                                  color: whitecolor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width: width * 0.05,
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor: blue,
                                                      child: Image.asset(
                                                        "images/sale.png",
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.05,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        height: height,
                                                        width: width,
                                                        child: Text(
                                                          data.details!.name ??
                                                              "Name",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: blue,
                                                                  fontSize:
                                                                      width *
                                                                          0.035,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
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
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height:
                                                                height * 0.02,
                                                            width: width * 0.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "${data.totalAmount} ${obj.curency}",
                                                                style: GoogleFonts.poppins(
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
                                                            height:
                                                                height * 0.01,
                                                          ),
                                                          Text(
                                                            data.dateTime
                                                                .toString()
                                                                .substring(
                                                                    0, 10),
                                                            style: GoogleFonts.poppins(
                                                                color:
                                                                    lightgray,
                                                                fontSize:
                                                                    width *
                                                                        0.02,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
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
                                )
                              : const Center(child: Text("No Data Found !")),
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
