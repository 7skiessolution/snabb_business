import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/summary_model.dart';
import 'package:snabb_business/screen/summary/c/summaryController.dart';
import 'package:snabb_business/utils/color.dart';

// ignore: must_be_immutable
class SummaryWidget extends StatefulWidget {
  const SummaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  var height, width;
  @override
  void initState() {
    Get.put(SummaryController());
    Get.put(HomeController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SizedBox(
        height: size.height - 150,
        child: GetBuilder<SummaryController>(builder: (obj) {
          return FutureBuilder<SummaryModel>(
              future: obj.getSummery(
                  "${obj.now.day}-${obj.now.month}-${obj.now.year}"),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          num balance =
                              snapshot.data!.data![index].transactions!.sale! -
                                  snapshot.data!.data![index].transactions!
                                      .purchase! -
                                  snapshot.data!.data![index].transactions!
                                      .expense!;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                obj.showImageDialog(
                                    snapshot
                                        .data!.data![index].transactions!.sale!,
                                    snapshot.data!.data![index].transactions!
                                        .purchase!,
                                    snapshot.data!.data![index].transactions!
                                        .expense!,
                                    context);
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            obj.model!.data![index].month
                                                .toString(),
                                            // "${widget.months[selectedMonth.month - 1]} ${selectedMonth.year}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: PieChart(
                                              dataMap: {
                                                "Sale": double.parse(
                                                    "${snapshot.data!.data![index].transactions!.sale!}"),
                                                "Purchase": double.parse(
                                                    "${snapshot.data!.data![index].transactions!.purchase!}"),
                                                "Expense": double.parse(
                                                    "${snapshot.data!.data![index].transactions!.expense!}"),
                                              },
                                              colorList: const [
                                                Color.fromRGBO(124, 179, 66, 1),
                                                Color.fromRGBO(255, 59, 59, 1),
                                                Color.fromRGBO(74, 199, 221, 1),
                                              ],
                                              legendOptions:
                                                  const LegendOptions(
                                                showLegends: false,
                                              ),
                                              chartValuesOptions:
                                                  const ChartValuesOptions(
                                                showChartValues: false,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.035,
                                            width: width * 0.45,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height,
                                                  width: width * 0.2,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Sales",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: width * 0.032,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.01,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: height,
                                                    width: width,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: FittedBox(
                                                      child: Text(
                                                        " ${HomeController.to.curency} ${snapshot.data!.data![index].transactions!.sale!}",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    greencolor,
                                                                fontSize:
                                                                    width *
                                                                        0.032,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.035,
                                            width: width * 0.45,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height,
                                                  width: width * 0.2,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Purchase",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: width * 0.032,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.01,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: height,
                                                    width: width,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: FittedBox(
                                                      child: Text(
                                                        "-${HomeController.to.curency} ${obj.model!.data![index].transactions!.purchase!}",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: redcolor,
                                                                fontSize:
                                                                    width *
                                                                        0.032,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.035,
                                            width: width * 0.45,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height,
                                                  width: width * 0.2,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Expense",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: width * 0.032,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.01,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: height,
                                                    width: width,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: FittedBox(
                                                      child: Text(
                                                        "-${HomeController.to.curency} ${obj.model!.data![index].transactions!.expense!}",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize:
                                                                    width *
                                                                        0.032,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.05,
                                            width: width * 0.45,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: height,
                                                  width: width * 0.2,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Total",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black,
                                                        fontSize: width * 0.032,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.01,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: height,
                                                    width: width,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: FittedBox(
                                                      child: Text(
                                                        balance > 0
                                                            ? "${HomeController.to.curency} $balance"
                                                            : "${HomeController.to.curency} $balance",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    greencolor,
                                                                fontSize:
                                                                    width *
                                                                        0.032,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              });
        }));
  }
}
