import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/summary_model.dart';
import 'package:snabb_business/screen/summary/summary_detail.dart';
import 'package:snabb_business/screen/transactions/transactionScreen.dart';
import 'package:snabb_business/static_data.dart';
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
  DateTime now = DateTime.now();
  SummaryModel? model;

  Future<SummaryModel> getSummery(String date) async {
    var res = await httpClient().get("${StaticValues.getSummary}$date");
    model = SummaryModel.fromMap(res.data as Map<String, dynamic>);

    print("date ${res.data}");
    return model!;
    // Adjust the delay as needed.
  }

  Future<void> showImageDialog(
    double sale,
    double purchase,
    double expense,
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shadowColor: darkblue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransactionScreen(),
                              ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: darkblue,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.trancactions,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryDetailsPage(
                                  ammount: sale,
                                  type: "Sale",
                                  curency: HomeController.to.curency,
                                ),
                              ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: darkblue,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              "Sale",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryDetailsPage(
                                  ammount: purchase,
                                  type: "Purchase",
                                  curency: HomeController.to.curency,
                                ),
                              ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: darkblue,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              "Purchase",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SummaryDetailsPage(
                                  ammount: expense,
                                  type: "Expense",
                                  curency: HomeController.to.curency,
                                ),
                              ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: darkblue,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height - 150,
        child: FutureBuilder<SummaryModel>(
            future: getSummery("${now.day}-${now.month}-${now.year}"),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        num balance = snapshot
                                .data!.data![index].transactions!.sale! -
                            snapshot
                                .data!.data![index].transactions!.purchase! -
                            snapshot.data!.data![index].transactions!.expense!;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              showImageDialog(
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
                                          model!.data![index].month.toString(),
                                          // "${widget.months[selectedMonth.month - 1]} ${selectedMonth.year}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                              Color.fromRGBO(74, 199, 221, 1),
                                              Color.fromRGBO(255, 59, 59, 1),
                                            ],
                                            legendOptions: const LegendOptions(
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
                                        Text(
                                          "Sale",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "Purchase",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "Expense",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.total,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          " ${HomeController.to.curency}${snapshot.data!.data![index].transactions!.sale!}",
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "-${HomeController.to.curency}${model!.data![index].transactions!.purchase!}",
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "-${HomeController.to.curency}${model!.data![index].transactions!.purchase!}",
                                          style: TextStyle(
                                              color: Colors.blue.shade300,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          balance > 0
                                              ? "+${HomeController.to.curency}$balance"
                                              : "${HomeController.to.curency}$balance",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: balance > 0
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                      ],
                                    )
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
            }));
  }
}
