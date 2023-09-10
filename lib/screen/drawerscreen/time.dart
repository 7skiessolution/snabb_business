import 'package:flutter/material.dart';
import 'package:snabb_business/utils/Button.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';

import '../ExpensePieChart.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String? dropdownValue = 'Purchase';
  List<String> dropdownItems = <String>[
    'Purchase',
    'sale',
  ];
  String? dropdownValue1 = 'Month';
  List<String> dropdownItems1 = [
    'Month',
    'Year',
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          AppBarWidgt(text: "Chart"),
          Container(
            height: height * 0.07,
            color: darkblue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Text(
                  "Time",
                  style: TextStyle(color: white, fontSize: 17),
                ),
              ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Displayed Values:"),
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
                        const Text("Period:"),
                        Container(
                          height: height * 0.05,
                          width: width * 0.5,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("From:"),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Category:",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: height * 0.05,
                          width: width * 0.3,
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Text("All Category"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.13,
                  ),
                  Button(
                    title: "Show Report",
                    Function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExpencePieChart(),
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
