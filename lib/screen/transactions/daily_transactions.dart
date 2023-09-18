import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/models/daily_transaction_model.dart' as dTra;

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/pinch_zoom_image.dart';

class DailyTransactions extends StatefulWidget {
  const DailyTransactions({super.key});

  @override
  State<DailyTransactions> createState() => _DailyTransactionsState();
}

class _DailyTransactionsState extends State<DailyTransactions> {
  double? height, width;
  int check = 0;
  num balance = 0.0;
  Future<void> showImageDialog(BuildContext context, dTra.Transactions obj,
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
                                      AppLocalizations.of(context)!
                                          .name
                                          .capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.name!}",
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
                                      AppLocalizations.of(context)!
                                          .amount
                                          .capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.amount.toString()}",
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
                                      AppLocalizations.of(context)!
                                          .cname
                                          .capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.category!}",
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
                                      AppLocalizations.of(context)!
                                          .date
                                          .capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.dateTime.toString().substring(0, 10)}",
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
                              height: MediaQuery.of(context).size.height * 0.05,
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
                                                  Container(
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
                                : Text(AppLocalizations.of(context)!
                                    .nofileforthistransaction),
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

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<TransactionController>(initState: (state) {
      TransactionController.to.getUserDailyTransactiondata();
    }, builder: (obj) {
      return obj.dailyTransactionList.isNotEmpty
          ? SizedBox(
              height: height,
              width: width,
              child: ListView.builder(
                itemCount: obj.dailyTransactionList.length,
                itemBuilder: (context, index) {
                  // var selectedDate = widget.dates[index];
                  List<dTra.Transactions> specificTrans = [];
                  specificTrans =
                      obj.dailyTransactionList[index].transactions!.toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      color: white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child:
                                  // "${widget.month[DateTime.now().month - 1]}, ${DateTime.now().day}, ${DateTime.now().year}" ==
                                  //         widget.dates[index]
                                  //     ? const Text("Today")
                                  //     :
                                  Padding(
                                padding: EdgeInsets.only(right: 12),
                                child:
                                    Text(obj.dailyTransactionList[index].day!),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: specificTrans.length * 80,
                              //specificTrans.length == 1?80: specificTrans.length == 2?160: specificTrans.length == 3?240: specificTrans.length == 3?320 : 400 ,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: specificTrans.length,
                                itemBuilder: (context, i) {
                                  dTra.Transactions transaction =
                                      specificTrans[i];
                                  // return TransactionCard(transaction: transaction);

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Dismissible(
                                        // onDismissed: ,
                                        confirmDismiss: (direction) async {
                                          bool delete =
                                              await TransactionController.to
                                                  .deleteDailyTransactiondata(
                                                      context,
                                                      transaction
                                                          .transactionId!);

                                          return delete;
                                        },
                                        key: UniqueKey(),
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
                                                decoration: BoxDecoration(
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
                                                            transaction.type ==
                                                                    1
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          transaction.type == 1
                                                              ? Colors.green
                                                              : Colors.red,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )
                                        // TransactionCard(transaction: transaction),
                                        ),
                                  );
                                },
                              ),
                            )
                          ]),
                    ),
                  );
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.notransaction,
              )),
            );
    });
  }
}
