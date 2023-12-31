import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/pdf/c/pdf_controller.dart';
import 'package:snabb_business/pdf/pdfs/supplier_report_pdf.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/color.dart';

class SuppliersScreen extends StatefulWidget {
  const SuppliersScreen({super.key});

  @override
  State<SuppliersScreen> createState() => _SuppliersScreenState();
}

class _SuppliersScreenState extends State<SuppliersScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController regNo = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();

  TextEditingController updatename = TextEditingController();
  TextEditingController updateemail = TextEditingController();
  TextEditingController updateregNo = TextEditingController();
  TextEditingController updatenumber = TextEditingController();
  TextEditingController updateaddress = TextEditingController();
  bool loading = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String fromDate = "Select Date";
  String toDate = "Select Date";

  Future _openDateRangePicker(
      BuildContext context, String id, var height, var width) async {
    fromDate = "Select Date";
    toDate = "Select Date";
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            "Select Date Range",
            style: GoogleFonts.poppins(
                color: blue,
                fontSize: width * 0.035,
                fontWeight: FontWeight.w600),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: height * 0.12,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "From",
                                  style: GoogleFonts.poppins(
                                      color: blue,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                    onTap: () {
                                      _selectDate(context, true, setState);
                                    },
                                    child: Container(
                                        height: height * 0.05,
                                        width: width * 0.25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.grey.withOpacity(0.5)),
                                        child: Text(
                                          fromDate,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500),
                                        ))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: height,
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "To",
                                  style: GoogleFonts.poppins(
                                      color: blue,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                    onTap: () {
                                      _selectDate(context, false, setState);
                                    },
                                    child: Container(
                                        height: height * 0.05,
                                        width: width * 0.25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.grey.withOpacity(0.5)),
                                        child: Text(
                                          toDate,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500),
                                        ))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                if (fromDate != "Select Date" && toDate != "Select Date") {
                  PdfController.to
                      .fetchsupplierReport(id, fromDate, toDate)
                      .then((value) {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupplierReportPDFScreen(
                              supplierReportList: value),
                        ));
                  });
                } else {
                  Fluttertoast.showToast(
                      msg: " Please Select Date !",
                      backgroundColor: Colors.blue[900],
                      textColor: Colors.white,
                      gravity: ToastGravity.BOTTOM,
                      fontSize: 17,
                      timeInSecForIosWeb: 1,
                      toastLength: Toast.LENGTH_LONG);
                }
              },
              child: Container(
                  height: height * 0.05,
                  width: width * 0.25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: blue, borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Generate',
                    style: GoogleFonts.poppins(
                        color: whitecolor,
                        fontSize: width * 0.032,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                    color: red,
                    fontSize: width * 0.032,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _selectDate(
      BuildContext context, bool isFrom, StateSetter setState) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = DateFormat("dd-MM-yyyy").format(picked);
        } else {
          toDate = DateFormat("dd-MM-yyyy").format(picked);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: blue,
          child: const Icon(Icons.add),
          onPressed: () {
            loading = true;
            showDialog(
              context: context,
              builder: (dc) {
                return GetBuilder<HomeController>(builder: (obj) {
                  return Form(
                    key: _formKey,
                    child: Dialog(
                      child: Container(
                        color: Colors.grey.shade300,
                        height: obj.select == "Company"
                            ? height * 0.8
                            : height * 0.7,
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
                              color: blue!.withOpacity(0.9),
                              alignment: Alignment.center,
                              child: Text(
                                "Add Supplier",
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
                                      height: obj.select == "Company"
                                          ? height * 0.7
                                          : height * 0.5,
                                      width: width * 0.7,
                                      color: white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              Text(
                                                "Information",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.black,
                                                    fontSize: width * 0.035,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: height * 0.04,
                                              ),
                                              SizedBox(
                                                width: width * 0.84,
                                                child: TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  controller: name,
                                                  style: GoogleFonts.poppins(
                                                      color: lightgray,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    errorStyle: const TextStyle(
                                                        color: Colors.red),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 0,
                                                            horizontal: 20),
                                                    fillColor: Colors.grey,
                                                    hintText: "Supplier Name",
                                                    labelText: "Supplier Name",
                                                    hintStyle:
                                                        GoogleFonts.poppins(
                                                            color: lightgray,
                                                            fontSize:
                                                                width * 0.03,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                    alignLabelWithHint: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                          BorderRadius.circular(
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
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.red),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmptyOrNull) {
                                                      return "Required";
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * 0.015,
                                              ),
                                              SizedBox(
                                                width: width * 0.84,
                                                child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller: email,
                                                    style: GoogleFonts.poppins(
                                                        color: lightgray,
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    decoration: InputDecoration(
                                                      errorStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.red),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 0,
                                                              horizontal: 20),
                                                      fillColor: Colors.grey,
                                                      hintText:
                                                          "Supplier Email",
                                                      labelText:
                                                          "Supplier Email",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      alignLabelWithHint: true,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                                .circular(10),
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
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (value!
                                                          .isEmptyOrNull) {
                                                        return "Required";
                                                      }
                                                    }),
                                              ),
                                              SizedBox(
                                                height: height * 0.015,
                                              ),
                                              SizedBox(
                                                width: width * 0.84,
                                                child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller: number,
                                                    style: GoogleFonts.poppins(
                                                        color: lightgray,
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    decoration: InputDecoration(
                                                      errorStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.red),
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 0,
                                                              horizontal: 20),
                                                      fillColor: Colors.grey,
                                                      hintText: "Number",
                                                      labelText: "Number",
                                                      hintStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      alignLabelWithHint: true,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                                .circular(10),
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
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (value!
                                                          .isEmptyOrNull) {
                                                        return "Required";
                                                      }
                                                    }),
                                              ),
                                              SizedBox(
                                                height: height * 0.015,
                                              ),
                                              SizedBox(
                                                height: height * 0.07,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Type",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: blue,
                                                              fontSize:
                                                                  width * 0.03,
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
                                                          activeColor: blue,
                                                          value: obj.type[0],
                                                          groupValue:
                                                              obj.select,
                                                          onChanged: (value) {
                                                            obj.changeValue(
                                                                value);
                                                          },
                                                        ),
                                                        Text(
                                                          "Individual",
                                                          style: GoogleFonts
                                                              .poppins(
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
                                                          activeColor: blue,
                                                          value: obj.type[1],
                                                          groupValue:
                                                              obj.select,
                                                          onChanged: (value) {
                                                            obj.changeValue(
                                                                value);
                                                          },
                                                        ),
                                                        Text(
                                                          "Company",
                                                          style: GoogleFonts
                                                              .poppins(
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
                                                height: height * 0.015,
                                              ),
                                              obj.select == "Company"
                                                  ? SizedBox(
                                                      width: width * 0.84,
                                                      child: TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          controller: regNo,
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
                                                                "Company Reg",
                                                            labelText: "Reg",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    color:
                                                                        lightgray,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
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
                                                                .isEmptyOrNull) {
                                                              return "Required";
                                                            }
                                                          }),
                                                    )
                                                  : const SizedBox(),
                                              obj.select == "Company"
                                                  ? SizedBox(
                                                      height: height * 0.015,
                                                    )
                                                  : const SizedBox(),
                                              obj.select == "Company"
                                                  ? SizedBox(
                                                      width: width * 0.84,
                                                      child: TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          controller: address,
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
                                                            hintText: "Address",
                                                            labelText:
                                                                "Address",
                                                            hintStyle: GoogleFonts
                                                                .poppins(
                                                                    color:
                                                                        lightgray,
                                                                    fontSize:
                                                                        width *
                                                                            0.03,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
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
                                                                .isEmptyOrNull) {
                                                              return "Required";
                                                            }
                                                          }),
                                                    )
                                                  : const SizedBox(),
                                              obj.select == "Company"
                                                  ? SizedBox(
                                                      height: height * 0.04,
                                                    )
                                                  : const SizedBox(),
                                              Card(
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                child: InkWell(
                                                  onTap: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      if (loading) {
                                                        Map<String, dynamic>
                                                            map;
                                                        if (obj.select ==
                                                            "Company") {
                                                          map = {
                                                            "name": name.text,
                                                            "email": email.text,
                                                            "telePhone":
                                                                number.text,
                                                            "address":
                                                                address.text,
                                                            "companyReg":
                                                                regNo.text,
                                                            "isCompany": true,
                                                          };
                                                        } else {
                                                          map = {
                                                            "name": name.text,
                                                            "email": email.text,
                                                            "telePhone":
                                                                number.text,
                                                            "address": "",
                                                            "companyReg": "",
                                                            "isCompany": false,
                                                          };
                                                        }

                                                        HomeController.to
                                                            .addSupplierData(
                                                                map)
                                                            .then((value) {
                                                          name.clear();
                                                          regNo.clear();
                                                          email.clear();
                                                          number.clear();
                                                          address.clear();
                                                          Navigator.pop(dc);
                                                        });
                                                      }
                                                      loading = false;
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Container(
                                                    height: height * 0.06,
                                                    width: width * 0.45,
                                                    decoration: BoxDecoration(
                                                        color: blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                    child: Center(
                                                      child: Text(
                                                        "Add Supplier",
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
                    ),
                  );
                });
              },
            );
          },
        ),
        body: Column(children: [
          AppBarWidgt(text: "Suppliers"),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.12,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/dollar.jpg"))),
                ),
                Container(
                  height: height * 0.12,
                  color: blue.withOpacity(0.9),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, left: width * 0.1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            "All Suppliers Information",
                            style: GoogleFonts.poppins(
                                color: white,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.08,
                  left: width * 0.05,
                  //bottom: height * 0.02,
                  child: Card(
                    elevation: 10,
                    shadowColor: blue,
                    child: GetBuilder<HomeController>(builder: (obj) {
                      return Container(
                        height: height * 0.75,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          color: white,
                        ),
                        child: ListView.builder(
                          itemCount: obj.supplierList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {},
                                child: Card(
                                  elevation: 10,
                                  shadowColor: blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: height * 0.15,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.02),
                                            child: const Icon(
                                                Icons.person_4_sharp),
                                          ),
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    obj.supplierList[index]
                                                        .name!,
                                                    style: GoogleFonts.poppins(
                                                        color: blue,
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    obj.supplierList[index]
                                                        .email!,
                                                    style: GoogleFonts.poppins(
                                                        color: lightgray,
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        obj.supplierList[index]
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
                                                                        .w500),
                                                      ),
                                                      Text(
                                                        obj.supplierList[index]
                                                            .companyReg!,
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
                                                    ],
                                                  ),
                                                  Text(
                                                    obj.supplierList[index]
                                                        .address!,
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
                                          SizedBox(
                                            width: width * 0.1,
                                          ),
                                          SizedBox(
                                            height: height,
                                            width: width * 0.1,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (dc) {
                                                          return AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            content: SizedBox(
                                                              height:
                                                                  height * 0.12,
                                                              width:
                                                                  width * 0.8,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .info_outline,
                                                                    color: Colors
                                                                        .red,
                                                                    size: width *
                                                                        0.12,
                                                                  ),
                                                                  Text(
                                                                    "Are You Sure You Want To Delete Supplier",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: GoogleFonts.poppins(
                                                                        color:
                                                                            lightgray,
                                                                        fontSize:
                                                                            width *
                                                                                0.03,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  "No",
                                                                  style: GoogleFonts.poppins(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.03,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  obj.deleteSupplierdata(
                                                                      obj
                                                                          .supplierList[
                                                                              index]
                                                                          .supplierId!,
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  "Yes",
                                                                  style: GoogleFonts.poppins(
                                                                      color:
                                                                          blue,
                                                                      fontSize:
                                                                          width *
                                                                              0.04,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: const Icon(
                                                        Icons.delete)),
                                                InkWell(
                                                    onTap: () {
                                                      updateaddress.text = obj
                                                          .supplierList[index]
                                                          .address!;
                                                      updateemail.text = obj
                                                          .supplierList[index]
                                                          .email!;
                                                      updatename.text = obj
                                                          .supplierList[index]
                                                          .name!;
                                                      updatenumber.text = obj
                                                          .supplierList[index]
                                                          .telePhone!;
                                                      updateregNo.text = obj
                                                          .supplierList[index]
                                                          .companyReg!;

                                                      showDialog(
                                                        context: context,
                                                        builder: (dc) {
                                                          return Dialog(
                                                            child: Container(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              height: obj
                                                                      .supplierList[
                                                                          index]
                                                                      .isCompany!
                                                                  ? height * 0.7
                                                                  : height *
                                                                      0.5,
                                                              width:
                                                                  width * 0.8,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        height *
                                                                            0.1,
                                                                    width:
                                                                        width,
                                                                    decoration: const BoxDecoration(
                                                                        image: DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image: AssetImage("images/dollar.jpg"))),
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        height *
                                                                            0.1,
                                                                    width:
                                                                        width,
                                                                    color: Colors
                                                                        .blue[
                                                                            900]!
                                                                        .withOpacity(
                                                                            0.9),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      "Update Supplier",
                                                                      style: GoogleFonts.poppins(
                                                                          color:
                                                                              white,
                                                                          fontSize: width *
                                                                              0.035,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: height *
                                                                            0.07),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Card(
                                                                        elevation:
                                                                            10,
                                                                        shadowColor:
                                                                            blue,
                                                                        child: Container(
                                                                            height: obj.supplierList[index].isCompany! ? height * 0.6 : height * 0.4,
                                                                            width: width * 0.7,
                                                                            color: white,
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: height * 0.02,
                                                                                    ),
                                                                                    Text(
                                                                                      "Update Information",
                                                                                      style: GoogleFonts.poppins(fontSize: width * 0.035, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: height * 0.04,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: width * 0.84,
                                                                                      child: TextFormField(
                                                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                        controller: updatename,
                                                                                        keyboardType: TextInputType.text,
                                                                                        style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                        decoration: InputDecoration(
                                                                                          errorStyle: const TextStyle(color: Colors.red),
                                                                                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                          fillColor: Colors.grey,
                                                                                          hintText: "Supplier Name",
                                                                                          labelText: "Enter Name",
                                                                                          hintStyle: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
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
                                                                                      height: height * 0.015,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: width * 0.84,
                                                                                      child: TextFormField(
                                                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                        controller: updateemail,
                                                                                        keyboardType: TextInputType.text,
                                                                                        style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                        decoration: InputDecoration(
                                                                                          errorStyle: const TextStyle(color: Colors.red),
                                                                                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                          fillColor: Colors.grey,
                                                                                          hintText: "Supplier Email",
                                                                                          labelText: "Enter Email",
                                                                                          hintStyle: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
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
                                                                                      height: height * 0.015,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: width * 0.84,
                                                                                      child: TextFormField(
                                                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                        controller: updatenumber,
                                                                                        keyboardType: TextInputType.text,
                                                                                        style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                        decoration: InputDecoration(
                                                                                          errorStyle: const TextStyle(color: Colors.red),
                                                                                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                          fillColor: Colors.grey,
                                                                                          hintText: "Number",
                                                                                          labelText: "Number",
                                                                                          hintStyle: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
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
                                                                                      height: height * 0.015,
                                                                                    ),
                                                                                    obj.supplierList[index].isCompany!
                                                                                        ? SizedBox(
                                                                                            width: width * 0.84,
                                                                                            child: TextFormField(
                                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                              controller: updateregNo,
                                                                                              style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                              keyboardType: TextInputType.text,
                                                                                              decoration: InputDecoration(
                                                                                                errorStyle: const TextStyle(color: Colors.red),
                                                                                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                                fillColor: Colors.grey,
                                                                                                hintText: "Company Reg",
                                                                                                labelText: "Reg",
                                                                                                hintStyle: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
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
                                                                                          )
                                                                                        : const SizedBox(),
                                                                                    SizedBox(
                                                                                      height: obj.supplierList[index].isCompany! ? height * 0.015 : 0,
                                                                                    ),
                                                                                    obj.supplierList[index].isCompany!
                                                                                        ? SizedBox(
                                                                                            width: width * 0.84,
                                                                                            child: TextFormField(
                                                                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                              controller: updateaddress,
                                                                                              keyboardType: TextInputType.text,
                                                                                              style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                              decoration: InputDecoration(
                                                                                                errorStyle: const TextStyle(color: Colors.red),
                                                                                                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                                fillColor: Colors.grey,
                                                                                                hintText: "Address",
                                                                                                labelText: "Address",
                                                                                                hintStyle: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
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
                                                                                          )
                                                                                        : const SizedBox(),
                                                                                    SizedBox(
                                                                                      height: obj.supplierList[index].isCompany! ? height * 0.04 : 0,
                                                                                    ),
                                                                                    Card(
                                                                                      elevation: 5,
                                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                                                                      child: InkWell(
                                                                                        onTap: () {
                                                                                          Map<String, dynamic> map = {
                                                                                            "name": updatename.text,
                                                                                            "email": updateemail.text,
                                                                                            "telePhone": updatenumber.text,
                                                                                            "address": updateaddress.text,
                                                                                            "companyReg": updateregNo.text,
                                                                                            "isCompany": false,
                                                                                          };

                                                                                          HomeController.to.updateSupplierdata(map, obj.supplierList[index].supplierId!, dc).then((value) {
                                                                                            updateaddress.clear();
                                                                                            updateemail.clear();
                                                                                            updatename.clear();
                                                                                            updatenumber.clear();
                                                                                            updateregNo.clear();
                                                                                          });
                                                                                        },
                                                                                        child: Container(
                                                                                          height: height * 0.06,
                                                                                          width: width * 0.45,
                                                                                          decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(7)),
                                                                                          child: Center(
                                                                                            child: Text(
                                                                                              "Update Supplier",
                                                                                              style: GoogleFonts.poppins(color: white, fontSize: width * 0.035, fontWeight: FontWeight.w600),
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
                                                    child:
                                                        const Icon(Icons.edit)),
                                                InkWell(
                                                    onTap: () {
                                                      _openDateRangePicker(
                                                          context,
                                                          HomeController
                                                              .to
                                                              .supplierList[
                                                                  index]
                                                              .supplierId!,
                                                          height,
                                                          width);
                                                    },
                                                    child: Icon(
                                                        Icons.picture_as_pdf))
                                              ],
                                            ),
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
                      );
                    }),
                  ),
                )
                // Positioned(
                //   top: height * 0.15,
                //   left: width * 0.05,
                //   //bottom: height * 0.02,
                //   child: Card(
                //     elevation: 10,
                //     shadowColor: blue,
                //     child: Container(
                //         height: height * 0.5,
                //         width: width * 0.9,
                //         decoration: BoxDecoration(
                //             color: white,
                //             boxShadow: const [
                //               BoxShadow(
                //                 color: Colors.blue,
                //                 spreadRadius: 2,
                //                 blurRadius: 10,
                //                 offset: Offset(1, 1),
                //               ),
                //             ],
                //             borderRadius: BorderRadius.only(
                //                 bottomLeft: Radius.circular(6),
                //                 bottomRight: Radius.circular(6))),

                //         //   },
                //         // ),

                //         ),
                //   ),
                // )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
