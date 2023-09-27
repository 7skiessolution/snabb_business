// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:dio/dio.dart' as deo;

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
  File? compressedFile;
  XFile? pickImage;
  String pathFile = "";
  final picker = ImagePicker();
  List<String> categoriespath = [
    "assets/businessicons/business-travel.png",
    "assets/businessicons/entertainment.png",
    "assets/businessicons/business-travel.png",
    "assets/businessicons/furniture-fixture.png",
    "assets/businessicons/icons-01.png",
    "assets/businessicons/icons-02.png",
    "assets/businessicons/icons-03.png",
    "assets/businessicons/icons-04.png",
    "assets/businessicons/icons-05.png",
    "assets/businessicons/icons-06.png",
    "assets/businessicons/icons-07.png",
    "assets/businessicons/icons-08.png",
    "assets/businessicons/icons-12.png",
    "assets/businessicons/icons-14.png",
    "assets/businessicons/icons-15.png",
    "assets/businessicons/icons-16.png",
    "assets/businessicons/icons-17.png",
    "assets/businessicons/icons-18.png",
    "assets/businessicons/icons-19.png",
    "assets/businessicons/icons-20.png",
    "assets/businessicons/icons-21.png",
    "assets/businessicons/icons-22.png",
    "assets/businessicons/icons-23.png",
    "assets/businessicons/icons-24.png",
    "assets/businessicons/icons-25.png",
    "assets/businessicons/icons-26.png",
    "assets/businessicons/icons-27.png",
    "assets/businessicons/icons-29.png",
    "assets/businessicons/icons-31.png",
    "assets/businessicons/icons-34.png",
    "assets/businessicons/icons-35.png",
    "assets/businessicons/icons-36.png",
    "assets/businessicons/icons-37.png",
    "assets/businessicons/icons-38.png",
    "assets/businessicons/icons-39.png",
    "assets/businessicons/icons-41.png",
    "assets/businessicons/icons-42.png",
    "assets/businessicons/icons-44.png",
    "assets/businessicons/icons-47.png",
    "assets/businessicons/icons-48.png",
    "assets/businessicons/icons-49.png",
    "assets/businessicons/icons-50.png",
    "assets/businessicons/icons-51.png",
    "assets/businessicons/icons-52.png",
    "assets/businessicons/icons-53.png",
    "assets/businessicons/icons-54.png",
    "assets/businessicons/icons-56.png",
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
  Future addCatagory(context) async {
    print("image path ${pickImage!.path}");
    try {
      deo.FormData data = deo.FormData.fromMap({
        // "name": name.text,
        // "imageUrl": await deo.MultipartFile.fromFile(
        //   pickImage!.path,
        //   filename: basename(pickImage!.path),
        // ),
        "name": name.text,
        "imageUrl": pickImage != null && pickImage!.path != ""
            ? await deo.MultipartFile.fromFile(
                pickImage!.path,
                filename: basename(pickImage!.path),
              )
            : null,
      });
      log("fields ${data.fields}");
      var response =
          await httpFormDataClient().post(StaticValues.addCategory, data: data);
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        print("Response status Cose ${response.statusCode}");
        if (response.data != null) {
          print(".................${response.data}........");
        }
      }
      name.clear();
      pathFile = "";
      Navigator.pop(context);
      Navigator.pop(context);
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
  }

  Future<void> showPaidDilogue(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            color: Colors.grey.shade300,
            height: height * 0.4,
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
                        height: height * 0.35,
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
                                  // SizedBox(
                                  //   height: height * 0.08,
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceEvenly,
                                  //     children: [
                                  //       SizedBox(
                                  //         width: width * 0.11,
                                  //         height: height * 0.11,
                                  //         child: const Image(
                                  //             image: AssetImage(
                                  //                 "images/Group 247.jpeg")),
                                  //       ),
                                  //       Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           const Text(
                                  //             "Other",
                                  //             style: TextStyle(
                                  //               fontWeight: FontWeight.bold,
                                  //             ),
                                  //           ),
                                  //           SizedBox(
                                  //               height: height * 0.055,
                                  //               width: width * 0.5,
                                  //               child: TextFormField(
                                  //                 controller: otheramount,
                                  //                 decoration: InputDecoration(
                                  //                     border: InputBorder.none,
                                  //                     hintText: "Amount",
                                  //                     hintStyle: TextStyle(
                                  //                         fontWeight:
                                  //                             FontWeight.w500,
                                  //                         color: Colors.grey
                                  //                             .withOpacity(
                                  //                                 0.5)),
                                  //                     disabledBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     focusedBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     focusedErrorBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     enabledBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     errorBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     )),
                                  //                 keyboardType:
                                  //                     TextInputType.number,
                                  //               ))
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

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
                                              "Total Expense Amount",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: expenseAmount,
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

  Future<void> showCategoryDilogue(
      BuildContext context, double height, double width) {
    company = true;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, st) {
          return AlertDialog(
            content: Container(
              color: Colors.grey.shade300,
              height: height * 0.6,
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
                          top: height * 0.03, left: width * 0.2),
                      child: Text(
                        "Catagory",
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
                            height: height * 0.5,
                            width: width * 0.75,
                            color: white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        HomeController.to.catagorylist.length,
                                    itemBuilder: (context, index) {
                                      print(
                                          "catagory list ${HomeController.to.catagorylist.length}");
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: 100,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0)),
                                              Text(
                                                HomeController.to
                                                    .catagorylist[index].name!,
                                                style: TextStyle(
                                                    fontSize: width * 0.035,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (dc) {
                                        return AlertDialog(
                                          content: Container(
                                            color: Colors.grey.shade300,
                                            height: height * 0.65,
                                            width: width * 0.8,
                                            child: Form(
                                              key: _formKey,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                "images/dollar.jpg"))),
                                                  ),
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width,
                                                    color: Colors.blue[900]!
                                                        .withOpacity(0.9),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * 0.03,
                                                          left: width * 0.02),
                                                      child: Text(
                                                        "Add Catagory",
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
                                                    padding: EdgeInsets.only(
                                                        top: height * 0.07),
                                                    child: Center(
                                                      child: Card(
                                                        elevation: 10,
                                                        shadowColor:
                                                            Colors.blue[900],
                                                        child: Container(
                                                            height:
                                                                height * 0.55,
                                                            width: width * 0.7,
                                                            color: white,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
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
                                                                        width *
                                                                            0.84,
                                                                    child:
                                                                        TextFormField(
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      controller:
                                                                          name,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        errorStyle:
                                                                            const TextStyle(color: Colors.black),
                                                                        contentPadding: const EdgeInsets.symmetric(
                                                                            vertical:
                                                                                0,
                                                                            horizontal:
                                                                                20),
                                                                        fillColor:
                                                                            Colors.grey,
                                                                        hintText:
                                                                            "Catagory Name",
                                                                        labelText:
                                                                            "Catagory Name",
                                                                        alignLabelWithHint:
                                                                            true,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide: BorderSide(
                                                                              color: AppColors.blue
                                                                              //  provider.brightness ==
                                                                              //         AppBrightness.dark
                                                                              //     ? AppTheme.colorWhite
                                                                              //     : AppTheme.colorPrimary,
                                                                              ),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          borderSide: BorderSide(
                                                                              color: AppColors.blue
                                                                              // provider.brightness ==
                                                                              //         AppBrightness.dark
                                                                              //     ? AppTheme.colorWhite
                                                                              //   : AppTheme.colorPrimary,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                      child:
                                                                          SizedBox(
                                                                    child: GridView
                                                                        .builder(
                                                                      gridDelegate:
                                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            5,
                                                                      ),
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        bool
                                                                            isSelected =
                                                                            index ==
                                                                                selectedIndex;
                                                                        return InkWell(
                                                                          onTap:
                                                                              () {
                                                                            st(
                                                                              () {
                                                                                selectedIndex = index;
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              CircleAvatar(
                                                                            backgroundColor: isSelected
                                                                                ? Colors.grey
                                                                                : Colors.transparent,
                                                                            radius:
                                                                                width * 0.1,
                                                                            backgroundImage:
                                                                                AssetImage(categoriespath[index]),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  )),
                                                                  SizedBox(
                                                                    height:
                                                                        height *
                                                                            0.02,
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
                                                                          addCatagory(
                                                                              context);
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: height *
                                                                            0.06,
                                                                        width: width *
                                                                            0.45,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                AppColors.blue,
                                                                            borderRadius: BorderRadius.circular(7)),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "Add Catagory",
                                                                            style: TextStyle(
                                                                                fontSize: width * 0.03,
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold),
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
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: width * 0.055,
                                        ),
                                        onPressed: () => {},
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      Text(
                                        "ADD NEW",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
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
}
