import 'package:flutter/material.dart';

import '../../models/pagemodel.dart';
import '../../utils/appbarwidget.dart';
import '../../utils/color.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  var indexNumber = null;
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
                  height: height * 0.15,
                  color: darkblue,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Pages",
                            style: TextStyle(
                                color: white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.1,
                  left: width * 0.05,
                  child: Container(
                    height: height * 0.6,
                    width: width * 0.9,
                    color: white,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              indexNumber = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      indexNumber == index ? darkblue : white,
                                  borderRadius: BorderRadius.circular(11)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 28.0),
                                      child: Icon(
                                        list[index].icon,
                                        size: 35,
                                        color: indexNumber == index
                                            ? white
                                            : Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.1,
                                    ),
                                    Text(
                                      "${list[index].title}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: indexNumber == index
                                              ? white
                                              : Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
