// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/utils/category_tile.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/summery_tile.dart';

import '../../controller/summerry_controller.dart';
import '../../utils/color.dart';

class SummeryScreen extends StatefulWidget {
  const SummeryScreen({super.key});

  @override
  State<SummeryScreen> createState() => _SummeryScreenState();
}

class _SummeryScreenState extends State<SummeryScreen> {
  var controller = Get.put(SummeryController());
  int selectedContainerIndex = 0;

  void handleContainerTap(int index) {
    setState(() {
      selectedContainerIndex = index;
    });
  }

  bool isSelected = false;
  var width;

  var height;
  final imtems = ["purchase", "Sale"];
  var firstitem = 'purchase';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.red,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height * 0.15,
                color: AppColors.topcard,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(
                        //   he

                        // ),
                        GestureDetector(
                          onTap: () => handleContainerTap(0),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: selectedContainerIndex == 0
                                            ? AppColors.redcolor
                                            : Colors.transparent))),
                            child: const Text(
                              "SUMMERY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => handleContainerTap(1),
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: selectedContainerIndex == 1
                                            ? AppColors.redcolor
                                            : Colors.transparent))),
                            child: const Text(
                              "CATEGORIES",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              selectedContainerIndex == 0
                  ? Positioned(
                      top: height * 0.12,
                      right: width * 0.015,
                      left: width * 0.015,
                      child: Container(
                        width: width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return const SummeryTile();
                                })
                          ],
                        ),
                      ),
                    )
                  //category list
                  : Positioned(
                      top: height * 0.12,
                      right: width * 0.015,
                      left: width * 0.015,
                      child: Column(
                        children: [
                          Obx(() => Container(
                                width: width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    // add data

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      width: width,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Compare the values of the categories",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: height * 0.03,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Type :",
                                                  style: TextStyle(
                                                      fontSize: width * 0.04)),
                                              Container(
                                                height: height * 0.05,
                                                width: width * 0.3,
                                                color: Colors.grey.shade300,
                                                child: Center(
                                                  child: DropdownButton<String>(
                                                      underline:
                                                          const DropdownButtonHideUnderline(
                                                              child:
                                                                  SizedBox()),
                                                      // itemHeight: 2,

                                                      icon: const Icon(Icons
                                                          .arrow_drop_down),
                                                      iconSize: 16,
                                                      elevation: 8,
                                                      style: TextStyle(
                                                          color: textcolor,
                                                          fontSize: 16),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          firstitem = newValue!;
                                                        });
                                                        print(
                                                            "value  ${firstitem}");
                                                      },
                                                      value: firstitem,
                                                      items: imtems
                                                          .map((String value) {
                                                        print("ww $value");
                                                        return new DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child:
                                                              new Text(value),
                                                        );
                                                      }).toList()),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Form :",
                                                  style: TextStyle(
                                                      fontSize: width * 0.04)),
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                      .chosefromdate(context);
                                                },
                                                child: Container(
                                                  width: width * 0.3,
                                                  padding: EdgeInsets.all(4),
                                                  color: Colors.grey.shade400
                                                      .withOpacity(0.3),
                                                  child: Text(
                                                    DateFormat("dd/MM/yyyy")
                                                        .format(controller
                                                            .fromDate.value)
                                                        .toString(),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("To :",
                                                  style: TextStyle(
                                                      fontSize: width * 0.04)),
                                              InkWell(
                                                onTap: () {
                                                  controller
                                                      .chosetodate(context);
                                                },
                                                child: Container(
                                                  width: width * 0.3,
                                                  padding: EdgeInsets.all(4),
                                                  color: Colors.grey.shade400
                                                      .withOpacity(0.3),
                                                  child: Text(
                                                    DateFormat("dd/MM/yyyy")
                                                        .format(controller
                                                            .toDate.value)
                                                        .toString(),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("This Month",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: width * 0.04)),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // date picker
                                    )
                                  ],
                                ),
                              )),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const CategoryTile();
                              })
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// summery container selected

// category container selected

