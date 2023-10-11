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
  String formatTime = "Sales Date";
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

  Future<void> companyDialog(
      BuildContext context, double height, double width) {
    return showDialog(
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
                  color: greencolor.withOpacity(0.9),
                  alignment: Alignment.center,
                  child: Text(
                    "Select Company",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shadowColor: greencolor,
                      child: Container(
                          height: height * 0.5,
                          width: width,
                          color: white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        HomeController.to.companyList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          companyName = HomeController
                                              .to.companyList[index].name
                                              .toString();
                                          companyid = HomeController
                                              .to.companyList[index].companyId
                                              .toString();
                                          update();
                                          Navigator.pop(context);
                                        },
                                        child: Card(
                                          elevation: 10,
                                          shadowColor: greencolor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            height: height * 0.1,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    HomeController
                                                        .to
                                                        .companyList[index]
                                                        .name!,
                                                    style: GoogleFonts.poppins(
                                                        color: blue,
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    HomeController
                                                        .to
                                                        .companyList[index]
                                                        .email!,
                                                    style: GoogleFonts.poppins(
                                                        color: lightgray,
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    HomeController
                                                        .to
                                                        .companyList[index]
                                                        .telePhone!,
                                                    style: GoogleFonts.poppins(
                                                        color: lightgray,
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
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
  }

  Future<void> showPaidDilogue(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            color: Colors.grey.shade300,
            height: height * 0.8,
            width: width * 0.9,
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
                  color: greencolor.withOpacity(0.9),
                  alignment: Alignment.center,
                  child: Text(
                    "Paid As ",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shadowColor: greencolor,
                      child: Container(
                        height: height * 0.7,
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
                                              "Total Amount".toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                                height: height * 0.045,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: invoiceAmount,
                                                  style: GoogleFonts.poppins(
                                                      // color:Colors.blue[900],
                                                      fontSize: width * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left:
                                                                  width * 0.02,
                                                              top: height *
                                                                  0.01),
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              // color:Colors.blue[900],
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                              "Bank".toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                                height: height * 0.045,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: bankamount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  style: GoogleFonts.poppins(
                                                      // color:Colors.blue[900],
                                                      fontSize: width * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left:
                                                                  width * 0.02,
                                                              top: height *
                                                                  0.01),
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                              "Cash".toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                                height: height * 0.045,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: cashamount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  style: GoogleFonts.poppins(
                                                      // color:Colors.blue[900],
                                                      fontSize: width * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left:
                                                                  width * 0.02,
                                                              top: height *
                                                                  0.01),
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                              "Others".toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                                height: height * 0.045,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: otheramount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  style: GoogleFonts.poppins(
                                                      // color:Colors.blue[900],
                                                      fontSize: width * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left:
                                                                  width * 0.02,
                                                              top: height *
                                                                  0.01),
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                              "Credit Transaction"
                                                  .toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                                height: height * 0.045,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller:
                                                      creditTransactionamount,
                                                  onChanged: (value) {
                                                    getBalance();
                                                  },
                                                  style: GoogleFonts.poppins(
                                                      // color:Colors.blue[900],
                                                      fontSize: width * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left:
                                                                  width * 0.02,
                                                              top: height *
                                                                  0.01),
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                              "Credit Return Date"
                                                  .toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
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
                                                  height: height * 0.045,
                                                  width: width * 0.5,
                                                  child: TextFormField(
                                                    enabled: false,
                                                    controller:
                                                        creditReturnDate,
                                                    style: GoogleFonts.poppins(
                                                        // color:Colors.blue[900],
                                                        fontSize: width * 0.025,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left:
                                                                    width *
                                                                        0.02,
                                                                top:
                                                                    height *
                                                                        0.01),
                                                        border: InputBorder
                                                            .none,
                                                        hintText: "Date",
                                                        hintStyle: GoogleFonts
                                                            .poppins(
                                                                color:
                                                                    lightgray,
                                                                fontSize:
                                                                    width *
                                                                        0.025,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
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
                                              "Balance Amount".toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: height * 0.045,
                                              width: width * 0.5,
                                              child: IgnorePointer(
                                                child: TextFormField(
                                                  controller: balanceAmount,
                                                  style: GoogleFonts.poppins(
                                                      // color:Colors.blue[900],
                                                      fontSize: width * 0.025,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left:
                                                                  width * 0.02,
                                                              top: height *
                                                                  0.01),
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                                  SizedBox(height: height * 0.02),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Card(
                                      child: Container(
                                        width: width * 0.2,
                                        height: height * 0.05,
                                        decoration: BoxDecoration(
                                            color: greencolor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Center(
                                            child: Text(
                                          "Add",
                                          style: GoogleFonts.poppins(
                                              color: white,
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w600),
                                        )),
                                      ),
                                    ),
                                  )
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
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, st) {
          return Dialog(
            child: Container(
              color: Colors.grey.shade300,
              height: company ? height * 0.6 : height * 0.3,
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
                    color: greencolor.withOpacity(0.9),
                    alignment: Alignment.center,
                    child: Text(
                      "Select Sale Method",
                      style: GoogleFonts.poppins(
                          color: white,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.07),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: greencolor,
                        child: Container(
                          height: company ? height * 0.5 : height * 0.2,
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
                                      update();
                                      Navigator.pop(context);
                                    },
                                    child: SizedBox(
                                      height: height * 0.08,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
                                          SizedBox(
                                            width: width * 0.11,
                                            height: height * 0.11,
                                            child: const Image(
                                                image: AssetImage(
                                                    "images/dailysale.png")),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            "Daily Sales",
                                            style: GoogleFonts.poppins(
                                                // color: white,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w600),
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
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
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
                                          Text(
                                            "Clients/Custumers",
                                            style: GoogleFonts.poppins(
                                                // color: white,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: width * 0.1,
                                          ),
                                          Icon(company
                                              ? Icons.arrow_drop_down_sharp
                                              : Icons.arrow_drop_up_sharp)
                                        ],
                                      ),
                                    ),
                                  ),
                                  company
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.06),
                                          child: InkWell(
                                            onTap: () {
                                              companyDialog(
                                                      context, height, width)
                                                  .then((value) {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text(
                                              "Existing Clients/Custumers",
                                              style: GoogleFonts.poppins(
                                                  color: lightgray,
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  company
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.03),
                                          child: Text(
                                            "New Client/Custumer",
                                            style: GoogleFonts.poppins(
                                                color: lightgray,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      : const SizedBox(),
                                  company
                                      ? Container(
                                          height: height * 0.5,
                                          width: width * 0.7,
                                          color: white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: width * 0.5,
                                                  height: height * 0.045,
                                                  child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller: mName,
                                                    style: GoogleFonts.poppins(
                                                        // color:Colors.blue[900],
                                                        fontSize: width * 0.025,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    decoration: InputDecoration(
                                                      errorStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.black),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 0,
                                                              horizontal: 20),
                                                      fillColor: Colors.grey,
                                                      hintText: "Company Name",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              // color:Colors.blue[900],
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      labelText: "Enter Name",
                                                      alignLabelWithHint: true,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: lightgray
                                                            //  provider.brightness ==
                                                            //         AppBrightness.dark
                                                            //     ? AppTheme.colorWhite
                                                            //     : AppTheme.colorPrimary,
                                                            ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: lightgray
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
                                                  height: height * 0.01,
                                                ),
                                                SizedBox(
                                                  width: width * 0.5,
                                                  height: height * 0.045,
                                                  child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller: mEmail,
                                                    style: GoogleFonts.poppins(
                                                        // color:Colors.blue[900],
                                                        fontSize: width * 0.025,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    decoration: InputDecoration(
                                                      errorStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.black),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 0,
                                                              horizontal: 20),
                                                      fillColor: Colors.grey,
                                                      hintText: "Company Email",
                                                      labelText: "Enter Email",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              // color:Colors.blue[900],
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      alignLabelWithHint: true,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: lightgray
                                                            //  provider.brightness ==
                                                            //         AppBrightness.dark
                                                            //     ? AppTheme.colorWhite
                                                            //     : AppTheme.colorPrimary,
                                                            ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: lightgray
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
                                                  height: height * 0.01,
                                                ),
                                                SizedBox(
                                                  width: width * 0.5,
                                                  height: height * 0.045,
                                                  child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller: nPhone,
                                                    style: GoogleFonts.poppins(
                                                        // color:Colors.blue[900],
                                                        fontSize: width * 0.025,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    decoration: InputDecoration(
                                                      errorStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.black),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 0,
                                                              horizontal: 20),
                                                      fillColor: Colors.grey,
                                                      hintText: "Phone Number",
                                                      labelText: "Phone Number",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              // color:Colors.blue[900],
                                                              fontSize:
                                                                  width * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      alignLabelWithHint: true,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: lightgray),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: lightgray),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Card(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Map<String, dynamic> map =
                                                          {
                                                        "name": mName.text,
                                                        "email": mEmail.text,
                                                        "telePhone":
                                                            nPhone.text,
                                                      };

                                                      HomeController.to
                                                          .addCompanyData(
                                                              map, context, "")
                                                          .then((value) {
                                                        mName.clear();
                                                        mEmail.clear();
                                                        nPhone.clear();
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 1),
                                                            () {
                                                          companyDialog(context,
                                                                  height, width)
                                                              .then((value) {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        });
                                                      });
                                                    },
                                                    child: Container(
                                                      height: height * 0.045,
                                                      width: width * 0.5,
                                                      decoration: BoxDecoration(
                                                          color: greencolor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
                                                      child: Center(
                                                        child: Text(
                                                          "Add Client/Custumer",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      width *
                                                                          0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      : const SizedBox()

                                  // SizedBox(
                                  //   height: height * 0.01,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     const Text(
                                  //       " Name : ",
                                  //       style: TextStyle(color: Colors.black),
                                  //     ),
                                  //     Text(
                                  //       companyName,
                                  //       style: const TextStyle(
                                  //           color: Colors.black,
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //   ],
                                  // )
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
      if (formatTime != "Sales Date") {
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
