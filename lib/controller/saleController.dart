// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

class SaleController extends GetxController {
  static SaleController get to => Get.find();
  TextEditingController bankamount = TextEditingController();
  TextEditingController cashamount = TextEditingController();
  TextEditingController otheramount = TextEditingController();
  TextEditingController creditTransactionamount = TextEditingController();
  TextEditingController creditReturnDate = TextEditingController();
  TextEditingController balanceAmount = TextEditingController();
  TextEditingController invoiceAmount = TextEditingController();
  TextEditingController particular = TextEditingController();
  TextEditingController mEmail = TextEditingController();
  TextEditingController mName = TextEditingController();
  TextEditingController nPhone = TextEditingController();
  bool company = true;
  String companyName = "";
  String? companyid;
  String formatTime = "Pick Date";
  double totalBalance = 0.0;
  getBalance() {
    totalBalance = 0.0;
    totalBalance = totalBalance + (double.tryParse(bankamount.text) ?? 0.0);
    totalBalance = totalBalance + (double.tryParse(cashamount.text) ?? 0.0);
    totalBalance = totalBalance + (double.tryParse(otheramount.text) ?? 0.0);
    totalBalance =
        totalBalance + (double.tryParse(creditTransactionamount.text) ?? 0.0);
    balanceAmount.text =
        ((double.tryParse(invoiceAmount.text) ?? 0.0) - totalBalance)
            .toString();
    update();
  }

