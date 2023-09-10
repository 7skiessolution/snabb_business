// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

import '../../utils/appbarwidget.dart';

class TimeGraph extends StatefulWidget {
  const TimeGraph({super.key});

  @override
  State<TimeGraph> createState() => _TimeGraphState();
}

class _TimeGraphState extends State<TimeGraph> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          AppBarWidgt(text: "Chart"),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: height * 0.3,
                  color: darkblue,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Time",
                            style: TextStyle(
                                color: white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.3,
                        ),
                        Icon(
                          Icons.pie_chart,
                          color: white,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.1,
                  left: width * 0.15,
                  child: Container(
                    height: height * 0.4,
                    width: width * 0.7,
                    color: white,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
