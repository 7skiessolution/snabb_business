// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:dio/dio.dart' as deo;
import 'package:path/path.dart';

class PurchaseController extends GetxController {
  static PurchaseController get to => Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController regNo = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController bankamount = TextEditingController();
  TextEditingController cashamount = TextEditingController();
  TextEditingController otheramount = TextEditingController();
  TextEditingController creditTransactionamount = TextEditingController();
  TextEditingController creditReturnDate = TextEditingController();
  TextEditingController balanceAmount = TextEditingController();
  TextEditingController invoiceAmount = TextEditingController();
  TextEditingController particular = TextEditingController();
  bool company = true;
  String supplierid = '';
  String supplierName = '';
  XFile? pickImage;
  String pathFile = "";
  Future<void> showPaidDilogue(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            color: Colors.grey.shade300,
            height: height * 0.65,
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
                        height: height * 0.6,
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
                                                  "images/bank.jpeg")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Bank",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: bankamount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
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
                                            const Text(
                                              "Cash",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: cashamount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
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
                                            const Text(
                                              "Other",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: otheramount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
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
                                            const Text(
                                              "Credit Transaction",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller:
                                                      creditTransactionamount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
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
                                            const Text(
                                              "Credit Return Date",
                                              style: TextStyle(
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
                                            const Text(
                                              "Balance Amount",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.055,
                                              width: width * 0.5,
                                              child: TextFormField(
                                                controller: balanceAmount,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Amount",
                                                    hintStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.grey
                                                            .withOpacity(0.5)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                    )),
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
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
                                                  "images/micon.png")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Total Invoice mount",
                                              style: TextStyle(
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
                        "Purchase Method",
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
                          width: width * 0.75,
                          color: white,
                          child: SingleChildScrollView(
                            child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
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
                                                  "images/dailysale.png")),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        const Text(
                                          "Individual",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.22,
                                        ),
                                      ],
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
                                            width: width * 0.02,
                                          ),
                                          const Text(
                                            "supplier",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.2,
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
                                                              "Select Supplier",
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
                                                                                HomeController.to.supplierList.length,
                                                                            itemBuilder:
                                                                                (BuildContext context, int index) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    supplierName = HomeController.to.supplierList[index].name.toString();
                                                                                    supplierid = HomeController.to.supplierList[index].supplierId.toString();
                                                                                    print("name supplier ------$supplierName");
                                                                                    Navigator.pop(context);
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
                                                                                        child: Expanded(
                                                                                          child: SizedBox(
                                                                                            height: height,
                                                                                            width: width,
                                                                                            child: Column(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  HomeController.to.supplierList[index].name!,
                                                                                                  style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                                                                                                ),
                                                                                                Text(
                                                                                                  HomeController.to.supplierList[index].email!,
                                                                                                  style: TextStyle(fontSize: width * 0.03, color: Colors.black),
                                                                                                ),
                                                                                                Text(
                                                                                                  HomeController.to.supplierList[index].telePhone!,
                                                                                                  style: TextStyle(fontSize: width * 0.035, color: Colors.black),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
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
                                            "Existing Supplier",
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
                                                    height: height * 0.7,
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
                                                              "Add Supplier",
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
                                                                          0.6,
                                                                  width: width *
                                                                      0.7,
                                                                  color: white,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.02,
                                                                          ),
                                                                          Text(
                                                                            "Inofrmation",
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
                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                              controller: name,
                                                                              keyboardType: TextInputType.text,
                                                                              decoration: InputDecoration(
                                                                                errorStyle: const TextStyle(color: Colors.black),
                                                                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                fillColor: Colors.grey,
                                                                                hintText: "Supplier Name",
                                                                                labelText: "Enter Name",
                                                                                alignLabelWithHint: true,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
                                                                                      //  provider.brightness ==
                                                                                      //         AppBrightness.dark
                                                                                      //     ? AppTheme.colorWhite
                                                                                      //     : AppTheme.colorPrimary,
                                                                                      ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
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
                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                              controller: email,
                                                                              keyboardType: TextInputType.text,
                                                                              decoration: InputDecoration(
                                                                                errorStyle: const TextStyle(color: Colors.black),
                                                                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                fillColor: Colors.grey,
                                                                                hintText: "Supplier Email",
                                                                                labelText: "Enter Email",
                                                                                alignLabelWithHint: true,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
                                                                                      //  provider.brightness ==
                                                                                      //         AppBrightness.dark
                                                                                      //     ? AppTheme.colorWhite
                                                                                      //     : AppTheme.colorPrimary,
                                                                                      ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
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
                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                              controller: regNo,
                                                                              keyboardType: TextInputType.text,
                                                                              decoration: InputDecoration(
                                                                                errorStyle: const TextStyle(color: Colors.black),
                                                                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                fillColor: Colors.grey,
                                                                                hintText: "Company Reg",
                                                                                labelText: "Reg",
                                                                                alignLabelWithHint: true,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
                                                                                      //  provider.brightness ==
                                                                                      //         AppBrightness.dark
                                                                                      //     ? AppTheme.colorWhite
                                                                                      //     : AppTheme.colorPrimary,
                                                                                      ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
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
                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                              controller: number,
                                                                              keyboardType: TextInputType.text,
                                                                              decoration: InputDecoration(
                                                                                errorStyle: const TextStyle(color: Colors.black),
                                                                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                fillColor: Colors.grey,
                                                                                hintText: "Number",
                                                                                labelText: "Number",
                                                                                alignLabelWithHint: true,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
                                                                                      //  provider.brightness ==
                                                                                      //         AppBrightness.dark
                                                                                      //     ? AppTheme.colorWhite
                                                                                      //     : AppTheme.colorPrimary,
                                                                                      ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
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
                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                              controller: address,
                                                                              keyboardType: TextInputType.text,
                                                                              decoration: InputDecoration(
                                                                                errorStyle: const TextStyle(color: Colors.black),
                                                                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                fillColor: Colors.grey,
                                                                                hintText: "Address",
                                                                                labelText: "Address",
                                                                                alignLabelWithHint: true,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
                                                                                      //  provider.brightness ==
                                                                                      //         AppBrightness.dark
                                                                                      //     ? AppTheme.colorWhite
                                                                                      //     : AppTheme.colorPrimary,
                                                                                      ),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  borderSide: BorderSide(color: AppColors.blue
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
                                                                              onTap: () {
                                                                                Map<String, dynamic> map = {
                                                                                  "name": name.text,
                                                                                  "email": email.text,
                                                                                  "telePhone": number.text,
                                                                                  "address": address.text,
                                                                                  "companyReg": regNo.text,
                                                                                  "isCompany": false,
                                                                                };

                                                                                HomeController.to.addSupplierData(map, dc).then((value) {
                                                                                  name.clear();
                                                                                  regNo.clear();
                                                                                  email.clear();
                                                                                  number.clear();
                                                                                  address.clear();
                                                                                });
                                                                              },
                                                                              child: Container(
                                                                                height: height * 0.06,
                                                                                width: width * 0.45,
                                                                                decoration: BoxDecoration(color: AppColors.blue, borderRadius: BorderRadius.circular(7)),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "Add Supplier",
                                                                                    style: TextStyle(fontSize: width * 0.03, color: Colors.white, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
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
                                            "New Supplier",
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
                                        supplierName,
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

  Future addPurchaseTransaction(
      String name,
      String note,
      num amount,
      num partialamount,
      String datetime,
      int type,
      int iscash,
      String catId,
      String currency,
      String walletId) async {
    String result;

    try {
      print("image file ${pickImage!.path}");
      deo.FormData data = pathFile.isEmpty
          ? deo.FormData.fromMap({
              "Name": name,
              "Amount": amount,
              "PartialAmount": partialamount,
              "Note": note,
              "DateTime": datetime,
              "Type": type,
              "PaymentType": iscash,
              "CategoryId": catId,
              "Currency": currency,
              "WalletId": walletId
            })
          : deo.FormData.fromMap({
              "Name": name,
              "Amount": amount,
              "PartialAmount": partialamount,
              "Note": note,
              "DateTime": datetime,
              "Type": type,
              "PaymentType": iscash,
              "File": await deo.MultipartFile.fromFile(
                pickImage!.path,
                filename: basename(pickImage!.path),
              ),
              "CategoryId": catId,
              "Currency": currency,
              "WalletId": walletId
            });

      var response = await httpFormDataClient()
          .post(StaticValues.addTransaction, data: data);

      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        print("Response status Cose ${response.statusCode}");
        if (response.data != null) {
          print(".................${response.data}........");
        }
      }
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
    pathFile = "";
    update();
  }
}