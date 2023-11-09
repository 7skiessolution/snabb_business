import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/utils/appbarwidget.dart';

import '../../utils/color.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  TextEditingController mEmail = TextEditingController();
  TextEditingController mName = TextEditingController();
  TextEditingController nPhone = TextEditingController();

  TextEditingController updateEmail = TextEditingController();
  TextEditingController updateName = TextEditingController();
  TextEditingController updatePhone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = true;
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
                return Form(
                  key: _formKey,
                  child: Dialog(
                    child: Container(
                      color: Colors.grey.shade300,
                      height: height * 0.55,
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
                              "Add Company",
                              style: GoogleFonts.poppins(
                                  color: white,
                                  fontSize: width * 0.03,
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
                                    height: height * 0.45,
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
                                                  color: blackcolor,
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
                                                  controller: mName,
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
                                                    hintText: "Company Name",
                                                    labelText: "Enter Name",
                                                    labelStyle:
                                                        GoogleFonts.poppins(
                                                            //color:lightgray,
                                                            fontSize:
                                                                width * 0.03,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
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
                                                    if (value!.isEmpty) {
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
                                                  controller: mEmail,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style: GoogleFonts.poppins(
                                                      color: lightgray,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  decoration: InputDecoration(
                                                    errorStyle: const TextStyle(
                                                        color: Colors.red),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 0,
                                                            horizontal: 20),
                                                    fillColor: Colors.grey,
                                                    hintText: "Company Email",
                                                    labelText: "Enter Email",
                                                    labelStyle:
                                                        GoogleFonts.poppins(
                                                            //color:lightgray,
                                                            fontSize:
                                                                width * 0.03,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
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
                                                          // provider.brightness ==5
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
                                                    if (value!.isEmpty) {
                                                      return 'Required';
                                                    }
                                                    if (!RegExp(
                                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                                        .hasMatch(value)) {
                                                      return "Please Enter Email";
                                                    }
                                                    return null;
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
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  controller: nPhone,
                                                  style: GoogleFonts.poppins(
                                                      color: lightgray,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  decoration: InputDecoration(
                                                    errorStyle: const TextStyle(
                                                        color: Colors.red),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 0,
                                                            horizontal: 20),
                                                    fillColor: Colors.grey,
                                                    hintText: "Phone Number",
                                                    labelText: "Phone Number",
                                                    labelStyle:
                                                        GoogleFonts.poppins(
                                                            //color:lightgray,
                                                            fontSize:
                                                                width * 0.03,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
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
                                                    if (value!.isEmpty) {
                                                      return "Required";
                                                    }
                                                  }),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Card(
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: InkWell(
                                                onTap: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    if (loading) {
                                                      Map<String, dynamic> map =
                                                          {
                                                        "name": mName.text,
                                                        "email": mEmail.text,
                                                        "telePhone":
                                                            nPhone.text,
                                                      };
                                                      print(map);
                                                      HomeController.to
                                                          .addCompanyData(
                                                              map, dc, "new")
                                                          .then((value) {
                                                        mName.clear();
                                                        mEmail.clear();
                                                        nPhone.clear();
                                                      });
                                                    }
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
                                                      "Add Company",
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
                  ),
                );
              },
            );
          },
        ),
        body: Column(children: [
          AppBarWidgt(text: "Companies"),
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
                            "All Company Information",
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
                          itemCount: obj.companyList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 10,
                                shadowColor: blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  height: height * 0.12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
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
                                              Icons.home_work_outlined),
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
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  obj.companyList[index].name!,
                                                  style: GoogleFonts.poppins(
                                                      color: blue,
                                                      fontSize: width * 0.035,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  obj.companyList[index].email!,
                                                  style: GoogleFonts.poppins(
                                                      color: lightgray,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  obj.companyList[index]
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
                                                            width: width * 0.8,
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
                                                                  "Are You Sure You Want To Delete Company",
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
                                                                          FontWeight
                                                                              .w500),
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
                                                              width:
                                                                  width * 0.03,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                HomeController
                                                                    .to
                                                                    .deleteCompanydata(
                                                                        obj.companyList[index]
                                                                            .companyId!,
                                                                        context);
                                                              },
                                                              child: Text(
                                                                "Yes",
                                                                style: GoogleFonts.poppins(
                                                                    color: blue,
                                                                    fontSize:
                                                                        width *
                                                                            0.04,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.02,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );

                                                    // showDialog(
                                                    //   context: context,
                                                    //   builder: (dc) {
                                                    //     return AlertDialog(
                                                    //       shape: RoundedRectangleBorder(
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       10)),
                                                    //       content: SizedBox(
                                                    //         height:
                                                    //             height * 0.13,
                                                    //         width: width * 0.8,
                                                    //         child: Column(
                                                    //           mainAxisAlignment:
                                                    //               MainAxisAlignment
                                                    //                   .spaceEvenly,
                                                    //           children: [
                                                    //             Icon(
                                                    //               Icons
                                                    //                   .info_outline,
                                                    //               color: Colors
                                                    //                   .red,
                                                    //               size: width *
                                                    //                   0.15,
                                                    //             ),
                                                    //             Text(

                                                    //               textAlign:
                                                    //                   TextAlign
                                                    //                       .center,
                                                    //               style: GoogleFonts.poppins(
                                                    //                   color:
                                                    //                       lightgray,
                                                    //                   fontSize:
                                                    //                       width *
                                                    //                           0.03,
                                                    //                   fontWeight:
                                                    //                       FontWeight
                                                    //                           .w500),
                                                    //             ),
                                                    //           ],
                                                    //         ),
                                                    //       ),
                                                    //       actions: [
                                                    //         TextButton(
                                                    //           onPressed: () {
                                                    //             Navigator.pop(
                                                    //                 context);
                                                    //           },
                                                    //           child: Container(
                                                    //             width: width *
                                                    //                 0.15,
                                                    //             height: height *
                                                    //                 0.05,
                                                    //             decoration: BoxDecoration(
                                                    //                 color: red,
                                                    //                 borderRadius:
                                                    //                     BorderRadius.circular(
                                                    //                         10)),
                                                    //             alignment:
                                                    //                 Alignment
                                                    //                     .center,
                                                    //             child: Text(
                                                    //               "No",
                                                    //               style:
                                                    //                   TextStyle(
                                                    //                 color: Colors
                                                    //                     .white,
                                                    //               ),
                                                    //             ),
                                                    //           ),
                                                    //         ),
                                                    //         TextButton(
                                                    //           onPressed: () {
                                                    //             HomeController
                                                    //                 .to
                                                    //                 .deleteCompanydata(
                                                    //                     obj.companyList[index]
                                                    //                         .companyId!,
                                                    //                     context);
                                                    //           },
                                                    //           child: Container(
                                                    //               width: width *
                                                    //                   0.15,
                                                    //               height:
                                                    //                   height *
                                                    //                       0.05,
                                                    //               decoration: BoxDecoration(
                                                    //                   color:
                                                    //                       blue,
                                                    //                   borderRadius:
                                                    //                       BorderRadius.circular(
                                                    //                           10)),
                                                    //               alignment:
                                                    //                   Alignment
                                                    //                       .center,
                                                    //               child:
                                                    //                   const Text(
                                                    //                 "Yes",
                                                    //                 style:
                                                    //                     TextStyle(
                                                    //                   color: Colors
                                                    //                       .white,
                                                    //                 ),
                                                    //               )),
                                                    //         ),
                                                    //       ],
                                                    //     );
                                                    //   },
                                                    // );
                                                  },
                                                  child:
                                                      const Icon(Icons.delete)),
                                              InkWell(
                                                  onTap: () {
                                                    updateEmail.text = obj
                                                        .companyList[index]
                                                        .email!;
                                                    updateName.text = obj
                                                        .companyList[index]
                                                        .name!;
                                                    updatePhone.text = obj
                                                        .companyList[index]
                                                        .telePhone!;
                                                    showDialog(
                                                      context: context,
                                                      builder: (dc) {
                                                        return Dialog(
                                                          child: Container(
                                                            color: Colors
                                                                .grey.shade300,
                                                            height:
                                                                height * 0.55,
                                                            width: width * 0.8,
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      height *
                                                                          0.1,
                                                                  width: width,
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              AssetImage("images/dollar.jpg"))),
                                                                ),
                                                                Container(
                                                                  height:
                                                                      height *
                                                                          0.1,
                                                                  width: width,
                                                                  color: blue
                                                                      .withOpacity(
                                                                          0.9),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    "Update Company",
                                                                    style: GoogleFonts.poppins(
                                                                        color:
                                                                            white,
                                                                        fontSize:
                                                                            width *
                                                                                0.035,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: height *
                                                                          0.07),
                                                                  child: Center(
                                                                    child: Card(
                                                                      elevation:
                                                                          10,
                                                                      shadowColor:
                                                                          Colors
                                                                              .blue[900],
                                                                      child: Container(
                                                                          height: height * 0.5,
                                                                          width: width * 0.7,
                                                                          color: white,
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: height * 0.02,
                                                                                ),
                                                                                Text(
                                                                                  "Update Information",
                                                                                  style: GoogleFonts.poppins(color: Colors.black, fontSize: width * 0.035, fontWeight: FontWeight.w600),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: height * 0.04,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: width * 0.84,
                                                                                  child: TextFormField(
                                                                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                    controller: updateName,
                                                                                    keyboardType: TextInputType.text,
                                                                                    style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                    decoration: InputDecoration(
                                                                                      errorStyle: const TextStyle(color: Colors.black),
                                                                                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                      fillColor: Colors.grey,
                                                                                      hintText: "Company Name",
                                                                                      labelText: "Enter Name",
                                                                                      labelStyle: GoogleFonts.poppins(
                                                                                          //color:lightgray,
                                                                                          fontSize: width * 0.03,
                                                                                          fontWeight: FontWeight.w500),
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
                                                                                    controller: updateEmail,
                                                                                    keyboardType: TextInputType.text,
                                                                                    style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                    decoration: InputDecoration(
                                                                                      errorStyle: const TextStyle(color: Colors.black),
                                                                                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                      fillColor: Colors.grey,
                                                                                      hintText: "Company Email",
                                                                                      labelText: "Enter Email",
                                                                                      labelStyle: GoogleFonts.poppins(
                                                                                          //color:lightgray,
                                                                                          fontSize: width * 0.03,
                                                                                          fontWeight: FontWeight.w500),
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
                                                                                    controller: updatePhone,
                                                                                    keyboardType: TextInputType.text,
                                                                                    style: GoogleFonts.poppins(color: lightgray, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                                                                                    decoration: InputDecoration(
                                                                                      errorStyle: const TextStyle(color: Colors.black),
                                                                                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                                                                      fillColor: Colors.grey,
                                                                                      hintText: "Phone Number",
                                                                                      labelText: "Phone Number",
                                                                                      labelStyle: GoogleFonts.poppins(
                                                                                          //color:lightgray,
                                                                                          fontSize: width * 0.03,
                                                                                          fontWeight: FontWeight.w500),
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
                                                                                  height: height * 0.02,
                                                                                ),
                                                                                Card(
                                                                                  elevation: 5,
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                                                                  child: InkWell(
                                                                                    onTap: () {
                                                                                      Map<String, dynamic> map = {
                                                                                        "name": updateName.text,
                                                                                        "email": updateEmail.text,
                                                                                        "telePhone": updatePhone.text,
                                                                                      };
                                                                                      print(map);
                                                                                      HomeController.to.updateCompanydata(map, obj.companyList[index].companyId!, dc).then((value) {
                                                                                        updateEmail.clear();
                                                                                        updateName.clear();
                                                                                        updatePhone.clear();
                                                                                      });
                                                                                    },
                                                                                    child: Container(
                                                                                      height: height * 0.06,
                                                                                      width: width * 0.45,
                                                                                      decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(7)),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          "Update Company",
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
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: const Icon(Icons.edit))
                                            ],
                                          ),
                                        ),
                                      ],
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
