import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:snabb_business/controller/debit-credit/deptviewchartController.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ViewDebitScreen extends StatefulWidget {
  DebitCreditData? data;
  num? remaing;

  String? id;
  double percentage;
  double? slider;
  ViewDebitScreen(
      {super.key,
      this.data,
      this.remaing,
      required this.id,
      required this.percentage,
      required this.slider});

  @override
  State<ViewDebitScreen> createState() => _ViewDebitScreenState();
}

class _ViewDebitScreenState extends State<ViewDebitScreen> {
  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>[
      '',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11',
      '12'
    ];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
          color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 9
          // fontSize: 14,
          ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      // space: 16, //margin top
      child: text,
    );
  }

  String convertToKBchart(int value) {
    //double value1 = ViewDesbitController.to.maximumincome * value / 10;
    double value1 = widget.data!.paidAmount! * value / 10;
    // print("### ${value1}");
    // Convert the value into K, M, or B format as needed
    if (value1 >= 1000000000000000) {
      return '${(value1 / 1000000000000000).toStringAsFixed(0)}Q';
    } else if (value1 >= 10000000000000) {
      return '${(value1 / 10000000000000).toStringAsFixed(0)}T';
    } else if (value1 >= 1000000000) {
      //  return '${(value1 / 1000000).toStringAsFixed(0)}M';

      return '${(value1 / 1000000000).toStringAsFixed(0)}B';
    } else if (value1 >= 1000000) {
      return '${(value1 / 1000000).toStringAsFixed(0)}M';
    } else if (value1 >= 1000) {
      return '${(value1 / 1000).toStringAsFixed(0)}K';
    } else if (value1 >= 100) {
      return '${(value1 / 100).toStringAsFixed(0)}H';
    } else {
      return value1.toString();
    }
  }

  Widget leftTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 9
        // fontSize: 14,
        );

    String text;
    switch (value.toInt()) {
      case 2:
        text = convertToKBchart(2);
        break;
      // case 6:
      //   text = '30K';
      //   break;
      case 6:
        text = convertToKBchart(6);
        break;
      case 10:
        text = convertToKBchart(10);
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  List<Color> gradientColors = [
    Colors.red,
    Colors.green,
    Colors.amber,
  ];
  bool showAvg = false;
  @override
  void initState() {
    Get.put(ViewDesbitController());
    //  ViewDesbitController.to.fetchDebtsCredits(widget.debt!.id);
    //widget.debt!.id;
    // TODO: implement in
    // itState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              AppBarWidgt(text: "Debit/Credit"),
              SizedBox(
                height: height * 0.01,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                      width: width,
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/dollar.jpg"))),
                          ),
                          Container(
                            height: height * 0.1,
                            width: width,
                            color: blue.withOpacity(0.9),
                            // child: Center(
                            //  child: Text(
                            //     "${AppLocalizations.of(context)!.credit}: YOU -> to",
                            //     style: GoogleFonts.poppins(
                            //         fontSize: width * 0.03,
                            //         color: white,
                            //         fontWeight: FontWeight.w500),
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: blue,
                        child: SizedBox(
                          height: height * 0.7,
                          width: width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Center(
                                  child: Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: height * 0.4,
                                      width: width * 0.9,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            widget.data!.person!.toUpperCase(),
                                            style: GoogleFonts.poppins(
                                                fontSize: width * 0.035,
                                                color: blue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: width * 0.15,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${AppLocalizations.of(context)!.value}: ",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${widget.data!.amount}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: width * 0.15,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${AppLocalizations.of(context)!.paid}: ",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${widget.data!.paidAmount}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: width * 0.15,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${AppLocalizations.of(context)!.residualamount}: ",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${widget.remaing}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${widget.percentage.toStringAsFixed(1)}%",
                                            style: GoogleFonts.poppins(
                                                fontSize: width * 0.03,
                                                color: blue,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          LinearPercentIndicator(
                                            lineHeight: 6.0,
                                            percent: widget.slider!.toDouble(),
                                            backgroundColor: Colors.black26,
                                            progressColor:
                                                widget.data!.type == 0
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceEvenly,
                                          //   children: [
                                          //     Text(
                                          //       "${AppLocalizations.of(context)!.accounts}: ",
                                          //       style: TextStyle(
                                          //           fontSize: width * 0.025,
                                          //           color: darkblue,
                                          //           fontWeight:
                                          //               FontWeight.bold),
                                          //     ),
                                          //     Text(
                                          //       AppLocalizations.of(context)!
                                          //           .wallet,
                                          //       style: GoogleFonts.poppins(
                                          //           fontSize: width * 0.03,
                                          //           color: blue,
                                          //           fontWeight:
                                          //               FontWeight.w500),
                                          //     ),
                                          //   ],
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Information",
                                                style: GoogleFonts.poppins(
                                                    fontSize: width * 0.03,
                                                    color: blue,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: width * 0.08,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "${AppLocalizations.of(context)!.creationdate}: ",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.08,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${widget.data!.date}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.025,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: width * 0.08,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "${AppLocalizations.of(context)!.paybackdate}: ",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.08,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${widget.data!.payBackDate}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.025,
                                                        color: blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 2,
                                  shadowColor: darkblue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                      height: height * 0.24,
                                      width: width * 0.86,
                                      child: Stack(
                                        children: <Widget>[
                                          GetBuilder<ViewDesbitController>(
                                              initState: (state) {
                                            ViewDesbitController.to
                                                .fetchDebtsCreditstransaction(
                                                    widget.data!.transactions!);
                                          }, builder: (obj) {
                                            return SizedBox(
                                              height: height * 0.22,
                                              width: width * 0.86,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 18,
                                                  left: 12,
                                                  top: 24,
                                                  bottom: 7,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           TransactionsScreen(
                                                    //               snabbWallet: widget
                                                    //                   .snabbWallet),
                                                    //     ));
                                                  },
                                                  child: LineChart(
                                                      // showAvg
                                                      // ? LineChartData()
                                                      // :
                                                      // LineChartData(

                                                      LineChartData(
                                                    lineTouchData:
                                                        const LineTouchData(
                                                            enabled: false),
                                                    gridData: FlGridData(
                                                      show: true,
                                                      drawHorizontalLine: true,
                                                      verticalInterval: 1,
                                                      horizontalInterval: 1,
                                                      getDrawingVerticalLine:
                                                          (value) {
                                                        return const FlLine(
                                                          color:
                                                              Color(0xff37434d),
                                                          strokeWidth: 0.5,
                                                        );
                                                      },
                                                      getDrawingHorizontalLine:
                                                          (value) {
                                                        return const FlLine(
                                                          color:
                                                              Color(0xff37434d),
                                                          strokeWidth: 0.05,
                                                        );
                                                      },
                                                    ),
                                                    titlesData: FlTitlesData(
                                                      show: true,
                                                      bottomTitles: AxisTitles(
                                                        sideTitles: SideTitles(
                                                          showTitles: true,
                                                          reservedSize: 30,
                                                          getTitlesWidget:
                                                              bottomTitles,
                                                          interval: 1,
                                                        ),
                                                      ),
                                                      leftTitles: AxisTitles(
                                                        sideTitles: SideTitles(
                                                          showTitles: true,
                                                          getTitlesWidget:
                                                              leftTitlesWidget,
                                                          reservedSize: 45,
                                                          interval: 1,
                                                        ),
                                                      ),
                                                      topTitles:
                                                          const AxisTitles(
                                                        sideTitles: SideTitles(
                                                            showTitles: false),
                                                      ),
                                                      rightTitles:
                                                          const AxisTitles(
                                                        sideTitles: SideTitles(
                                                            showTitles: false),
                                                      ),
                                                    ),
                                                    borderData: FlBorderData(
                                                      show: true,
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff37434d)),
                                                    ),
                                                    minX: 0,
                                                    maxX: 12,
                                                    minY: -0.58,
                                                    maxY: 14,
                                                    lineBarsData: [
                                                      LineChartBarData(
                                                        spots: obj.list,
                                                        isCurved: true,
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            gradientColors[0],
                                                            gradientColors[1],
                                                          ],
                                                        ),
                                                        barWidth: 2,
                                                        isStrokeJoinRound:
                                                            false,
                                                        preventCurveOverShooting:
                                                            false,
                                                        isStrokeCapRound: false,
                                                        dotData:
                                                            const FlDotData(
                                                          show: false,
                                                        ),
                                                        belowBarData:
                                                            BarAreaData(
                                                          show: true,
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              ColorTween(
                                                                      begin:
                                                                          gradientColors[
                                                                              0],
                                                                      end: gradientColors[
                                                                          1])
                                                                  .lerp(0.2)!
                                                                  .withOpacity(
                                                                      0.1),
                                                              ColorTween(
                                                                      begin:
                                                                          gradientColors[
                                                                              0],
                                                                      end: gradientColors[
                                                                          1])
                                                                  .lerp(0.2)!
                                                                  .withOpacity(
                                                                      0.1),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                              ),
                                            );
                                          }),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: SizedBox(
                                              width: 60,
                                              height: 34,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    showAvg = !showAvg;
                                                  });
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .avg,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: showAvg
                                                        ? Colors.white
                                                            .withOpacity(0.5)
                                                        : Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
