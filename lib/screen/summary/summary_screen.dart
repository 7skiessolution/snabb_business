import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:snabb_business/screen/summary/category_widget.dart';
import 'package:snabb_business/screen/summary/summary_widget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
          backgroundColor: Colors.white,
          key: scaffoldKey,
          body: SizedBox(
            width: double.infinity,
            child: Column(
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
                          AppLocalizations.of(context)!.summary,
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: width * 0.23,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MaterialSegmentedControl(
                  verticalOffset: 12,
                  selectionIndex: _currentSelection,
                  borderColor: darkblue,
                  selectedColor: darkblue,
                  unselectedColor: Colors.white,
                  selectedTextStyle: TextStyle(
                    // ignore: unrelated_type_equality_checks
                    color: Colors.white,
                  ),
                  unselectedTextStyle: TextStyle(
                    color: darkblue,
                  ),
                  borderWidth: 0.7,
                  borderRadius: 32.0,
                  disabledChildren: const [3],
                  onSegmentTapped: (index) {
                    setState(() {
                      _currentSelection = index;
                    });
                  },
                  children: children0,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: children[_currentSelection])
              ],
            ),
          )),
    );
  }
}
