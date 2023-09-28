// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/screen/transactions/daily_transactions.dart';
import 'package:snabb_business/screen/transactions/monthly_transactions.dart';
import 'package:snabb_business/screen/transactions/yearly_transactions.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';

class TransactionScreen extends StatefulWidget {
  static const routeName = "transactions-screen";

  const TransactionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int index = 0;
  List<String> cat = [
    "Dalily",
    "Monthly",
    "Yearly",
  ];
  int _currentSelection = 0;
  int check = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    const List<String> month = [
      "Jan",
      "Feb",
      "March",
      "April",
      "May",
      "June",
      "July",
      "Aug",
      "Sept",
      "Oct",
      "Nov",
      "Dec"
    ];

    List<Widget> pagechildren = [
      const DailyTransactions(),
      const MonthlyTransactions(),
      const YearlyTransactions(),
    ];

    final Map<int, Widget> _children = {
      0: Text(
        AppLocalizations.of(context)!.daily,
        style: GoogleFonts.montserrat(),
      ),
      1: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppLocalizations.of(context)!.monthly,
            style: GoogleFonts.montserrat(),
          )),
      2: Text(
        AppLocalizations.of(context)!.yearly,
        style: GoogleFonts.montserrat(),
      ),
    };

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
            width: width,
            color: Colors.white,
            height: height,
            child: Column(children: [
              AppBarWidgt(text: "Transactions"),
              SizedBox(
                height: height * 0.85,
                width: width,
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.15,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/dollar.jpg"))),
                    ),
                    Container(
                      width: width,
                      height: height * 0.15,
                      color: Colors.blue[900]!.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (index > 0) {
                                      setState(() {
                                        index--;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: white,
                                  )),
                              Text(
                                cat[index].toString(),
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (index < 2) {
                                      setState(() {
                                        index++;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: white,
                                  )),
                            ]),
                      ),
                    ),
                    Positioned(
                        top: height * 0.1,
                        right: width * 0.015,
                        left: width * 0.015,
                        child: Container(
                          height: height * 0.7,
                          width: width,
                          color: Colors.white,
                          child: pagechildren[index],
                        ))
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
