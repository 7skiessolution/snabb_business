// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';

class ExpenceByCategory extends StatefulWidget {
  const ExpenceByCategory({super.key});

  @override
  State<ExpenceByCategory> createState() => _ExpenceByCategoryState();
}

class _ExpenceByCategoryState extends State<ExpenceByCategory> {
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Expence By Category",
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
                    height: height * 0.35,
                    width: width * 0.7,
                    color: white,
                  ),
                ),
                Positioned(
                  top: height * 0.47,
                  left: width * 0.01,
                  child: Container(
                    height: height * 0.42,
                    width: width * 0.98,
                    color: Colors.transparent,
                    child: ListView(

                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // cardOfExpence(
                          //     rs: "-12000", subtitle: "100%", title: "expense"),
                          // cardOfExpence(
                          //     rs: "-12000", subtitle: "100%", title: "expense"),
                          // cardOfExpence(
                          //     rs: "-12000", subtitle: "100%", title: "expense"),
                          // cardOfExpence(
                          //     rs: "-12000", subtitle: "100%", title: "expense"),
                          CardOfExpence(
                              rs: "-12000", subtitle: "100%", title: "expense")
                        ]),
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

class CardOfExpence extends StatelessWidget {
  CardOfExpence({
    super.key,
    this.image,
    required this.rs,
    required this.subtitle,
    required this.title,
  });

  String? image;
  String title;
  String subtitle;
  String rs;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: height * 0.1,
        decoration:
            BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.04,
              ),
              CircleAvatar(
                  radius: 25,
                  backgroundColor: darkblue,
                  child: image == null
                      ? const CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.money,
                          ),
                        )
                      : CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(image!),
                        )),
              SizedBox(
                width: width * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.2,
              ),
              SizedBox(
                height: height * 0.1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            rs,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            " Rs",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(fontSize: 14, color: lightgray),
                          ),
                          Text(
                            rs,
                            style: TextStyle(fontSize: 14, color: lightgray),
                          ),
                          Text(
                            " 0PKR",
                            style: TextStyle(fontSize: 14, color: lightgray),
                          ),
                        ],
                      )
                    ]),
              ),
            ]),
      ),
    );
  }
}