  Future<void> showPaidDilogue(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            color: Colors.grey.shade300,
            height: height * 0.7,
            width: width * 0.8,
            child: Stack(
              children: [
                Container(
                  height: height * 0.1,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/dollar.jpg"))),
                ),
                Container(
                  height: height * 0.1,
                  width: width,
                  color: Colors.blue[900]!.withOpacity(0.9),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.03, left: width * 0.02),
                    child: Text(
                      "Paid As ",
                      style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.blue[900],
                      child: Container(
                        height: height * 0.65,
                        width: width * 0.7,
                        color: white,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/micon.png")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Total Invoice Amount",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: invoiceAmount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontSize:
                                                              width * 0.025,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/bank.jpeg")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Bank",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: bankamount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontSize:
                                                              width * 0.025,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/Group.jpeg")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cash",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: cashamount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontSize:
                                                              width * 0.025,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/Group 247.jpeg")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Other",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: otheramount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontSize:
                                                              width * 0.025,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/card.png")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Credit Transaction",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller:
                                                      creditTransactionamount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontSize:
                                                              width * 0.025,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/card2.png")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Return Date",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final DateTime? selectedDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2100),
                                                );

                                                if (selectedDate != null) {
                                                  creditReturnDate.text =
                                                      DateFormat("dd-MM-yyyy")
                                                          .format(selectedDate);

                                                  update();
                                                }
                                              },
                                              child: SizedBox(
                                                  height: height * 0.055,
                                                  width: width * 0.5,
                                                  child: TextFormField(
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                    enabled: false,
                                                    controller:
                                                        creditReturnDate,
                                                    decoration: InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: "Date",
                                                        hintStyle: TextStyle(
                                                            fontSize:
                                                                width * 0.025,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                        disabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide: BorderSide(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5)),
                                                        )),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/balance.png")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Balance Amount",
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.055,
                                              width: width * 0.5,
                                              child: IgnorePointer(
                                                child: TextFormField(
                                                  controller: balanceAmount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontSize:
                                                              width * 0.025,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showSaleMethodDilogue(
      BuildContext context, double height, double width) {
    company = true;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, st) {
          return AlertDialog(
            content: Container(
              color: Colors.grey.shade300,
              height: height * 0.35,
              width: width * 0.8,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.15,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/dollar.jpg"))),
                  ),
                  Container(
                    height: height * 0.15,
                    width: width,
                    color: Colors.blue[900]!.withOpacity(0.9),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.03, left: width * 0.02),
                      child: Text(
                        "Sale Method",
                        style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.07),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: Container(
                          height: height * 0.3,
                          width: width * 0.7,
                          color: white,
                          child: SingleChildScrollView(
                            child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      companyName = "Daily Sales";
                                      companyid = null;
                                      st(() {});
                                    },
                                    child: SizedBox(
                                      height: height * 0.08,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: width * 0.11,
                                            height: height * 0.11,
                                            child: const Image(
                                                image: AssetImage(
                                                    "images/dailysale.png")),
                                          ),
                                          SizedBox(
                                            width: width * 0.1,
                                          ),
                                          const Text(
                                            "Daily Sales",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      company = !company;
                                      st(
                                        () {},
                                      );
                                    },
                                    child: SizedBox(
                                      height: height * 0.08,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: width * 0.11,
                                            height: height * 0.11,
                                            child: const Image(
                                                image: AssetImage(
                                                    "images/companylogo.png")),
                                          ),
                                          SizedBox(
                                            width: width * 0.1,
                                          ),
                                          const Text(
                                            "Company",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.13,
                                          ),
                                          Icon(company
                                              ? Icons.arrow_drop_down_sharp
                                              : Icons.arrow_drop_up_sharp)
                                        ],
                                      ),
                                    ),
                                  ),
                                  !company
                                      ? InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (dc) {
                                                return AlertDialog(
                                                  content: Container(
                                                    color: Colors.grey.shade300,
                                                    height: height * 0.55,
                                                    width: width,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: height * 0.15,
                                                          width: width,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      "images/dollar.jpg"))),
                                                        ),
                                                        Container(
                                                          height: height * 0.15,
                                                          width: width,
                                                          color: Colors
                                                              .blue[900]!
                                                              .withOpacity(0.9),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height *
                                                                            0.03,
                                                                    left: width *
                                                                        0.02),
                                                            child: Text(
                                                              "Select Company",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height *
                                                                      0.07),
                                                          child: Center(
                                                            child: Card(
                                                              elevation: 10,
                                                              shadowColor:
                                                                  Colors.blue[
                                                                      900],
                                                              child: Container(
                                                                  height:
                                                                      height *
                                                                          0.5,
                                                                  width: width,
                                                                  color: white,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.01,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              ListView.builder(
                                                                            itemCount:
                                                                                HomeController.to.companyList.length,
                                                                            itemBuilder:
                                                                                (BuildContext context, int index) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    companyName = HomeController.to.companyList[index].name.toString();
                                                                                    companyid = HomeController.to.companyList[index].companyId.toString();

                                                                                    Navigator.pop(context);
                                                                                    st(
                                                                                      () {},
                                                                                    );
                                                                                  },
                                                                                  child: Card(
                                                                                    elevation: 10,
                                                                                    shadowColor: Colors.blue[900],
                                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                    child: Container(
                                                                                      height: height * 0.1,
                                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              HomeController.to.companyList[index].name!,
                                                                                              style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                                                                                            ),
                                                                                            Text(
                                                                                              HomeController.to.companyList[index].email!,
                                                                                              style: TextStyle(fontSize: width * 0.03, color: Colors.black),
                                                                                            ),
                                                                                            Text(
                                                                                              HomeController.to.companyList[index].telePhone!,
                                                                                              style: TextStyle(fontSize: width * 0.035, color: Colors.black),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                            "Existing Company",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  !company
                                      ? InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (dc) {
                                                return AlertDialog(
                                                  content: Container(
                                                    color: Colors.grey.shade300,
                                                    height: height * 0.55,
                                                    width: width * 0.8,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: height * 0.15,
                                                          width: width,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      "images/dollar.jpg"))),
                                                        ),
                                                        Container(
                                                          height: height * 0.15,
                                                          width: width,
                                                          color: Colors
                                                              .blue[900]!
                                                              .withOpacity(0.9),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height *
                                                                            0.03,
                                                                    left: width *
                                                                        0.02),
                                                            child: Text(
                                                              "Add Company",
                                                              style: TextStyle(
                                                                  color: white,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: height *
                                                                      0.07),
                                                          child: Center(
                                                            child: Card(
                                                              elevation: 10,
                                                              shadowColor:
                                                                  Colors.blue[
                                                                      900],
                                                              child: Container(
                                                                  height:
                                                                      height *
                                                                          0.5,
                                                                  width: width *
                                                                      0.7,
                                                                  color: white,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.02,
                                                                        ),
                                                                        Text(
                                                                          "Information",
                                                                          style: GoogleFonts.lexend(
                                                                              color: Colors.black,
                                                                              fontSize: width * 0.04,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.04,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width * 0.84,
                                                                          child:
                                                                              TextFormField(
                                                                            autovalidateMode:
                                                                                AutovalidateMode.onUserInteraction,
                                                                            controller:
                                                                                mName,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              errorStyle: const TextStyle(color: Colors.black),
                                                                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                              fillColor: Colors.grey,
                                                                              hintText: "Company Name",
                                                                              labelText: "Enter Name",
                                                                              alignLabelWithHint: true,
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                borderSide: BorderSide(color: blue
                                                                                    //  provider.brightness ==
                                                                                    //         AppBrightness.dark
                                                                                    //     ? AppTheme.colorWhite
                                                                                    //     : AppTheme.colorPrimary,
                                                                                    ),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                borderSide: BorderSide(color: blue
                                                                                    // provider.brightness ==
                                                                                    //         AppBrightness.dark
                                                                                    //     ? AppTheme.colorWhite
                                                                                    //   : AppTheme.colorPrimary,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.015,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width * 0.84,
                                                                          child:
                                                                              TextFormField(
                                                                            autovalidateMode:
                                                                                AutovalidateMode.onUserInteraction,
                                                                            controller:
                                                                                mEmail,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              errorStyle: const TextStyle(color: Colors.black),
                                                                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                              fillColor: Colors.grey,
                                                                              hintText: "Company Email",
                                                                              labelText: "Enter Email",
                                                                              alignLabelWithHint: true,
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                borderSide: BorderSide(color: blue
                                                                                    //  provider.brightness ==
                                                                                    //         AppBrightness.dark
                                                                                    //     ? AppTheme.colorWhite
                                                                                    //     : AppTheme.colorPrimary,
                                                                                    ),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                borderSide: BorderSide(color: blue
                                                                                    // provider.brightness ==
                                                                                    //         AppBrightness.dark
                                                                                    //     ? AppTheme.colorWhite
                                                                                    //   : AppTheme.colorPrimary,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.015,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width * 0.84,
                                                                          child:
                                                                              TextFormField(
                                                                            autovalidateMode:
                                                                                AutovalidateMode.onUserInteraction,
                                                                            controller:
                                                                                nPhone,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              errorStyle: const TextStyle(color: Colors.black),
                                                                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                              fillColor: Colors.grey,
                                                                              hintText: "Phone Number",
                                                                              labelText: "Phone Number",
                                                                              alignLabelWithHint: true,
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                borderSide: BorderSide(color: blue
                                                                                    //  provider.brightness ==
                                                                                    //         AppBrightness.dark
                                                                                    //     ? AppTheme.colorWhite
                                                                                    //     : AppTheme.colorPrimary,
                                                                                    ),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                                borderSide: BorderSide(color: blue
                                                                                    // provider.brightness ==
                                                                                    //         AppBrightness.dark
                                                                                    //     ? AppTheme.colorWhite
                                                                                    //   : AppTheme.colorPrimary,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.04,
                                                                        ),
                                                                        Card(
                                                                          elevation:
                                                                              5,
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Map<String, dynamic> map = {
                                                                                "name": mName.text,
                                                                                "email": mEmail.text,
                                                                                "telePhone": nPhone.text,
                                                                              };

                                                                              HomeController.to.addCompanyData(map, dc).then((value) {
                                                                                mName.clear();
                                                                                mEmail.clear();
                                                                                nPhone.clear();
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              height: height * 0.06,
                                                                              width: width * 0.45,
                                                                              decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(7)),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  "Add Company",
                                                                                  style: TextStyle(fontSize: width * 0.03, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                            "New Company",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        " Name : ",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        companyName,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      formatTime = DateFormat("dd-MM-yyyy").format(selectedDate);

      update();
    }
  }

  //// sale api

  postsale(BuildContext context) async {
    try {
      if (formatTime != "Pick Date") {
        if (companyName.isNotEmpty) {
          dio.FormData data = TransactionController.to.pathFile.isEmpty
              ? dio.FormData.fromMap({
                  "Name": "Sale",
                  "CashAmount": double.tryParse(cashamount.text) ?? 0.0,
                  "BankAmount": double.tryParse(bankamount.text) ?? 0.0,
                  "OtherAmount": double.tryParse(otheramount.text) ?? 0.0,
                  "PartialAmount": double.tryParse(balanceAmount.text) ?? 0.0,
                  "TotalAmount": double.tryParse(invoiceAmount.text) ?? 0.0,
                  "RemainingAmount":
                      (double.tryParse(invoiceAmount.text) ?? 0.0) -
                          (double.tryParse(balanceAmount.text) ?? 0.0),
                  "Note": particular.text,
                  "DateTime": formatTime,
                  "PayBackDay": creditReturnDate.text,
                  "Currency": HomeController.to.curency,
                  "CompanyId": companyid,
                  "SaleMethod": companyName == "Daily Sales" ? 0 : 1,
                })
              : dio.FormData.fromMap({
                  "Name": "Sale",
                  "CashAmount": double.tryParse(cashamount.text) ?? 0.0,
                  "BankAmount": double.tryParse(bankamount.text) ?? 0.0,
                  "OtherAmount": double.tryParse(otheramount.text) ?? 0.0,
                  "PartialAmount": double.tryParse(balanceAmount.text) ?? 0.0,
                  "TotalAmount": double.tryParse(invoiceAmount.text) ?? 0.0,
                  "RemainingAmount":
                      (double.tryParse(invoiceAmount.text) ?? 0.0) -
                          (double.tryParse(balanceAmount.text) ?? 0.0),
                  "Note": particular.text,
                  "DateTime": formatTime,
                  "PayBackDay": creditReturnDate.text,
                  "Currency": HomeController.to.curency,
                  "CompanyId": companyid,
                  "SaleMethod": companyName == "Daily Sales" ? 0 : 1,
                  "File": await dio.MultipartFile.fromFile(
                    TransactionController.to.compressedFile!.path,
                    filename:
                        basename(TransactionController.to.compressedFile!.path),
                  ),
                });
          print(data.fields.toString());
          dio.Response res =
              await httpFormDataClient().post(StaticValues.addSale, data: data);
          if (res.statusCode == 200) {
            showtoast(res.data["status"]);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashBoardScreen(),
                ),
                (route) => false);
            TransactionController.to.pathFile = "";
            clearAndInitializeControllers();
          }
        } else {
          showtoast("Please Enter Sale Method !");
        }
      } else {
        showtoast("Please Enter Date !");
      }
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

  void clearAndInitializeControllers() {
    bankamount.clear();
    cashamount.clear();
    otheramount.clear();
    creditTransactionamount.clear();
    creditReturnDate.clear();
    balanceAmount.clear();
    invoiceAmount.clear();
    particular.clear();
    mEmail.clear();
    mName.clear();
    nPhone.clear();
    company = true;
    companyName = "";
    companyid = null;
    formatTime = "Pick Date";
    update();
  }

  void showtoast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.blue[900],
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG);
  }
}
