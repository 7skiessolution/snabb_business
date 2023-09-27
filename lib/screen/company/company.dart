import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/colors.dart';

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
          backgroundColor: Colors.blue[900],
          child: const Icon(Icons.add),
          onPressed: () {
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
                              "Add Company",
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
                                  width: width * 0.7,
                                  color: white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                          "Inofrmation",
                                          style: GoogleFonts.lexend(
                                              color: Colors.black,
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        SizedBox(
                                          width: width * 0.84,
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: mName,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Company Name",
                                              labelText: "Enter Name",
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
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
                                              focusedBorder: OutlineInputBorder(
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
                                        SizedBox(
                                          height: height * 0.015,
                                        ),
                                        SizedBox(
                                          width: width * 0.84,
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: mEmail,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Company Email",
                                              labelText: "Enter Email",
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
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
                                              focusedBorder: OutlineInputBorder(
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
                                        SizedBox(
                                          height: height * 0.015,
                                        ),
                                        SizedBox(
                                          width: width * 0.84,
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: nPhone,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Phone Number",
                                              labelText: "Phone Number",
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
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
                                              focusedBorder: OutlineInputBorder(
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
                                        SizedBox(
                                          height: height * 0.04,
                                        ),
                                        Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: InkWell(
                                            onTap: () {
                                              Map<String, dynamic> map = {
                                                "name": mName.text,
                                                "email": mEmail.text,
                                                "telePhone": nPhone.text,
                                              };
                                              print(map);
                                              HomeController.to
                                                  .addCompanyData(map, dc)
                                                  .then((value) {
                                                mName.clear();
                                                mEmail.clear();
                                                nPhone.clear();
                                              });
                                            },
                                            child: Container(
                                              height: height * 0.06,
                                              width: width * 0.45,
                                              decoration: BoxDecoration(
                                                  color: AppColors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Center(
                                                child: Text(
                                                  "Add Company",
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                  color: AppColors.blue.withOpacity(0.9),
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
                            style: GoogleFonts.adamina(
                                color: white,
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold),
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
                    shadowColor: Colors.blue[900],
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
                              child: InkWell(
                                onTap: () {},
                                child: Card(
                                  elevation: 10,
                                  shadowColor: Colors.blue[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    height: height * 0.12,
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    obj.companyList[index]
                                                        .name!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blue[900]),
                                                  ),
                                                  Text(
                                                    obj.companyList[index]
                                                        .email!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    obj.companyList[index]
                                                        .telePhone!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        color: Colors.black),
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
                                                                            30)),
                                                            content: SizedBox(
                                                              height:
                                                                  height * 0.17,
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
                                                                    "Are You Sure You Want To Delete Company",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            width *
                                                                                0.035),
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
                                                                            obj.deleteCompanydata(obj.companyList[index].companyId!,
                                                                                context);
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Yes",
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: width * 0.04,
                                                                                color: Colors.blue[900]),
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
                                                const Icon(Icons.edit)
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
                //     shadowColor: Colors.blue[900],
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
