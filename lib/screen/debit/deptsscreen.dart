// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/debit-credit/add_debit_controller.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:snabb_business/screen/debit/addDebit.dart';
import 'package:snabb_business/screen/debit/edit_debit_credit.dart';
import 'package:snabb_business/screen/debit/view_debitcredit.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/debitbutton.dart';
import '../../utils/appbarwidget.dart';

class DebitScreen extends StatefulWidget {
  const DebitScreen({super.key});
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
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: AppBarWidgt(text: "Debit/Credit")),
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
                        color: blue.withOpacity(0.9),
                        // child: Padding(
                        //   padding: EdgeInsets.only(
                        //       left: width * 0.1,
                        //       top: height * 0.03,
                        //       right: width * 0.1),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Residual Amount",
                        //         style: GoogleFonts.poppins(
                        //             color: Colors.white,
                        //             fontSize: width * 0.035,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //       Text(
                        //         "$balance ${HomeController.to.curency}",
                        //         style: GoogleFonts.poppins(
                        //             color: Colors.white,
                        //             fontSize: width * 0.035,
                        //             fontWeight: FontWeight.w600),
                        //       )
                        //     ],
                        //   ),
                        // ),
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
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage:
                                          AssetImage("assets/images/paid.png"),
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    //Image.asset("assets/images/paid.png"),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(
                                        //   width: width * 0.054,
                                        // ),
                                        Text(
                                          data.type == 1
                                              ? AppLocalizations.of(context)!
                                                  .debit
                                                  .toUpperCase()
                                              : AppLocalizations.of(context)!
                                                  .credit
                                                  .toUpperCase(),
                                          style: GoogleFonts.poppins(
                                              color: darkblue,
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .you,
                                                style: GoogleFonts.poppins(
                                                    color: darkblue,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Icon(
                                                Icons.arrow_right_alt_sharp,
                                                size: 35,
                                                color: data.type == 0
                                                    ? greencolor
                                                    : Colors.black,
                                              ),
                                              Text(
                                                data.person.toString(),
                                                style: GoogleFonts.poppins(
                                                    color: darkblue,
                                                    fontSize: width * 0.035,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                    style: GoogleFonts.poppins(
                                        color: greencolor,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "${percentage.toStringAsFixed(1)} %",
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    data.payBackDate!,
                                    style: GoogleFonts.poppins(
                                        color: redcolor,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
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
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${data.paidAmount} ${HomeController.to.curency}',
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    ' ${data.amount}',
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              if (data.type == 1)
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                          "assets/images/notpaid.png"),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          data.type == 1
                                              ? AppLocalizations.of(context)!
                                                  .debit
                                              : AppLocalizations.of(context)!
                                                  .creationdate,
                                          style: GoogleFonts.poppins(
                                              color: darkblue,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w500),
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
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '  ${data.paidAmount} ${HomeController.to.curency}',
                                    style: GoogleFonts.poppins(
                                        color: greencolor,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
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
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                          "assets/images/notpaid.png"),
                                    ),
                                    // Image.asset("assets/images/notpaid.png"),
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
                                                    .toUpperCase()
                                                : AppLocalizations.of(context)!
                                                    .credit
                                                    .toUpperCase(),
                                            style: GoogleFonts.poppins(
                                                color: darkblue,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data.person.toString(),
                                                style: GoogleFonts.poppins(
                                                    color: darkblue,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                style: GoogleFonts.poppins(
                                                    color: darkblue,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                    style: GoogleFonts.poppins(
                                        color: greencolor,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    //"${percentage} %",
                                    "${percentage.toStringAsFixed(1)} %",
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    data.payBackDate!,
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
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
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${data.paidAmount} ${HomeController.to.curency}',
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${data.amount}',
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
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
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '  ${data.paidAmount}  ${HomeController.to.curency}',
                                    style: GoogleFonts.poppins(
                                        color: data.type == 0
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500),
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
