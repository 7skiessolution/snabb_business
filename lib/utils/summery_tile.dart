import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:snabb_business/utils/color.dart';

class SummeryTile extends StatefulWidget {
  const SummeryTile({
    super.key,
  });

  @override
  State<SummeryTile> createState() => _SummeryTileState();
}

class _SummeryTileState extends State<SummeryTile> {
  Map<String, double> dataMap = {
    "Sale": 5,
    "Purchase": 3,
    "Expense": 2,
  };

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      color: tilebackground,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "JULY 2023",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width * 0.03),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width * 0.10,
                  child: PieChart(
                    dataMap: dataMap,

                    //  animationDuration: Duration(milliseconds: 800),
                    // chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width / 6.2,
                    // colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 32,
                    // centerText: "HYBRID",
                    legendOptions: const LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: false,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: false,
                      showChartValues: false,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sales",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                    Text("60,0000 PKR",
                        style: TextStyle(
                            color: Colors.green, fontSize: width * 0.04)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Purchase", style: TextStyle(fontSize: width * 0.04)),
                    Text("60,0000 PKR",
                        style: TextStyle(
                            color: Colors.red, fontSize: width * 0.04)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Expense", style: TextStyle(fontSize: width * 0.04)),
                    Text("60,0000 PKR",
                        style: TextStyle(
                            color: Colors.red, fontSize: width * 0.04)),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04)),
                    Text("60,0000 PKR",
                        style: TextStyle(
                            color: Colors.green, fontSize: width * 0.04)),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
