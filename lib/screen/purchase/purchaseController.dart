// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool newSupplier = false;
  String? supplierid;
  String supplierName = '';
  String formatTime = "Purchase Date";
  String paybackTime = "Date";
  double totalBalance = 0.0;
  bool loading = true;
  bool supp = true;
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

  Future<void> supplierDialog(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (dc) {
        return Dialog(
          child: Container(
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
                  color: blue.withOpacity(0.9),
                  alignment: Alignment.center,
                  child: Text(
                    "Select Supplier",
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
                      shadowColor: Colors.blue[900],
                      child: Container(
                          height: height * 0.5,
                          width: width * 0.8,
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
                                    shrinkWrap: true,
                                    itemCount:
                                        HomeController.to.supplierList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            supplierName = HomeController
                                                .to.supplierList[index].name
                                                .toString();
                                            supplierid = HomeController.to
                                                .supplierList[index].supplierId
                                                .toString();
                                            print(
                                                "name supplier ------$supplierName");
                                            // st(
                                            //   () {},
                                            // );
                                            update();
                                            Navigator.pop(context);
                                          },
                                          child: Card(
                                            elevation: 10,
                                            shadowColor: Colors.blue[900],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Container(
                                              height: height * 0.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: height,
                                                  width: width,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        HomeController
                                                            .to
                                                            .supplierList[index]
                                                            .name!,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: blue,
                                                                fontSize:
                                                                    width *
                                                                        0.035,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      Text(
                                                        HomeController
                                                            .to
                                                            .supplierList[index]
                                                            .email!,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    lightgray,
                                                                fontSize:
                                                                    width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      Text(
                                                        HomeController
                                                            .to
                                                            .supplierList[index]
                                                            .telePhone!,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color:
                                                                    lightgray,
                                                                fontSize:
                                                                    width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ],
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
                  color: blue.withOpacity(0.9),
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
                      shadowColor: blue,
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
                                              "Other".toUpperCase(),
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
                                              "Return Date".toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                selectPayBackDate(context);
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
                                            color: blue,
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
    BuildContext context,
    double height,
    double width,
    var formkey1,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, st) {
          return Form(
            key: formkey1,
            child: Dialog(
              child: Container(
                color: Colors.grey.shade300,
                height: newSupplier == true ? height * 0.8 : height * 0.3,
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
                      color: blue.withOpacity(0.9),
                      alignment: Alignment.center,
                      child: Text(
                        "Purchase Method",
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
                          shadowColor: blue,
                          child: Container(
                            height: newSupplier == true
                                ? height * 0.7
                                : height * 0.25,
                            width: width * 0.75,
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
                                        supplierDialog(context, height, width)
                                            .then((value) {
                                          Navigator.pop(context);
                                        });

                                        // supplierName = "Individual";
                                        // supplierid = null;
                                        // st(
                                        //   () {},
                                        // );
                                      },
                                      child: SizedBox(
                                        height: height * 0.08,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
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
                                              width: width * 0.03,
                                            ),
                                            Text(
                                              "EXISTING SUPPLIER",
                                              style: GoogleFonts.poppins(
                                                  // color: white,
                                                  fontSize: width * 0.035,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: width,
                                              ),
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
                                        newSupplier = !newSupplier;
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
                                              "NEW SUPPLIER",
                                              style: GoogleFonts.poppins(
                                                  // color: white,
                                                  fontSize: width * 0.035,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: width * 0.2,
                                              ),
                                            ),
                                            Icon(newSupplier
                                                ? Icons.arrow_drop_down_sharp
                                                : Icons.arrow_drop_up_sharp)
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    newSupplier == true
                                        ? GetBuilder<HomeController>(
                                            builder: (obj) {
                                            return SizedBox(
                                              height: height,
                                              width: width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      width: width * 0.5,
                                                      child: TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          controller: name,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  // color:Colors.blue[900],
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              InputDecoration(
                                                            errorStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        20),
                                                            fillColor:
                                                                Colors.grey,
                                                            hintText:
                                                                "Supplier Name",
                                                            labelText:
                                                                "Enter Name",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    // color:Colors.blue[900],
                                                                    fontSize:
                                                                        width *
                                                                            0.025,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                            alignLabelWithHint:
                                                                true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color:
                                                                      lightgray
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
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color:
                                                                      lightgray
                                                                  // provider.brightness ==
                                                                  //         AppBrightness.dark
                                                                  //     ? AppTheme.colorWhite
                                                                  //   : AppTheme.colorPrimary,
                                                                  ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Required";
                                                            }
                                                          }),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.5,
                                                      child: TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          controller: email,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  // color:Colors.blue[900],
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              InputDecoration(
                                                            errorStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        20),
                                                            fillColor:
                                                                Colors.grey,
                                                            hintText:
                                                                "Supplier Email",
                                                            labelText:
                                                                "Enter Email",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    // color:Colors.blue[900],
                                                                    fontSize:
                                                                        width *
                                                                            0.025,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                            alignLabelWithHint:
                                                                true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color:
                                                                      lightgray
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
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color:
                                                                      lightgray
                                                                  // provider.brightness ==
                                                                  //         AppBrightness.dark
                                                                  //     ? AppTheme.colorWhite
                                                                  //   : AppTheme.colorPrimary,
                                                                  ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return 'Required';
                                                            }
                                                            if (!RegExp(
                                                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                                .hasMatch(
                                                                    value)) {
                                                              return "Please Enter Email";
                                                            }
                                                            return null;
                                                          }),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.5,
                                                      child: TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          inputFormatters: <TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          controller: number,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  // color:Colors.blue[900],
                                                                  fontSize:
                                                                      width *
                                                                          0.025,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                          decoration:
                                                              InputDecoration(
                                                            errorStyle:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        20),
                                                            fillColor:
                                                                Colors.grey,
                                                            hintText: "Number",
                                                            labelText: "Number",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    // color:Colors.blue[900],
                                                                    fontSize:
                                                                        width *
                                                                            0.025,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                            alignLabelWithHint:
                                                                true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: blue
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
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: blue
                                                                  // provider.brightness ==
                                                                  //         AppBrightness.dark
                                                                  //     ? AppTheme.colorWhite
                                                                  //   : AppTheme.colorPrimary,
                                                                  ),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Required";
                                                            }
                                                          }),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.06,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Type",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    color: blue,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Radio(
                                                                activeColor:
                                                                    blue,
                                                                value:
                                                                    obj.type[0],
                                                                groupValue:
                                                                    obj.select,
                                                                onChanged:
                                                                    (value) {
                                                                  obj.changeValue(
                                                                      value);
                                                                },
                                                              ),
                                                              Text(
                                                                "Individual",
                                                                style: GoogleFonts.poppins(
                                                                    color:
                                                                        lightgray,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Radio(
                                                                activeColor:
                                                                    blue,
                                                                value:
                                                                    obj.type[1],
                                                                groupValue:
                                                                    obj.select,
                                                                onChanged:
                                                                    (value) {
                                                                  obj.changeValue(
                                                                      value);
                                                                },
                                                              ),
                                                              Text(
                                                                "Company",
                                                                style: GoogleFonts.poppins(
                                                                    color:
                                                                        lightgray,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    obj.select == "Company"
                                                        ? SizedBox(
                                                            width: width * 0.5,
                                                            child:
                                                                TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              controller: regNo,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      // color:Colors.blue[900],
                                                                      fontSize:
                                                                          width *
                                                                              0.025,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              decoration:
                                                                  InputDecoration(
                                                                errorStyle:
                                                                    const TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            0,
                                                                        horizontal:
                                                                            20),
                                                                fillColor:
                                                                    Colors.grey,
                                                                hintText:
                                                                    "Company Reg",
                                                                labelText:
                                                                    "Reg",
                                                                hintStyle: GoogleFonts
                                                                    .poppins(
                                                                        // color:Colors.blue[900],
                                                                        fontSize:
                                                                            width *
                                                                                0.025,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                alignLabelWithHint:
                                                                    true,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color:
                                                                          blue
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
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color:
                                                                          blue
                                                                      // provider.brightness ==
                                                                      //         AppBrightness.dark
                                                                      //     ? AppTheme.colorWhite
                                                                      //   : AppTheme.colorPrimary,
                                                                      ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.red),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.red),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                    obj.select == "Company"
                                                        ? SizedBox(
                                                            height:
                                                                height * 0.01,
                                                          )
                                                        : const SizedBox(),
                                                    obj.select == "Company"
                                                        ? SizedBox(
                                                            width: width * 0.5,
                                                            child:
                                                                TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              controller:
                                                                  address,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                      // color:Colors.blue[900],
                                                                      fontSize:
                                                                          width *
                                                                              0.025,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              decoration:
                                                                  InputDecoration(
                                                                errorStyle: const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            0,
                                                                        horizontal:
                                                                            20),
                                                                fillColor:
                                                                    Colors.grey,
                                                                hintText:
                                                                    "Address",
                                                                labelText:
                                                                    "Address",
                                                                hintStyle: GoogleFonts
                                                                    .poppins(
                                                                        // color:Colors.blue[900],
                                                                        fontSize:
                                                                            width *
                                                                                0.025,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                alignLabelWithHint:
                                                                    true,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color:
                                                                          blue
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
                                                                          .circular(
                                                                              10),
                                                                  borderSide: BorderSide(
                                                                      color:
                                                                          blue
                                                                      // provider.brightness ==
                                                                      //         AppBrightness.dark
                                                                      //     ? AppTheme.colorWhite
                                                                      //   : AppTheme.colorPrimary,
                                                                      ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.red),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.red),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                    obj.select == "Company"
                                                        ? SizedBox(
                                                            height:
                                                                height * 0.01,
                                                          )
                                                        : const SizedBox(),
                                                    Card(
                                                      elevation: 5,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                      child: InkWell(
                                                        onTap: () {
                                                          if (formkey1
                                                              .currentState!
                                                              .validate()) {
                                                            if (supp) {
                                                              supp = false;
                                                              st(
                                                                () {},
                                                              );
                                                              Map<String,
                                                                  dynamic> map;
                                                              if (obj.select ==
                                                                  "Company") {
                                                                map = {
                                                                  "name":
                                                                      name.text,
                                                                  "email": email
                                                                      .text,
                                                                  "telePhone":
                                                                      number
                                                                          .text,
                                                                  "address":
                                                                      address
                                                                          .text,
                                                                  "companyReg":
                                                                      regNo
                                                                          .text,
                                                                  "isCompany":
                                                                      true,
                                                                };
                                                              } else {
                                                                map = {
                                                                  "name":
                                                                      name.text,
                                                                  "email": email
                                                                      .text,
                                                                  "telePhone":
                                                                      number
                                                                          .text,
                                                                  "address": "",
                                                                  "companyReg":
                                                                      "",
                                                                  "isCompany":
                                                                      false,
                                                                };
                                                              }

                                                              HomeController.to
                                                                  .addSupplierData(
                                                                map,
                                                              )
                                                                  .then(
                                                                      (value) {
                                                                name.clear();
                                                                regNo.clear();
                                                                email.clear();
                                                                number.clear();
                                                                address.clear();
                                                                // st(
                                                                //   () {
                                                                //     newSupplier =
                                                                //         false;
                                                                //   },
                                                                // );
                                                                Future.delayed(
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  supplierDialog(
                                                                          context,
                                                                          height,
                                                                          width)
                                                                      .then(
                                                                          (value) {
                                                                    Navigator.pop(
                                                                        context);
                                                                  });
                                                                });
                                                              });
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          height:
                                                              height * 0.045,
                                                          width: width * 0.45,
                                                          decoration: BoxDecoration(
                                                              color: blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                          child: Center(
                                                            child: Text(
                                                              "Add Supplier",
                                                              style: GoogleFonts.poppins(
                                                                  color: white,
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
                                              ),
                                            );
                                          })
                                        : const SizedBox(),
                                    SizedBox(
                                      height: height * 0.01,
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
            ),
          );
        });
      },
    );
  }

  postpurchase(BuildContext context) async {
    try {
      if (formatTime != "Purchase Date") {
        if (supplierName.isNotEmpty) {
          dio.FormData data = TransactionController.to.pathFile.isEmpty
              ? dio.FormData.fromMap({
                  "Name": "Purchase",
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
                  "PayBackDay": paybackTime,
                  "Currency": HomeController.to.curency,
                  "SupplierId": supplierid,
                  "SaleMethod": 1,
                })
              : dio.FormData.fromMap({
                  "Name": "Purchase",
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
                  "SupplierId": supplierid,
                  "SaleMethod": 1,
                  "File": await dio.MultipartFile.fromFile(
                    TransactionController.to.compressedFile!.path,
                    filename:
                        basename(TransactionController.to.compressedFile!.path),
                  ),
                });
          print(data.fields.toString());
          dio.Response res = await httpFormDataClient()
              .post(StaticValues.addPurchase, data: data);
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
          showtoast("Please Enter Purchase Method !");
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
    newSupplier = true;
    supplierName = "";
    supplierid = null;
    formatTime = "Purchase Date";
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

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      DateTime a = DateTime.now();
      formatTime = DateFormat("dd-MM-yyyy").format(selectedDate);
      var now = DateFormat("hh:mm a").format(a);
      print("time of now is ${now}");
      formatTime = formatTime + " ${time12to24Format(now)}";
      update();
    }
  }

  Future<void> selectPayBackDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      DateTime a = DateTime.now();
      paybackTime = DateFormat("dd-MM-yyyy").format(selectedDate);
      var now = DateFormat("hh:mm a").format(a);
      print("time of now is ${now}");
      paybackTime = paybackTime + " ${time12to24Format(now)}";
      creditReturnDate.text = paybackTime.substring(0, 10);
      update();
    }
  }

  String time12to24Format(String time) {
// var time = "12:01 AM";
    int h = int.parse(time.split(":").first);
    int m = int.parse(time.split(":").last.substring(0, 2));
    if (time.toLowerCase().contains("pm")) {
      if (h != 12) {
        h = h + 12;
      }
    }
    if (time.toLowerCase().contains("am")) {
      if (h == 12) {
        h = 00;
      }
    }
    String newTime = "${h == 0 ? "00" : h}:${m == 0 ? "00" : m}";
    print(newTime);

    return newTime;
  }
}
