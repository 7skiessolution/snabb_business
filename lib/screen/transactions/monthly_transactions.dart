import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/models/monthly_transaction_model.dart' as mTra;
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';

class MonthlyTransactions extends StatefulWidget {
  const MonthlyTransactions({Key? key}) : super(key: key);

  @override
  State<MonthlyTransactions> createState() => _MonthlyTransactionsState();
}

class _MonthlyTransactionsState extends State<MonthlyTransactions> {
  final PageController _controller = PageController(initialPage: 0);
  int pageIndex = 0;
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    // // Filter the months that have transactions
    // List<int> monthsWithTransactions = [];
    // for (int i = 0; i < widget.month.length; i++) {
    //   final currentMonth = i + 1;
    //   final filteredTransactions = TransactionController.to.transactions
    //       .where((transaction) => transaction.date.month == currentMonth)
    //       .toList();
    //   if (filteredTransactions.isNotEmpty) {
    //     monthsWithTransactions.add(i);
    //   }
    // }
    Future<void> showImageDialog(BuildContext context, mTra.Transactions obj,
        var height, var width) async {
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
                            AppLocalizations.of(context)!.transactiondetails,
                            style: TextStyle(
                                color: darkblue,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          height: height * 0.06,
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
                                        AppLocalizations.of(context)!.name,
                                        style: TextStyle(
                                            color: darkblue,
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        obj.name!,
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
                                        AppLocalizations.of(context)!.amount,
                                        style: TextStyle(
                                            color: darkblue,
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        obj.amount.toString(),
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
                                        AppLocalizations.of(context)!.cname,
                                        style: TextStyle(
                                            color: darkblue,
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        obj.category!,
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
                                        AppLocalizations.of(context)!.date,
                                        style: TextStyle(
                                            color: darkblue,
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        obj.dateTime.toString().substring(0, 9),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  AppLocalizations.of(context)!.notes,
                                  style: TextStyle(
                                      color: darkblue,
                                      fontSize: width * 0.035,
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
                                  ? FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/bell.png',
                                      image:
                                          "${StaticValues.imageUrl}${obj.file!}",
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        return const CircularProgressIndicator();
                                      },
                                    )
                                  : Text(
                                      AppLocalizations.of(context)!
                                          .notransactions,
                                      style: TextStyle(
                                          fontSize: width * 0.03,
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
                                  image: AssetImage(obj.imageUrl!)),
                              shape: BoxShape.circle),
                        ),
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

    return GetBuilder<TransactionController>(initState: (state) {
      TransactionController.to.getUserMonthTransactiondata();
    }, builder: (obj) {
      return obj.monthTransactionList.isNotEmpty
          ? SizedBox(
              height: height,
              width: width,
              child: ListView.builder(
                itemCount: obj.monthTransactionList.length,
                itemBuilder: (context, index) {
                  // var selectedDate = widget.dates[index];
                  List<mTra.Transactions> specificTrans = [];
                  specificTrans =
                      obj.monthTransactionList[index].transactions!.toList();
                  String? month;
                  try {
                    month = obj.monthTransactionList[index].month;
                  } catch (e) {
                    month = "Month";
                    print("nod data");
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8, bottom: 8),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child:
                                      // "${widget.month[DateTime.now().month - 1]}, ${DateTime.now().day}, ${DateTime.now().year}" ==
                                      //         widget.dates[index]
                                      //     ? const Text("Today")
                                      //     :
                                      Text("$month"),
                                ),
                              ),
                              SizedBox(
                                height: specificTrans.length * 80,
                                //specificTrans.length == 1?80: specificTrans.length == 2?160: specificTrans.length == 3?240: specificTrans.length == 3?320 : 400 ,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: specificTrans.length,
                                  itemBuilder: (context, i) {
                                    mTra.Transactions transaction =
                                        specificTrans[i];
                                    // return TransactionCard(transaction: transaction);

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8,
                                      ),
                                      child: Container(
                                        color: AppColors.backgroundColor,
                                        child: ListTile(
                                          onTap: () {
                                            showImageDialog(
                                                context,
                                                transaction,
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                MediaQuery.of(context)
                                                    .size
                                                    .width);
                                          },
                                          leading: Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  transaction.imageUrl!,
                                                ),
                                              )),
                                          title: Text(
                                            transaction.name!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(transaction.dateTime!
                                              .substring(0, 10)),
                                          trailing: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  // ignore: unrelated_type_equality_checks
                                                  transaction.type == 1
                                                      ? "+ ${transaction.amount}"
                                                      : "-${transaction.amount}",
                                                  style: TextStyle(
                                                      // ignore: unrelated_type_equality_checks
                                                      color:
                                                          transaction.type == 1
                                                              ? Colors.green
                                                              : Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  // ignore: unrelated_type_equality_checks
                                                  transaction.type == 1
                                                      ? transaction.currency!
                                                      : transaction.currency!,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: transaction.type == 1
                                                        ? Colors.green
                                                        : Colors.red,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                  child: Text(AppLocalizations.of(context)!.notransactions)),
            );
    });
    // return SizedBox(
    //   height: size.height,
    //   width: size.width,
    //   child: Stack(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.only(top: size.height * 0.025),
    //         child: Align(
    //           alignment: Alignment.topCenter,
    //           child: SizedBox(
    //             height: size.height * 0.05,
    //             width: size.width * 0.8,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 IconButton(
    //                   onPressed: () {
    //                     _controller.previousPage(
    //                       duration: const Duration(milliseconds: 120),
    //                       curve: Curves.bounceIn,
    //                     );
    //                   },
    //                   icon: const Icon(Icons.arrow_back_ios_new_rounded),
    //                 ),
    //                 IconButton(
    //                   onPressed: () {
    //                     _controller.nextPage(
    //                       duration: const Duration(milliseconds: 120),
    //                       curve: Curves.bounceIn,
    //                     );
    //                   },
    //                   icon: const Icon(Icons.arrow_forward_ios_rounded),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: size.height,
    //         width: size.width,
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               height: size.height * 0.02,
    //             ),
    //             Text(
    //               DateTime.now().year.toString(),
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold,
    //                 color: darkblueDark,
    //               ),
    //             ),
    //             Expanded(
    //               child: SizedBox(
    //                 height: size.height,
    //                 width: size.width,
    //                 child: PageView.builder(
    //                   controller: _controller,
    //                   itemCount: monthsWithTransactions.length,
    //                   onPageChanged: (int index) {
    //                     setState(() {
    //                       pageIndex = index;
    //                     });
    //                   },
    //                   itemBuilder: (context, index) {
    //                     final currentMonthIndex = monthsWithTransactions[index];
    //                     final currentMonth = currentMonthIndex + 1;
    //                     final filteredTransactions = TransactionController
    //                         .to.transactions
    //                         .where((transaction) =>
    //                             transaction.date.month == currentMonth)
    //                         .toList();

    //                     final monthName = widget.month[currentMonthIndex];

    //                     return Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           monthName,
    //                           style: const TextStyle(
    //                             fontSize: 38,
    //                             fontWeight: FontWeight.w500,
    //                           ),
    //                         ),
    //                         // Expanded(
    //                         //   child: SizedBox(
    //                         //     height: size.height,
    //                         //     width: size.width,
    //                         //     child: ListView.builder(
    //                         //       itemCount: filteredTransactions.length,
    //                         //       itemBuilder: (context, index) {
    //                         //         final transaction =
    //                         //             filteredTransactions[index];
    //                         //         return Padding(
    //                         //           padding: EdgeInsets.only(
    //                         //               left: size.width * 0.05,
    //                         //               top: size.height * 0.01,
    //                         //               right: size.width * 0.05),
    //                         //           child: TransactionCard(
    //                         //               transaction: transaction),
    //                         //         );
    //                         //       },
    //                         //     ),
    //                         //   ),
    //                         // ),
    //                       ],
    //                     );
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
