import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/screen/drawerscreen/ExpenseByCategory.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';

import '../../utils/Button.dart';
import '../ExpensePieChart.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool dateFromPicked = false;
  bool dateToPicked = false;
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();

  String? startdate;
  String enddate = "";
  String date = "";
  DateTime now = DateTime.now();

  bool pichart = false;
  String? dropdownValue = 'Purchase';
  String? dropdownValue1 = 'This Month';
  bool barchar = true;
  Future<void> _selectDate(BuildContext context, bool from) async {
    List<bool> isSelected;

    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue!,
              colorScheme: ColorScheme.light(primary: darkblue!),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (from) {
      if (picked != null && picked != selectedDateFrom) {
        setState(() {
          selectedDateFrom = picked;
          dateFromPicked = true;
          startdate = "${picked.day}-${picked.month}-${picked.year}";
        });
      }
    } else {
      if (picked != null && picked != selectedDateTo) {
        setState(() {
          selectedDateTo = picked;
          dateToPicked = true;
          enddate = "${picked.day}-${picked.month}-${picked.year}";
        });
      }
    }
    print("start  $startdate---------- end $enddate");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedFormatfrom =
        DateFormat('dd/MM/yyyy').format(selectedDateFrom);
    final selectedFormetTo = DateFormat('dd/MM/yyyy').format(selectedDateTo);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> dropdownItems = <String>['Purchase', 'sale', "Expense"];

    List<String> dropdownItems1 = <String>[
      'This Month',
      'This Year',
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: AppBarWidgt(text: "Chart")),
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
                            left: width * 0.05, right: width * 0.05),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Categories",
                                style: TextStyle(color: white, fontSize: 17),
                              ),
                              Icon(
                                Icons.stacked_bar_chart,
                                color: white,
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.18),
              child: Align(
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.blue[900],
                  child: SizedBox(
                    height: height * 0.55,
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Show all categories of:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.35,
                            color: Colors.grey.shade300,
                            child: Center(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: const DropdownButtonHideUnderline(
                                    child: SizedBox()),
                                // itemHeight: 2,
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 16,
                                elevation: 8,
                                style:
                                    TextStyle(color: textcolor, fontSize: 16),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: dropdownItems
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Form:"),
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5)),
                                  child: TextButton(
                                      onPressed: () {
                                        _selectDate(context, true);
                                      },
                                      child: Text(
                                        !dateFromPicked
                                            ? "Selected date"
                                            : selectedFormatfrom,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: width * 0.03),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("To:"),
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5)),
                                  child: TextButton(
                                      onPressed: () {
                                        _selectDate(context, false);
                                      },
                                      child: Text(
                                        !dateToPicked
                                            ? "Selected date"
                                            : selectedFormetTo,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: width * 0.03,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.02, right: width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Period:"),
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.3,
                                  color: Colors.grey.shade300,
                                  child: Center(
                                    child: DropdownButton<String>(
                                        underline:
                                            const DropdownButtonHideUnderline(
                                                child: SizedBox()),
                                        // itemHeight: 2,

                                        icon: const Icon(Icons.arrow_drop_down),
                                        iconSize: 16,
                                        elevation: 8,
                                        style: TextStyle(
                                            color: textcolor, fontSize: 16),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue1 = newValue;
                                          });
                                          print("value  $dropdownValue1");
                                        },
                                        value: dropdownValue1,
                                        items:
                                            dropdownItems1.map((String value) {
                                          print("ww $value");
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Chart type:"),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 0.5,
                                          child: Switch(
                                            activeColor: darkblue!,
                                            splashRadius: 60,
                                            activeTrackColor: darkblue!,
                                            inactiveTrackColor:
                                                darkblue!.withOpacity(0.3),
                                            inactiveThumbColor: darkblue!,
                                            focusColor: backgroundColor,
                                            autofocus: false,
                                            hoverColor: lightgray,
                                            value: pichart,
                                            onChanged: (value) {
                                              setState(() {
                                                pichart = value;
                                                barchar = !value;
                                              });
                                            },
                                          ),
                                        ),
                                        const Text("Pie Chart")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Transform.scale(
                                          scale: 0.5,
                                          child: Switch(
                                            activeColor: darkblue!,
                                            splashRadius: 60,
                                            inactiveThumbColor: darkblue!,
                                            activeTrackColor: darkblue!,
                                            inactiveTrackColor:
                                                darkblue!.withOpacity(0.3),
                                            focusColor: backgroundColor,
                                            autofocus: false,
                                            hoverColor: lightgray,
                                            value: barchar,
                                            onChanged: (value) {
                                              setState(() {
                                                barchar = value;
                                                pichart = !value;
                                              });
                                            },
                                          ),
                                        ),
                                        const Text("Bar Chart")
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Button(
                            title: "Show Report",
                            Function: () {
                              if (barchar) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExpenceByCategory(
                                        type: dropdownValue,
                                      ),
                                    ));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ExpencePieChart(),
                                    ));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
