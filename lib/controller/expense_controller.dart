// ignore_for_file: use_build_context_synchronously

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/screen/expense/expenseModel.dart' as em;
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:dio/dio.dart' as dio;

class ExpenseController extends GetxController {
  static ExpenseController get to => Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController bankamount = TextEditingController();
  TextEditingController cashamount = TextEditingController();
  TextEditingController otheramount = TextEditingController();
  TextEditingController expenseAmount = TextEditingController();
  TextEditingController particular = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool company = true;
  String selectedImagePath = "";
  em.Data? selectedCateory;
  String formatTime = "Expense Date";

  List<String> categoriespath = [
    "assets/businessicons/entertainment.png",
    "assets/businessicons/business-travel.png",
    "assets/businessicons/furniture-fixture.png",
    "assets/businessicons/icons01.png",
    "assets/businessicons/icons02.png",
    "assets/businessicons/icons03.png",
    "assets/businessicons/icons04.png",
    "assets/businessicons/icons05.png",
    "assets/businessicons/icons06.png",
    "assets/businessicons/icons07.png",
    "assets/businessicons/icons08.png",
    "assets/businessicons/icons12.png",
    "assets/businessicons/icons14.png",
    "assets/businessicons/icons15.png",
    "assets/businessicons/icons16.png",
    "assets/businessicons/icons18.png",
    "assets/businessicons/icons19.png",
    "assets/businessicons/icons20.png",
    "assets/businessicons/icons21.png",
    "assets/businessicons/icons22.png",
    // "assets/businessicons/icons23.png",
    "assets/businessicons/icons24.png",
    "assets/businessicons/icons25.png",
    "assets/businessicons/icons26.png",
    "assets/businessicons/icons27.png",
    "assets/businessicons/icons29.png",
    "assets/businessicons/icons31.png",
    "assets/businessicons/icons34.png",
    "assets/businessicons/icons35.png",
    "assets/businessicons/icons36.png",
    "assets/businessicons/icons37.png",
    "assets/businessicons/icons38.png",
    "assets/businessicons/icons39.png",
    "assets/businessicons/icons41.png",
    "assets/businessicons/icons42.png",
    "assets/businessicons/icons44.png",
    "assets/businessicons/icons47.png",
    "assets/businessicons/icons48.png",
    "assets/businessicons/icons49.png",
    "assets/businessicons/icons50.png",
    "assets/businessicons/icons51.png",
    "assets/businessicons/icons52.png",
    "assets/businessicons/icons53.png",
    "assets/businessicons/icons54.png",
    "assets/businessicons/icons56.png",
    "assets/businessicons/legal-expenses.png",
    "assets/businessicons/marketing-advertisement.png",
    "assets/businessicons/miscellaneous.png",
    "assets/businessicons/mobile-internet.png",
    "assets/businessicons/office-supplies.png",
    "assets/businessicons/rent.png",
    "assets/businessicons/repair.png",
    "assets/businessicons/reserch-development.png",
    "assets/businessicons/salary-benifits.png",
    "assets/businessicons/stamp-postage.png",
    "assets/businessicons/taxes.png",
    "assets/businessicons/utils.png",
  ];
  int selectedIndex = -1;
  List<em.Data> catagorylist = [];
  bool isLoadData = false;

  Future getCatageries() async {
    catagorylist.clear();
    em.CatagoryModel? catagoryModel;
    isLoadData = true;
    var res = await httpClient().get(StaticValues.getCategories);

    catagoryModel = em.CatagoryModel.fromMap(res.data);

    if (catagoryModel.data != null) {
      for (var catagory in catagoryModel.data!) {
        catagorylist.add(catagory);
      }

      isLoadData = false;
      update();
    } else {}
  }

  Future addCatagory(context) async {
    Map<String, dynamic> map = {
      "name": name.text,
      "imageUrl": selectedImagePath,
    };
    var response = await httpClient().post(StaticValues.addCategory, data: map);
    if (response.statusCode == 200) {
      print("Response status Cose ${response.statusCode}");
      if (response.data != null) {
        print(".................${response.data}........");
        getCatageries();
      }
    }
    name.clear();
    selectedImagePath = "";
    Navigator.pop(context);
    return response.data;
  }

