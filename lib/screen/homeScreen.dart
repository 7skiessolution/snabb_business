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
import 'package:snabb_business/screen/sale/try_chart.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/models/dataclassgraphModel.dart';
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
    // HomeController.to.saleListOFChart();
    HomeController.to.expenseList(0);
    HomeController.to.expenseList(2);
    HomeController.to.expenseList(1);
    HomeController.to.getlistExpense(2);
    HomeController.to.getlistPurchase(0);
    HomeController.to.getlistofSale(1);
    // HomeController.to.monthexpenseList(1);

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double fontSizeInPixels = 10.0;
    double fontSizeInDP =
        fontSizeInPixels / MediaQuery.of(context).devicePixelRatio;
    return GetBuilder<HomeController>(builder: (obj) {
      return Scaffold(
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
                color: Colors.white.withOpacity(0.7),
              ),
              SizedBox(
                height: height,
                width: width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: [
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: height * 0.13,
                          width: width,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10)),
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
                                          "Sales":
                                              double.parse("${obj.totalSale}"),
                                          "Purchase": double.parse(
                                              "${obj.totalPurchase}"),
                                          "Expense": double.parse(
                                              "${obj.totalExpanse}"),
                                        },
                                        colorList: [
                                          lightgreen,
                                          blue,
                                          expensecolor,
                                        ],
                                        legendOptions: const LegendOptions(
                                          showLegends: false,
                                        ),
                                        chartValuesOptions:
                                            const ChartValuesOptions(
                                          showChartValues: false,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      newdate,
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: width * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: height * 0.15,
                                  width: width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Business Summary",
                                        style: GoogleFonts.poppins(
                                            color: darkblue,
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.w600),
                                        // style: TextStyle(
                                        //     fontSize: width * 0.035,
                                        //     color: darkblue,
                                        //     fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: height,
                                          width: width,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: height,
                                                width: width * 0.2,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Sales",
                                                  style: GoogleFonts.poppins(
                                                      color: darkblue,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  // style: TextStyle(
                                                  //     fontSize: width * 0.03,
                                                  //     color: darkblue),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: height,
                                                  width: width,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "${obj.totalSale.toString()} ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    greencolor,
                                                                fontSize:
                                                                    width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      Text(
                                                        obj.curency,
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.025,
                                                            color: greencolor),
                                                      ),
                                                    ],
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
                                              Container(
                                                height: height,
                                                width: width * 0.2,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Purchase",
                                                  style: GoogleFonts.poppins(
                                                      color: darkblue,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  // style: TextStyle(
                                                  //     fontSize: width * 0.03,
                                                  //     color: darkblue),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: height,
                                                  width: width,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "${obj.totalPurchase.toString()} ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: darkblue,
                                                                fontSize:
                                                                    width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      Text(
                                                        obj.curency,
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.025,
                                                            color: darkblue),
                                                      ),
                                                    ],
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
                                              Container(
                                                height: height,
                                                width: width * 0.2,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Expenses",
                                                  style: GoogleFonts.poppins(
                                                      color: darkblue,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  // style: TextStyle(
                                                  //     fontSize: width * 0.03,
                                                  //     color: darkblue),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: height,
                                                  width: width,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "${obj.totalExpanse.toString()} ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    expensecolor,
                                                                fontSize:
                                                                    width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      Text(
                                                        obj.curency,
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.025,
                                                            color:
                                                                expensecolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.06,
                        width: width,
                        // color: Colors.amber,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Graph".toUpperCase(),
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: width * 0.2,
                              ),
                              DropdownButton(
                                value: obj.dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: obj.items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: GoogleFonts.poppins(
                                          // color:Colors.blue[900],
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  obj.dropdownvalue = newValue!;
                                  obj.update();
                                  obj.getinggraph(newValue);
                                },
                              ),
                              InkWell(
                                onTap: () => obj.selectDate(context),
                                child: Text(
                                  obj.formatTime.substring(0, 10),
                                  style: GoogleFonts.poppins(
                                      // color:Colors.blue[900],
                                      fontSize: width * 0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ]),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SalesChart(home: false),
                              ));
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: height * 0.18,
                            width: width,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Sales".toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        color: greencolor,
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: width,
                                      child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        primaryYAxis: NumericAxis(
                                          minimum: 0,
                                          numberFormat: NumberFormat.compact(),
                                          // interval: 100,
                                          // desiredIntervals:
                                          //     100,
                                        ),
                                        backgroundColor: Colors.white,
                                        selectionGesture:
                                            ActivationMode.doubleTap,
                                        enableMultiSelection: true,
                                        enableAxisAnimation: true,
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
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PurchaseChart(home: false),
                              ));
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: height * 0.18,
                            width: width,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Purchase".toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                        width: width,
                                        child: SfCartesianChart(
                                            primaryXAxis: CategoryAxis(),
                                            primaryYAxis: NumericAxis(
                                              minimum: 0,
                                              numberFormat:
                                                  NumberFormat.compact(),
                                              // interval: 1000,
                                              // desiredIntervals:
                                              //     7, // Set this to the number of desired ticks (7 in this case)
                                            ),
                                            tooltipBehavior: obj.tooltip,
                                            series: <ChartSeries<Chartdata,
                                                String>>[
                                              ColumnSeries<Chartdata, String>(
                                                dataSource: obj.purchasedata,
                                                xValueMapper:
                                                    (Chartdata data, _) =>
                                                        data.x,
                                                yValueMapper:
                                                    (Chartdata data, _) =>
                                                        data.y,
                                                name: 'Purchase',
                                                color: blue,
                                              ),
                                            ])),
                                  ),
                                ],
                              ),
                            ),
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
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: height * 0.23,
                            width: width,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Expenses".toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        color: expensecolor,
                                        fontSize: width * 0.035,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                        width: width,
                                        child: SfCartesianChart(
                                            primaryXAxis: CategoryAxis(),
                                            primaryYAxis: NumericAxis(
                                              minimum: 0,
                                              numberFormat:
                                                  NumberFormat.compact(),
                                              // interval: 1000,
                                              // desiredIntervals:
                                              //     7, // Set this to the number of desired ticks (7 in this case)
                                            ),
                                            tooltipBehavior: obj.tooltip,
                                            series: <ChartSeries<Chartdata,
                                                String>>[
                                              BarSeries<Chartdata, String>(
                                                  dataSource: obj.expensedata,
                                                  xValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (Chartdata data, _) =>
                                                          data.y,
                                                  name: 'Expesense',
                                                  color: expensecolor)
                                            ])),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
