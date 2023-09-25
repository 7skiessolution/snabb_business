import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/utils/colors.dart';

import '../../utils/color.dart';

class SuppliersScreen extends StatefulWidget {
  const SuppliersScreen({super.key});

  @override
  State<SuppliersScreen> createState() => _SuppliersScreenState();
}

class _SuppliersScreenState extends State<SuppliersScreen> {
  TextEditingController mEmail = TextEditingController();
TextEditingController mcompanyRg = TextEditingController();
  TextEditingController mName = TextEditingController();
  TextEditingController mAddress = TextEditingController();
  TextEditingController nPhone = TextEditingController();
  var indexNumber;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
            // mainAxisAlignment: M,
            children: [
              //AppBarWidgt(text: "no data"),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("images/dollar.jpg"))),
                    ),
                    Container(
                      height: height * 0.2,
                      color: AppColors.blue.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                "Supplier Information",
                                style: GoogleFonts.adamina(
                                    color: white,
                                    fontSize: 20,
                                    
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.15,
                      left: width * 0.05,
                      //bottom: height * 0.02,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: Container(
                            height: height * 0.7,
                            width: width * 0.9,
                            
                            decoration: BoxDecoration(
                              color: white,
                             boxShadow:const [
                BoxShadow(
                  color:  Colors.blue,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(1, 1),
                ),
              ],
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text(
                                    "New Supplier",
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: mName,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Supplier Name",
                                        labelText: "Supplier Name",
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
                                          borderSide:
                                              BorderSide(color: AppColors.blue
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
                                          AutovalidateMode.onUserInteraction,
                                      controller: mEmail,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Supplier Email",
                                        labelText: "Supplier Email",
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
                                          borderSide:
                                              BorderSide(color: AppColors.blue
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
                                          AutovalidateMode.onUserInteraction,
                                      controller: mcompanyRg,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Comany Reg",
                                        labelText: "Comany Reg",
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
                                          borderSide:
                                              BorderSide(color: AppColors.blue
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
                                          AutovalidateMode.onUserInteraction,
                                      controller: nPhone,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "TelePhone",
                                        labelText: "TelePhone",
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
                                          borderSide:
                                              BorderSide(color: AppColors.blue
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
                                          AutovalidateMode.onUserInteraction,
                                      controller: mAddress,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                        fillColor: Colors.grey,
                                        hintText: "Adress",
                                        labelText: "Adress",
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
                                          borderSide:
                                              BorderSide(color: AppColors.blue
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
                                 
                                  Center(
                                    child: SizedBox(
                                      width: width / 2,
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: InkWell(
                                          onTap: () {
                                            // _saveIncome();
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
                                    ),
                                  ),
                                ],
                              ),
                            )
                            // ListView.builder(
                            //   itemCount: list.length,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return InkWell(
                            //       onTap: () {
                            //         setState(() {
                            //           indexNumber = index;
                            //         });
                            //       },
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //               color:
                            //                   indexNumber == index ? darkblue : white,
                            //               borderRadius: BorderRadius.circular(11)),
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: Row(
                            //               mainAxisAlignment: MainAxisAlignment.start,
                            //               children: [
                            //                 Padding(
                            //                   padding:
                            //                       const EdgeInsets.only(left: 28.0),
                            //                   child: Icon(
                            //                     list[index].icon,
                            //                     size: 35,
                            //                     color: indexNumber == index
                            //                         ? white
                            //                         : Colors.black,
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   width: width * 0.1,
                            //                 ),
                            //                 Text(
                            //                   "${list[index].title}",
                            //                   style: TextStyle(
                            //                       fontSize: 18,
                            //                       color: indexNumber == index
                            //                           ? white
                            //                           : Colors.black),
                            //                 )
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // ),

                            ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
