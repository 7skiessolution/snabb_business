import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:snabb_business/screen/summary/category_widget.dart';
import 'package:snabb_business/screen/summary/summary_widget.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/utils/colors.dart';

class SummeryScreen extends StatefulWidget {
  static const routeName = "summary-screen";
  num? snabbWallet;
  SummeryScreen({super.key, this.snabbWallet});

  @override
  State<SummeryScreen> createState() => _SummeryScreenState();
}

class _SummeryScreenState extends State<SummeryScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int check = 0;
  List<String> months = [
    "January",
    "Feburary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  int _currentSelection = 0;

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final Map<int, Widget> children0 = {
      0: Text(
        AppLocalizations.of(context)!.summary,
        style: GoogleFonts.montserrat(),
      ),
      1: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            AppLocalizations.of(context)!.category,
            style: GoogleFonts.montserrat(),
          )),
    };
    List<Widget> children = [SummaryWidget(), CategoryWidget(months: months)];
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          key: scaffoldKey,
          body: Column(
            children: [
              AppBarWidgt(text: AppLocalizations.of(context)!.summary),
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
                    ),
                    Positioned(
                        top: height * 0.03,
                        right: width * 0.03,
                        left: width * 0.03,
                        child: SizedBox(
                          height: height * 0.8,
                          width: width * 0.7,
                          child: Column(
                            children: [
                              SizedBox(
                                width: width,
                                height: height * 0.08,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: _currentSelection == 0
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Summary',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        // fontWeight: FontWeight.bold,
                                                        fontSize: width * 0.04),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.12,
                                                        right: width * 0.12),
                                                    child: Divider(
                                                      color: white,
                                                      thickness: 3,
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.00),
                                                child: Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      _currentSelection = 0;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Summary',
                                                      style: TextStyle(
                                                          color: white,
                                                          fontSize:
                                                              width * 0.04),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: _currentSelection == 1
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Category',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: width * 0.04),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.1,
                                                        right: width * 0.1),
                                                    child: Divider(
                                                      color: white,
                                                      thickness: 3,
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Padding(
                                                padding: EdgeInsets.only(
                                                    top: height * 0.00),
                                                child: Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      _currentSelection = 1;
                                                      setState(() {});
                                                    },
                                                    child: Text(
                                                      'Category',
                                                      style: TextStyle(
                                                          color: white,
                                                          fontSize:
                                                              width * 0.04),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: children[_currentSelection])
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
