// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:snabb_business/controller/debit-credit/add_debit_controller.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:snabb_business/screen/debit/addDebit.dart';
import 'package:snabb_business/screen/debit/edit_debit_credit.dart';
import 'package:snabb_business/screen/debit/view_debitcredit.dart';
import 'package:snabb_business/screen/homeScreen.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/debitbutton.dart';
import '../../utils/appbarwidget.dart';
import '../../utils/spinkit.dart';

class DebitScreen extends StatefulWidget {
  DebitScreen({super.key});
  @override
  State<DebitScreen> createState() => _DebitScreenState();
}

class _DebitScreenState extends State<DebitScreen> {
  double balance = 0;

  String calculateTotal(List<DebitCreditData> debts) {
    double total = 0;
    for (var debt in debts) {
      if (debt.type == 0) {
        total += debt.amount!;
      } else if (debt.type == 1) {
        total -= debt.amount!;
      }
    }
    return total.toString();
  }

  @override
  void initState() {
    super.initState();
    Get.put(AddDebitController());
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: AppBarWidgt(text: "Dr/Cr")),
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: SizedBox(
                  height: height * 0.12,
                  width: width,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.12,
                        width: width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/dollar.jpg"))),
                      ),
                      Container(
                        height: height * 0.12,
                        width: width,
                        color: Colors.blue[900]!.withOpacity(0.9),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.1,
                              top: height * 0.03,
                              right: width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.residualamount,
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$balance ${HomeController.to.curency}",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.17),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: GetBuilder<AddDebitController>(initState: (state) {
                    AddDebitController.to.getdebitcredit();
                  }, builder: (obj) {
                    return Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: SizedBox(
                            height: height * 0.75,
                            width: width * 0.9,
                            child: obj.debitcreditList.isEmpty
                                ? Center(
                                    child: Text(
                                    AppLocalizations.of(context)!.nodatafound,
                                  ))
                                : ListView.builder(
                                    itemCount: obj.debitcreditList.length,
                                    itemBuilder: (context, index) {
                                      DebitCreditData data =
                                          obj.debitcreditList[index];
                                      return deptCard(data, context);
                                    },
                                  )));
                  }),
                ),
              ),
              Positioned(
                bottom: height * 0.005,
                right: width * 0.02,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Transform.scale(
                        scale: 0.8, child: const DebitfloatingButton())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DebitCreditData> datavalue = [];
  double remaingamount = 0;
  deptCard(
    DebitCreditData data,
    BuildContext context,
  ) {
    datavalue.add(data);
    calculateTotal(datavalue);
    remaingamount = double.parse(data.amount.toString()) -
        double.parse(data.paidAmount.toString());

    double percentage = 0;
    double slider = 0;
    percentage = double.parse(data.paidAmount.toString()) *
        100 /
        double.parse(data.amount.toString());
    slider = double.parse(data.paidAmount.toString()) /
        double.parse(data.amount.toString());

    return Column(
      children: [
        Stack(children: [
          InkWell(
            child: Card(
              elevation: 2,
              shadowColor: darkblue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: data.type == 0
                      ? Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/paid.png"),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.type == 1
                                              ? AppLocalizations.of(context)!
                                                  .debit
                                              : AppLocalizations.of(context)!
                                                  .credit,
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              color: darkblue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .you,
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    color: darkblue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                Icons.arrow_right_alt_sharp,
                                                size: 35,
                                                color: data.type == 0
                                                    ? Colors.green
                                                    : Colors.black,
                                              ),
                                              Text(
                                                data.person.toString(),
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    color: darkblue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.date!.toString().substring(0, 10),
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${percentage.toStringAsFixed(1)} %",
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data.payBackDate!,
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              LinearPercentIndicator(
                                lineHeight: 6.0,
                                percent: slider.toDouble(),
                                backgroundColor: Colors.black26,
                                progressColor:
                                    data.type == 0 ? Colors.green : Colors.red,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$remaingamount',
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${data.paidAmount} ${HomeController.to.curency}',
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' ${data.amount}',
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              if (data.type == 1)
                                Row(
                                  children: [
                                    Image.asset("assets/images/notpaid.png"),
                                    Column(
                                      children: [
                                        Text(
                                          data.type == 1
                                              ? AppLocalizations.of(context)!
                                                  .debit
                                              : AppLocalizations.of(context)!
                                                  .creationdate,
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              color: darkblue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .residualamount,
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '  ${data.paidAmount} ${HomeController.to.curency}',
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  remaingamount != 0
                                      ? InkWell(
                                          onTap: () {
                                            print(" id${data.id}");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => AddDebit(
                                                    deta: data,
                                                    id: data.id,
                                                    type: data.type,
                                                    remaing: data.amount! -
                                                        data.paidAmount!,
                                                  ),
                                                ));
                                          },
                                          child: Icon(Icons.add,
                                              color: Colors.black))
                                      : Text(
                                          AppLocalizations.of(context)!.paid),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ViewDebitScreen(
                                                // wallet: TransactionController
                                                //     .to.currency,
                                                id: data.id,
                                                data: data,
                                                remaing: data.amount! -
                                                    data.paidAmount!,
                                                percentage: percentage,
                                                slider: slider,
                                              ),
                                            ));
                                      },
                                      child: Icon(Icons.visibility,
                                          color: Colors.black)),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  EditDebitCreditScreen(
                                                data: data,
                                                remaing: data.amount! -
                                                    data.paidAmount!,
                                              ),
                                            ));
                                      },
                                      child: Icon(Icons.edit,
                                          color: Colors.black)),
                                ],
                              ),
                            ],
                          ),
                        )
                      //debit
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/notpaid.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.type == 1
                                                ? AppLocalizations.of(context)!
                                                    .debit
                                                : AppLocalizations.of(context)!
                                                    .credit,
                                            style: TextStyle(
                                                fontSize: width * 0.035,
                                                color: darkblue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data.person.toString(),
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    color: darkblue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                Icons.arrow_right_alt_sharp,
                                                size: 35,
                                                color: data.type == 0
                                                    ? Colors.green
                                                    : Colors.black,
                                              ),
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .you,
                                                style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    color: darkblue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.date!.toString().substring(0, 10),
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    //"${percentage} %",
                                    "${percentage.toStringAsFixed(1)} %",
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data.payBackDate!,
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              LinearPercentIndicator(
                                lineHeight: 6.0,
                                percent: slider.toDouble(),
                                backgroundColor: Colors.black26,
                                progressColor:
                                    data.type == 0 ? Colors.green : Colors.red,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$remaingamount',
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${data.paidAmount} ${HomeController.to.curency}',
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${data.amount}',
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .residualamount,
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: darkblue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '  ${data.paidAmount}  ${HomeController.to.curency}',
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: data.type == 0
                                            ? Colors.green
                                            : Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  remaingamount != 0
                                      ? InkWell(
                                          onTap: () {
                                            print("id ${data.id}");
                                            print(
                                                "remaing amount ${(data.amount! - data.paidAmount!)}");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => AddDebit(
                                                    deta: data,
                                                    id: data.id,
                                                    type: data.type,
                                                    remaing: data.amount! -
                                                        data.paidAmount!,
                                                  ),
                                                ));
                                          },
                                          child: Icon(Icons.add,
                                              color: Colors.black))
                                      : Text(
                                          AppLocalizations.of(context)!.paid),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ViewDebitScreen(
                                                //  wallet: TransactionController
                                                //   .to.currency,
                                                data: data,
                                                id: data.id,
                                                remaing: data.amount! -
                                                    data.paidAmount!,
                                                percentage: percentage,
                                                slider: slider,
                                              ),
                                            ));
                                      },
                                      child: Icon(Icons.visibility,
                                          color: Colors.black)),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  EditDebitCreditScreen(
                                                data: data,
                                                remaing: data.amount! -
                                                    data.paidAmount!,
                                              ),
                                            ));
                                      },
                                      child: Icon(Icons.edit,
                                          color: Colors.black)),
                                  // InkWell(
                                ],
                              ),
                            ],
                          ),
                        )),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: Text(
                        AppLocalizations.of(context)!.confirmdeletion,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      content: Text(
                        AppLocalizations.of(context)!.areyousuredeletedata,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Close the dialog when Cancel is pressed
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: TextStyle(
                              color: darkblue,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 17, 41,
                                    73)), // Set the custom color here
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();

                            AddDebitController.to.deleteDebitCredit(data.id);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.delete,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          )
        ]),
      ],
    );
  }

  ListTile drawerTile(String imgUrl, String title) {
    return ListTile(
        leading: ImageIcon(
          AssetImage(imgUrl),
          color: Colors.white,
          size: 38,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ));
  }
}
