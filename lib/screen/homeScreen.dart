import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:snabb_business/controller/expense_controller.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/pdf/c/pdf_controller.dart';
import 'package:snabb_business/screen/chartsScreens/purchaseChart.dart';
import 'package:snabb_business/screen/chartsScreens/salesChart.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/models/dataclassgraphModel.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chartsScreens/expenseChart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = "homeroute";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool expense = false;
  bool sale = false;
  bool purchase = false;
  var newdate = DateFormat.yMMMMd().format(DateTime.now());
  @override
  void initState() {
    Get.put(HomeController());
    Get.put(ExpenseController());
    Get.put(TransactionController());
    Get.put(PdfController());
    HomeController.to.saleListOFChart();
    HomeController.to.expenseList(0);
    HomeController.to.expenseList(2);
    HomeController.to.expenseList(1);
    HomeController.to.getlistExpense(2);
    HomeController.to.getlistPurchase(0);

    // HomeController.to.getexpensePurchase(2);
    // HomeController.to.getexpensePurchase(0);
    // HomeController.to.getexpensePurchase(1);
    // TransactionController.to.getCatagoriesdata("income");
    TransactionController.to.getUserCalanderTransactiondata();
    HomeController.to.getUserProfile();
    HomeController.to.getCompanydata();
    HomeController.to.getSupplierdata();
    ExpenseController.to.getCatageries();
    // pdf
    PdfController.to.fetchcompenysales();
    PdfController.to.fetchdailyslaesReport();
    PdfController.to.fetchexpenseReport();
    PdfController.to.fetchpurchaseReport();

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
                            SizedBox(
                              height: height * 0.1,
                              width: width * 0.2,
                              child: PieChart(
                                dataMap: {
                                  "Sale": double.parse("${obj.totalSale}"),
                                  "Purchase":
                                      double.parse("${obj.totalPurchase}"),
                                  "Expense":
                                      double.parse("${obj.totalExpanse}"),
                                },
                                colorList: [
                                  lightgreen,
                                  AppColors.blue,
                                  expensecolor,
                                ],
                                legendOptions: const LegendOptions(
                                  showLegends: false,
                                ),
                                chartValuesOptions: const ChartValuesOptions(
                                  showChartValues: false,
                                ),
                              ),
                            ),
                            Text(
                              newdate,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: width * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
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
                                              color: AppColors.greencolor),
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
                                              color: expensecolor),
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
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SalesChart(home: false),
                          ));
                    },
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
                                color: AppColors.greencolor),
                          ),
                          SizedBox(
                              height: height * 0.16,
                              width: width,
                              // child: SfCartesianChart(
                              //   primaryXAxis: DateTimeAxis(
                              //     title: AxisTitle(text: 'Year'),
                              //   ),
                              //   primaryYAxis: NumericAxis(
                              //     title: AxisTitle(text: 'Total Sales'),
                              //   ),
                              //   series: <ChartSeries<SalesData, DateTime>>[
                              //     LineSeries<SalesData, DateTime>(
                              //       dataSource: obj.chartData,
                              //       xValueMapper: (SalesData sales, _) =>
                              //           sales.year,
                              //       yValueMapper: (SalesData sales, _) =>
                              //           sales.sales,
                              //       name: 'Total Sales',
                              //     ),
                              //   ],
                              // ),
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
                                    color: AppColors.greencolor,
                                    markerSettings: const MarkerSettings(
                                      isVisible: true,
                                      width: 5,
                                      height: 5,
                                      borderWidth: 0.5,
                                      color: AppColors.greencolor,
                                    ),
                                    enableTooltip: true,
                                    isVisible: true,
                                    dataSource: obj.chartData,
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales,
                                  ),
                                  // LineSeries<SalesData, DateTime>(
                                  //   legendIconType: LegendIconType.rectangle,
                                  //   animationDuration: 5,
                                  //   animationDelay: 3,
                                  //   color: lightgreen,
                                  //   markerSettings: MarkerSettings(
                                  //     isVisible: true,
                                  //     width: 5,
                                  //     height: 5,
                                  //     borderWidth: 0.5,
                                  //     color: lightgreen,
                                  //   ),
                                  //   enableTooltip: true,
                                  //   isVisible: true,
                                  //   dataSource: obj.chart,
                                  //   xValueMapper: (SalesData sales, _) =>
                                  //       sales.year,
                                  //   yValueMapper: (SalesData sales, _) =>
                                  //       sales.sales,
                                  // )
                                ],
                              ))
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
                          builder: (context) => PurchaseChart(home: false),
                        ));
                    // setState(() {
                    //   sale = false;
                    //   purchase = true;
                    //   expense = false;
                    // });
                    // print("value of sale $sale");
                    // print("value of sale $purchase");
                    // print("value of sale $expense");
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
                                    color: const Color.fromRGBO(8, 142, 255, 1),
                                  ),
                                ])),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExpenseChart(),
                          ));
                    },
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
                                    numberFormat: NumberFormat.compact(),
                                    // interval: 1000,
                                    // desiredIntervals:
                                    //     7, // Set this to the number of desired ticks (7 in this case)
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
                                  ]))
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
    });
  }
}
