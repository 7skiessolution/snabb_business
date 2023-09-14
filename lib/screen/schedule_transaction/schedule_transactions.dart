import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/schedule_controller.dart';
import 'package:snabb_business/models/scheduled_transaction.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
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
      backgroundColor: AppColors.backgroundColor,
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
               AppBarWidgt(
                  text: "Shadule Transaction"),
            
              Container(
               
                  height: height * 0.1,
                  width: width * 0.9,
                  decoration:
                      BoxDecoration(
                         color: white,
                        borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.thismonth.capitalize!,
                              style: TextStyle(
                                  fontSize: width * 0.033,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${obj.thisMonth} ${HomeController.to.curency}",
                              style: TextStyle(
                                color: Colors.black
                                // color: obj.thisMonth >= 0
                                //     ? Colors.green
                                //     : Colors.red,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.nextmonth.capitalize!,
                              style: TextStyle(
                                  fontSize: width * 0.033,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${obj.nextMonth} ${HomeController.to.curency}",
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
              SizedBox(
                height: height * 0.01,
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
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                color: white,
                                child: Column(
                                  children: [
                              
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            color: AppColors.backgroundColor,
                                            //height: height,
                                            width: width,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize
                                                              .max,
                                                      children: [
                                                        Text(
                                                            "123",
                                                            style:
                                                                TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize:
                                                                  12,
                                                            )),
                                                        Text(
                                                            '"persentage" %',
                                                            style: const TextStyle(
                                                                fontSize:
                                                                    12,
                                                                fontWeight:
                                                                    FontWeight.w700)),
                                                        Text("date",
                                                            style:
                                                                TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize:
                                                                  12,
                                                            )),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SliderTheme(
                                                      data: const SliderThemeData(
                                                          trackHeight:
                                                              3,
                                                          overlayShape: RoundSliderOverlayShape(
                                                              overlayRadius:
                                                                  0),
                                                          thumbShape:
                                                              RoundSliderThumbShape(
                                                                  enabledThumbRadius: 0)),
                                                      child: Slider(
                                                        inactiveColor:
                                                            Colors
                                                                .grey,
                                                        activeColor:
                                                            darkblue,
                                                        value:
                                                            1,
                                                        onChanged:
                                                            (double
                                                                value) {},
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize
                                                              .max,
                                                      children: [
                                                        Text('0',
                                                            style:
                                                                TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize:
                                                                  12,
                                                            )),
                                                        Text(
                                                            "payable"
                                                                .toString(),
                                                            style:
                                                                TextStyle(
                                                              color:
                                                                  Colors.red,
                                                              fontSize:
                                                                  12,
                                                            )),
                                                        Text(
                                                            "amount"
                                                                .toString(),
                                                            style:
                                                                TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize:
                                                                  12,
                                                            )),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment
                                                                  .centerLeft,
                                                          child: Text(
                                                              '${AppLocalizations.of(context)!.residualamount.capitalize!}: "residual"',
                                                              style:
                                                                  TextStyle(
                                                                color:
                                                                    Colors.black,
                                                                fontSize:
                                                                    12,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                                 
                                                 
                              
                                    Container(
                                      color: white,
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
                                  ],
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