  Future<void> showPaidDilogue(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            color: Colors.grey.shade300,
            height: height * 0.5,
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
                  color: expensecolor.withOpacity(0.9),
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
                      shadowColor: Colors.blue[900],
                      child: Container(
                        height: height * 0.45,
                        width: width * 0.7,
                        color: white,
                        child: Center(
                          child: SingleChildScrollView(
                            primary: true,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                              "Total Expense".toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                                height: height * 0.045,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: expenseAmount,
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
                                            color: expensecolor,
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

  clearData() {
    selectedCateory = null;
    selectedImagePath = "";
    update();
  }

  updateSelectedCategory(em.Data? obj) {
    selectedCateory = obj;
    update();
  }

  Future<void> showCategoryDilogue(
      BuildContext context, double height, double width) {
    company = true;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, st) {
          return Dialog(
            child: Container(
              color: Colors.grey.shade300,
              height: height * 0.8,
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
                    color: expensecolor.withOpacity(0.9),
                    alignment: Alignment.center,
                    child: Text(
                      "Select Category",
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
                            height: height * 0.75,
                            width: width * 0.75,
                            color: white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GetBuilder<ExpenseController>(builder: (obj) {
                                  return Expanded(
                                    child: ListView.builder(
                                      itemCount: obj.catagorylist.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              updateSelectedCategory(
                                                  obj.catagorylist[index]);
                                              Navigator.pop(context);
                                            },
                                            child: SizedBox(
                                              height: height * 0.04,
                                              width: 100,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: height * 0.05,
                                                    width: width * 0.1,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: AssetImage(obj
                                                                .catagorylist[
                                                                    index]
                                                                .imageUrl!))),
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0)),
                                                  Text(
                                                    obj.catagorylist[index]
                                                        .name!,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (dc) {
                                        return StatefulBuilder(
                                            builder: (context, st1) {
                                          return Dialog(
                                            child: Container(
                                              color: Colors.grey.shade300,
                                              height: height * 0.8,
                                              width: width * 0.8,
                                              child: Form(
                                                key: _formKey,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: height * 0.1,
                                                      width: width,
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  "images/dollar.jpg"))),
                                                    ),
                                                    Container(
                                                      height: height * 0.1,
                                                      width: width,
                                                      color:expensecolor
                                                          .withOpacity(0.9),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Add Category",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: white,
                                                                fontSize:
                                                                    width *
                                                                        0.035,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * 0.07),
                                                      child: Center(
                                                        child: Card(
                                                          elevation: 10,
                                                          shadowColor:
                                                              expensecolor,
                                                          child: Container(
                                                              height:
                                                                  height * 0.75,
                                                              width:
                                                                  width * 0.7,
                                                              color: white,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.02,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          width,
                                                                      height: height *
                                                                          0.045,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                height * 0.05,
                                                                            width:
                                                                                width * 0.1,
                                                                            decoration: selectedImagePath == ""
                                                                                ? BoxDecoration(shape: BoxShape.circle, color: expensecolor)
                                                                                : BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(selectedImagePath))),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.01,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                SizedBox(
                                                                              width: width * 0.84,
                                                                              child: TextFormField(
                                                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                controller: name,
                                                                                style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.025, fontWeight: FontWeight.w400),
                                                                                keyboardType: TextInputType.text,
                                                                                decoration: InputDecoration(
                                                                                  errorStyle: const TextStyle(color: Colors.black),
                                                                                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                  fillColor: Colors.grey,
                                                                                  hintText: "Category Name",
                                                                                  labelText: "Category Name",
                                                                                  hintStyle: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.025, fontWeight: FontWeight.w400),
                                                                                  alignLabelWithHint: true,
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                    borderSide: BorderSide(color: blue),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                    borderSide: BorderSide(color: blue),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.05,
                                                                    ),
                                                                    Expanded(
                                                                        child:
                                                                            SizedBox(
                                                                      child: GridView
                                                                          .builder(
                                                                        itemCount:
                                                                            categoriespath.length,
                                                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                                            crossAxisCount:
                                                                                6,
                                                                            mainAxisSpacing:
                                                                                20,
                                                                            crossAxisSpacing:
                                                                                15),
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          // bool
                                                                          //     isSelected =
                                                                          //     index == selectedIndex;
                                                                          return InkWell(
                                                                            onTap:
                                                                                () {
                                                                              selectedImagePath = categoriespath[index];

                                                                              st1(
                                                                                () {},
                                                                              );
                                                                            },
                                                                            child:
                                                                                CircleAvatar(
                                                                              backgroundColor: Colors.transparent,
                                                                              radius: width * 0.04,
                                                                              backgroundImage: AssetImage(categoriespath[index]),
                                                                              // foregroundColor: isSelected
                                                                              //     ? Colors.blue
                                                                              //     : Colors.transparent,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    )),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.01,
                                                                    ),
                                                                    Card(
                                                                      elevation:
                                                                          5,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(7)),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          if (_formKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                            addCatagory(dc);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              height * 0.05,
                                                                          width:
                                                                              width * 0.45,
                                                                          decoration: BoxDecoration(
                                                                              color: expensecolor,
                                                                              borderRadius: BorderRadius.circular(7)),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Add Category",
                                                                              style: GoogleFonts.poppins(color: white, fontSize: width * 0.035, fontWeight: FontWeight.w600),
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
                                            ),
                                          );
                                        });
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          color: expensecolor,
                                          size: width * 0.055,
                                        ),
                                        onPressed: () => {},
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      Text(
                                        "ADD NEW",
                                        style: GoogleFonts.poppins(
                                            color: expensecolor,
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
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
      DateTime a= DateTime.now();
      formatTime = DateFormat("dd-MM-yyyy").format(selectedDate);
    var now = DateFormat("hh:mm a").format(a);
      print("time of now is ${now}");
      formatTime =formatTime+" ${time12to24Format(now)}";
      update();
    }
  }
  String time12to24Format(String time) {
// var time = "12:01 AM";
 int h = int.parse(time.split(":").first);
 int m = int.parse(time.split(":").last.substring(0,2));
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
 
  postexpense(BuildContext context) async {
    try {
      if (formatTime != "Expense Date") {
        if (selectedCateory != null) {
          dio.FormData data = TransactionController.to.pathFile.isEmpty
              ? dio.FormData.fromMap({
                  "Name": "Expense",
                  "CashAmount": double.tryParse(cashamount.text) ?? 0.0,
                  "BankAmount": double.tryParse(bankamount.text) ?? 0.0,
                  "OtherAmount": double.tryParse(otheramount.text) ?? 0.0,
                  "TotalAmount": double.tryParse(expenseAmount.text) ?? 0.0,
                  "Note": particular.text,
                  "DateTime": formatTime,
                  "Currency": HomeController.to.curency,
                  "CategoryId": selectedCateory!.categoryId,
                })
              : dio.FormData.fromMap({
                  "Name": "Expense",
                  "CashAmount": double.tryParse(cashamount.text) ?? 0.0,
                  "BankAmount": double.tryParse(bankamount.text) ?? 0.0,
                  "OtherAmount": double.tryParse(otheramount.text) ?? 0.0,
                  "TotalAmount": double.tryParse(expenseAmount.text) ?? 0.0,
                  "Note": particular.text,
                  "DateTime": formatTime,
                  "Currency": HomeController.to.curency,
                  "CategoryId": selectedCateory!.categoryId,
                  "File": await dio.MultipartFile.fromFile(
                    TransactionController.to.compressedFile!.path,
                    filename:
                        basename(TransactionController.to.compressedFile!.path),
                  ),
                });
          print(data.fields.toString());
          dio.Response res = await httpFormDataClient()
              .post(StaticValues.addExpence, data: data);
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
          showtoast("Please Select Category !");
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
    expenseAmount.clear();
    particular.clear();
    company = true;
    selectedCateory = null;
    formatTime = "Pick Date";
    update();
  }
}
