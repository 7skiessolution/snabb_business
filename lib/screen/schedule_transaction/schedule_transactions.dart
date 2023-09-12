import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/schedule_controller.dart';
import 'package:snabb_business/models/scheduled_transaction.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/schedule_ex.dart';

class ShaduleTransactionScreen extends StatefulWidget {
  const ShaduleTransactionScreen({Key? key}) : super(key: key);

  @override
  State<ShaduleTransactionScreen> createState() =>
      _ShaduleTransactionScreenState();
}

class _ShaduleTransactionScreenState extends State<ShaduleTransactionScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoadConfirm = false;
  num balance = 0;
  int check = 0;
  num snabbWallet = 0;
  // final String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();

    Get.put(ScheduleController());
  }

  Future<void> showImageDialog(
      BuildContext context, ScheduleTransactionData obj) async {
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
                          AppLocalizations.of(context)!.transationdetails,
                          style: TextStyle(
                              color: darkblue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "${AppLocalizations.of(context)!.walletname}: ",
                                  style: TextStyle(
                                      color: darkblue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(obj.name.toString()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
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
                                      "${AppLocalizations.of(context)!.repeat}: ",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.schedule!.repeats.toString()),
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
                                      "${AppLocalizations.of(context)!.amount}: ",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.amount.toString()),
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
                                      "${AppLocalizations.of(context)!.cname}: ",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.category!),
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
                                      "${AppLocalizations.of(context)!.date}: ",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.dateTime.toString()),
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
                                "${AppLocalizations.of(context)!.notes}: ",
                                style: TextStyle(
                                    color: darkblue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(obj.note!),
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
                                ? Hero(
                                    tag: obj.file!,
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/bell.png',
                                      image:
                                          '${StaticValues.imageUrl}${obj.file!}',
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:
          ScheduleFB(balance: balance, snabbWallet: snabbWallet),
      body: SafeArea(
        child: GetBuilder<ScheduleController>(initState: (state) {
          ScheduleController.to.fetchTransactions();
        }, builder: (obj) {
          return Column(
            children: [
              Container(
                height: height * 0.13,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: darkblue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: width * 0.065,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.1,
                      ),
                      Text(
                        AppLocalizations.of(context)!.scheduledtransaction,
                        style: TextStyle(
                            fontSize: width * 0.04,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: width * 0.11,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shadowColor: darkblue,
                elevation: 7,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: Container(
                    height: height * 0.15,
                    width: width * 0.9,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.thismonth,
                                style: TextStyle(
                                    fontSize: width * 0.033,
                                    color: darkblue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${obj.thisMonth}",
                                style: TextStyle(
                                  color: obj.thisMonth >= 0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.nextmonth,
                                style: TextStyle(
                                    fontSize: width * 0.033,
                                    color: darkblue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${obj.nextMonth}",
                                style: TextStyle(
                                  color: obj.nextMonth >= 0
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              obj.transactions.isNotEmpty
                  ? Expanded(
                      child: SizedBox(
                        height: height,
                        child: ListView.builder(
                          itemCount: obj.transactions.length,
                          itemBuilder: (context, index) {
                            ScheduleTransactionData transaction =
                                obj.transactions[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shadowColor: darkblue,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  onTap: () {
                                    showImageDialog(context, transaction);
                                  },
                                  leading: Container(
                                      decoration: BoxDecoration(
                                          color: darkblue,
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          transaction.imageUrl!,
                                        ),
                                      )),
                                  title: Text(
                                    transaction.category!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(transaction.name!),
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                          transaction.type == 1
                                              ? "+${HomeController.to.curency}${transaction.amount}"
                                              : "-${HomeController.to.curency}${transaction.amount}",
                                          style: TextStyle(
                                              color: transaction.type == 1
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontWeight: FontWeight.bold)),
                                      Text(transaction.schedule!.secondDateTime
                                          .toString()
                                          .substring(0, 10))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Center(
                          child: Text(
                        AppLocalizations.of(context)!.noschedualedtransaction,
                        style: TextStyle(
                            fontSize: width * 0.04,
                            color: darkblue,
                            fontWeight: FontWeight.w500),
                      )),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
