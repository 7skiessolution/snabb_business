import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as pie;
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/utils/color.dart';

class SummaryDetailsPage extends StatefulWidget {
  String type;
  double ammount;
  String curency;
  SummaryDetailsPage(
      {super.key,
      required this.ammount,
      required this.type,
      required this.curency});

  @override
  State<SummaryDetailsPage> createState() => _SummaryDetailsPageState();
}

class _SummaryDetailsPageState extends State<SummaryDetailsPage> {
  var height, width;
  bool isPai = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.13),
              child: Container(
                height: height * 0.3,
                width: width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/dollar.jpg"))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.13),
              child: Container(
                height: height * 0.3,
                width: width,
                color: Colors.blue[900]!.withOpacity(0.9),
              ),
            ),
            widget.type == "Expense"
                ? Padding(
                    padding: EdgeInsets.only(bottom: height * 0.1),
                    child: Center(
                      child: Card(
                        elevation: 2,
                        shadowColor: darkblue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: height * 0.5,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: pie.PieChart(
                            ringStrokeWidth: 120.0,
                            chartRadius: width * 0.5,
                            animationDuration: const Duration(seconds: 1),
                            chartValuesOptions: const pie.ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: true,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                            ),
                            legendOptions:
                                const pie.LegendOptions(showLegends: false),
                            dataMap: {
                              "Expense": widget.ammount,
                            },
                            chartType: pie.ChartType.ring,
                            baseChartColor: Colors.grey[300]!,
                            colorList: const [
                              Color.fromARGB(255, 61, 194, 235)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : widget.type == "Sale"
                    ? Padding(
                        padding: EdgeInsets.only(bottom: height * 0.1),
                        child: Center(
                          child: Card(
                            elevation: 2,
                            shadowColor: darkblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: height * 0.5,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: pie.PieChart(
                                ringStrokeWidth: 120.0,
                                chartRadius: width * 0.5,
                                animationDuration: const Duration(seconds: 1),
                                chartValuesOptions:
                                    const pie.ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: true,
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 1,
                                ),
                                legendOptions:
                                    const pie.LegendOptions(showLegends: false),
                                dataMap: {
                                  "Sale": widget.ammount,
                                },
                                chartType: pie.ChartType.ring,
                                baseChartColor: Colors.grey[300]!,
                                colorList: const [
                                  Color.fromRGBO(72, 245, 57, 1),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(bottom: height * 0.1),
                        child: Center(
                          child: Card(
                            elevation: 2,
                            shadowColor: darkblue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: height * 0.5,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: pie.PieChart(
                                ringStrokeWidth: 120.0,
                                chartRadius: width * 0.5,
                                animationDuration: const Duration(seconds: 1),
                                chartValuesOptions:
                                    const pie.ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: true,
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 1,
                                ),
                                legendOptions:
                                    const pie.LegendOptions(showLegends: false),
                                dataMap: {
                                  "Purchase": widget.ammount,
                                },
                                chartType: pie.ChartType.ring,
                                baseChartColor: Colors.grey[300]!,
                                colorList: const [Colors.red],
                              ),
                            ),
                          ),
                        ),
                      ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 0.1,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: darkblue, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      widget.type == "Expense"
                          ? Expanded(
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.06,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 61, 194, 235),
                                          shape: BoxShape.circle),
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.expense,
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color:
                                              Color.fromARGB(255, 61, 194, 235),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : widget.type == "Sale"
                              ? Expanded(
                                  child: SizedBox(
                                    height: height,
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        Container(
                                          height: height * 0.04,
                                          width: width * 0.06,
                                          decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          widget.type,
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: SizedBox(
                                    height: height,
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        Container(
                                          height: height * 0.04,
                                          width: width * 0.06,
                                          decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        Text(
                                          "Purchase",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                      Expanded(
                        child: SizedBox(
                            height: height,
                            width: width,
                            child: Center(
                              child: Text(
                                "100%",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Expanded(
                        child: SizedBox(
                            height: height,
                            width: width,
                            child: Center(
                              child: Text(
                                "${widget.curency} ${widget.ammount}",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: height * 0.07,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.1),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: darkblue,
                                size: width * 0.07,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.summary,
                              style: TextStyle(
                                  color: darkblue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.1),
                            child: Icon(
                              Icons.pie_chart,
                              color: darkblue,
                              size: width * 0.07,
                            ),
                            //  isPai == true
                            //     ? InkWell(
                            //         onTap: () {
                            //           setState(() {
                            //             isPai = false;
                            //           });
                            //         },
                            //         child: Icon(
                            //           Icons.pie_chart,
                            //           color: darkblue,
                            //           size: width * 0.07,
                            //         ),
                            //       )
                            //     : InkWell(
                            //         onTap: () {
                            //           setState(() {
                            //             isPai = true;
                            //           });
                            //         },
                            //         child: Icon(
                            //           Icons.graphic_eq_rounded,
                            //           color: darkblue,
                            //           size: width * 0.07,
                            //         ),
                            //       ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
