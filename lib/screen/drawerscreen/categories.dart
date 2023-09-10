import 'package:flutter/material.dart';
import 'package:snabb_business/screen/drawerscreen/ExpenseByCategory.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';

import '../../utils/Button.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool pichart = false;
  String? dropdownValue = 'Purchase';
  String? dropdownValue1 = 'This Month';
  bool barchar = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    List<String> dropdownItems = <String>[
      'Purchase',
      'sale',
    ];

    List<String> dropdownItems1 = <String>[
      'This Month',
      'This Year',
    ];

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          AppBarWidgt(text: "Chart"),
          Container(
            height: height * 0.06,
            color: darkblue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          Container(
            height: height * 0.55,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Show all categories of:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.5,
                    color: Colors.grey.shade300,
                    child: Center(
                      child: DropdownButton<String>(
                        underline: const DropdownButtonHideUnderline(
                            child: SizedBox()),
                        // itemHeight: 2,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 16,
                        elevation: 8,
                        style: TextStyle(color: textcolor, fontSize: 16),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: dropdownItems
                            .map<DropdownMenuItem<String>>((String value) {
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Form:"),
                        Container(
                          height: height * 0.05,
                          width: width * 0.3,
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Text("22/07/2023"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("To:"),
                        Container(
                          height: height * 0.05,
                          width: width * 0.3,
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Text("22/07/2023"),
                          ),
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
                                underline: const DropdownButtonHideUnderline(
                                    child: SizedBox()),
                                // itemHeight: 2,

                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 16,
                                elevation: 8,
                                style:
                                    TextStyle(color: textcolor, fontSize: 16),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue1 = newValue;
                                  });
                                  print("value  ${dropdownValue1}");
                                },
                                value: dropdownValue1,
                                items: dropdownItems1.map((String value) {
                                  print("ww $value");
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                    activeColor: darkblue,
                                    splashRadius: 60,
                                    activeTrackColor: backgroundColor,
                                    inactiveTrackColor: backgroundColor,
                                    focusColor: backgroundColor,
                                    autofocus: false,
                                    hoverColor: lightgray,
                                    value: pichart,
                                    onChanged: (value) {
                                      setState(() {
                                        pichart = value;
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
                                    activeColor: darkblue,
                                    splashRadius: 60,
                                    activeTrackColor: backgroundColor,
                                    inactiveTrackColor: backgroundColor,
                                    focusColor: backgroundColor,
                                    autofocus: false,
                                    hoverColor: lightgray,
                                    value: barchar,
                                    onChanged: (value) {
                                      setState(() {
                                        barchar = value;
                                      });
                                    },
                                  ),
                                ),
                                const Text("Pie Chart")
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExpenceByCategory(),
                          ));
                    },
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
