import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/colors.dart';

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
                    height: height * 0.7,
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
                              "Add Supplier",
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
                                            controller: name,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Supplier Name",
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
                                            controller: email,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Supplier Email",
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
                                            controller: regNo,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Company Reg",
                                              labelText: "Reg",
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
                                            controller: number,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Number",
                                              labelText: "Number",
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
                                            controller: address,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText: "Address",
                                              labelText: "Address",
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
                                                "name": name.text,
                                                "email": email.text,
                                                "telePhone": number.text,
                                                "address": address.text,
                                                "companyReg": regNo.text,
                                                "isCompany": false,
                                              };

                                              HomeController.to
                                                  .addSupplierData(map, dc)
                                                  .then((value) {
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
                                              decoration: BoxDecoration(
                                                  color: AppColors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Center(
                                                child: Text(
                                                  "Add Supplier",
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
                            "All Suppliers Information",
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
                          itemCount: obj.supplierList.length,
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
                                                    obj.supplierList[index]
                                                        .name!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blue[900]),
                                                  ),
                                                  Text(
                                                    obj.supplierList[index]
                                                        .email!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    obj.supplierList[index]
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
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.delete),
                                                Icon(Icons.edit)
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
