import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/utils/appbarwidget.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        key: _formKey,
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
                  return Dialog(
                    child: Container(
                      color: Colors.grey.shade300,
                      height:
                          obj.select == "Company" ? height * 0.8 : height * 0.7,
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
                                                  fontWeight: FontWeight.w600),
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
                                                      color: Colors.black),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "Supplier Name",
                                                  labelText: "Enter Name",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          color: lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                                ),
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
                                                  errorStyle: const TextStyle(
                                                      color: Colors.black),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "Supplier Email",
                                                  labelText: "Enter Email",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          color: lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                                ),
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
                                                controller: number,
                                                style: GoogleFonts.poppins(
                                                    color: lightgray,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.black),
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
                                                              FontWeight.w500),
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
                                                ),
                                              ),
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
                                                    style: GoogleFonts.poppins(
                                                        color: blue,
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Radio(
                                                        activeColor: blue,
                                                        value: obj.type[0],
                                                        groupValue: obj.select,
                                                        onChanged: (value) {
                                                          obj.changeValue(
                                                              value);
                                                        },
                                                      ),
                                                      Text(
                                                        "Individual",
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
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Radio(
                                                        activeColor: blue,
                                                        value: obj.type[1],
                                                        groupValue: obj.select,
                                                        onChanged: (value) {
                                                          obj.changeValue(
                                                              value);
                                                        },
                                                      ),
                                                      Text(
                                                        "Company",
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
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 0,
                                                                horizontal: 20),
                                                        fillColor: Colors.grey,
                                                        hintText: "Company Reg",
                                                        labelText: "Reg",
                                                        hintStyle:
                                                            GoogleFonts.poppins(
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
                                                      ),
                                                    ),
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
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          InputDecoration(
                                                        errorStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 0,
                                                                horizontal: 20),
                                                        fillColor: Colors.grey,
                                                        hintText: "Address",
                                                        labelText: "Address",
                                                        hintStyle:
                                                            GoogleFonts.poppins(
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
                                                      ),
                                                    ),
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
                                                      BorderRadius.circular(7)),
                                              child: InkWell(
                                                onTap: () {
                                                  if (loading) {
                                                    Map<String, dynamic> map;
                                                    if (obj.select ==
                                                        "Company") {
                                                      map = {
                                                        "name": name.text,
                                                        "email": email.text,
                                                        "telePhone":
                                                            number.text,
                                                        "address": address.text,
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
                                                        .addSupplierData(map)
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
                                                },
                                                child: Container(
                                                  height: height * 0.06,
                                                  width: width * 0.45,
                                                  decoration: BoxDecoration(
                                                      color: blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  child: Center(
                                                    child: Text(
                                                      "Add Supplier",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: white,
                                                              fontSize:
                                                                  width * 0.035,
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
                                                                        0.09,
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
                                                                  SizedBox(
                                                                    height:
                                                                        height *
                                                                            0.05,
                                                                    width:
                                                                        width,
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            obj.deleteSupplierdata(obj.supplierList[index].supplierId!,
                                                                                context);
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Yes",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: width * 0.04,
                                                                                color: blue),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width * 0.03,
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "No",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: width * 0.04,
                                                                                color: Colors.red),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
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
                                                                                          errorStyle: const TextStyle(color: Colors.black),
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
                                                                                          errorStyle: const TextStyle(color: Colors.black),
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
                                                                                          errorStyle: const TextStyle(color: Colors.black),
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
                                                                                                errorStyle: const TextStyle(color: Colors.black),
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
                                                                                                errorStyle: const TextStyle(color: Colors.black),
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
                                                        const Icon(Icons.edit))
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
