import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/pdf/c/pdf_controller.dart';
import 'package:snabb_business/pdf/pdfs/company_sale_pdf.dart';
import 'package:snabb_business/pdf/pdfs/daily_sale_report.dart';
import 'package:snabb_business/pdf/pdfs/expense_report_pdf.dart';
import 'package:snabb_business/pdf/pdfs/purchase_report_pdf.dart';
import 'package:snabb_business/pdf/pdfs/report_selection_page.dart';
import 'package:snabb_business/pdf/pdfs/supplier_report_pdf.dart';
import 'package:snabb_business/screen/auth/loginScreen.dart';
import 'package:snabb_business/screen/company/company.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/screen/debit/deptsscreen.dart';
import 'package:snabb_business/screen/drawerscreen/Calender.dart';
import 'package:snabb_business/screen/drawerscreen/settings.dart';
import 'package:snabb_business/screen/drawerscreen/userProfile.dart';
import 'package:snabb_business/screen/summary/summary_screen.dart';
import 'package:snabb_business/screen/suppliers/suppliers.dart';
import 'package:snabb_business/screen/transactions/transactionScreen.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import '../screen/drawerscreen/Preferences.dart';
import '../screen/invoice/invoice.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(initState: (state) {
      Get.put(HomeController());
      Get.put(PdfController());
    }, builder: (obj) {
      return Column(children: [
        SizedBox(
          height: height * 0.1,
          width: width,
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/dollar.jpg"))),
              ),
              Container(
                color: blue.withOpacity(0.9),
                height: height,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: obj.userImage == ""
                          ? const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white)
                          : BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${StaticValues.imageUrl}${obj.userImage}")),
                              shape: BoxShape.circle,
                              color: Colors.white),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      // "Name",
                      obj.userName.toUpperCase(),
                      style: GoogleFonts.poppins(
                          color: white,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          color: darkblue,
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SummeryScreen()));
                  obj.drawermenueclose();
                  // obj.drawermenueclose();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const DashBoardScreen()));
                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/dashard.png"),
                  title: Text(
                    "OverView",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CompanyScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.people_outline_sharp,
                    color: white.withOpacity(0.7),
                  ),
                  title: Text(
                    "Companies",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SuppliersScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.theater_comedy_sharp,
                    color: white.withOpacity(0.7),
                  ),
                  title: Text(
                    "Supplier",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (_) => SummeryScreen()));
              //     obj.drawermenueclose();
              //   },
              //   child: ListTile(
              //     leading: Image.asset("assets/drawericon/summary.png"),
              //     title: Text(
              //       "Summary",
              //       style: GoogleFonts.poppins(
              //           color: white,
              //           fontSize: width * 0.03,
              //           fontWeight: FontWeight.w400),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TransactionScreen()));
                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/transaction.png"),
                  title: Text(
                    "Transaction",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  obj.drawermenueclose();

                  Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DebitScreen()));

                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/debit.png"),
                  title: Text(
                    "Debit/Credit",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.wysiwyg_outlined,
                    color: white.withOpacity(0.7),
                  ),
                  title: Text(
                    "Invoice",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (_) => const Categories()));
              //   },
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.donut_large,
              //       color: white,
              //     ),
              //     title: Text(
              //       "Charts",
              //       style: TextStyle(
              //           color: white,
              //           fontSize: width * 0.03,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
              // obj.category == true
              //     ? InkWell(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (_) => const Categories()));
              //         },
              //         child: SizedBox(
              //           height: height * 0.05,
              //           width: width,
              //           //  alignment: Alignment.center,
              //           child: Padding(
              //             padding: EdgeInsets.only(right: width * 0.1),
              //             child: Row(
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   SizedBox(
              //                       height: height * 0.1,
              //                       width: width * 0.1,
              //                       child: Image.asset(
              //                         "images/Groupgraph.png",
              //                         color: Colors.white,
              //                       )),
              //                   const Text("Catagery"),
              //                 ]),
              //           ),

              //           //     const Icon(Icons.keyboard_arrow_down_outlined),
              //         ),
              //       )
              //     : const SizedBox(),
              // obj.expensecata == true
              //     ? InkWell(
              //         onTap: () {
              //           // Navigator.push(
              //           //     context,
              //           //     MaterialPageRoute(
              //           //         builder: (_) => const ExpencePieChart()));
              //         },
              //         child: SizedBox(
              //           height: height * 0.05,
              //           width: width,
              //           child: Padding(
              //             padding: EdgeInsets.only(right: width * 0.1),
              //             child: Row(
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   SizedBox(
              //                       height: height * 0.1,
              //                       width: width * 0.1,
              //                       child: Image.asset(
              //                         "images/chartexpenseicon.png",
              //                         color: darkblue,
              //                       )),
              //                   const Text("Expense"),
              //                 ]),
              //           ),

              //           //     const Icon(Icons.keyboard_arrow_down_outlined),
              //         ))
              //     : const SizedBox(),

              InkWell(
                onTap: () {
                  //  obj.reportMenue();
                  obj.drawermenueclose();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ReportSelectionPage()));
                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/reports.png"),
                  title: Text(
                    "Reports",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                  // trailing: Icon(
                  //   obj.reports == true
                  //       ? Icons.keyboard_arrow_down_outlined
                  //       : Icons.keyboard_arrow_right,
                  //   color: Colors.white,
                  // ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const CalenderScreen()));
                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/calendar.png"),
                  title: Text(
                    "Calendar",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              // const Divider(),

              // InkWell(
              //   onTap: () {
              //     obj.drawermenueclose();
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (_) => const MonthlyBudgets()));
              //   },
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.construction,
              //       color: darkblue,
              //     ),
              //     title: const Text("Tools"),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const UserProfile()));

                  obj.drawermenueclose();
                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/user.png"),
                  title: Text(
                    "User",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),

              // InkWell(
              //   onTap: () {
              //     obj.drawermenueclose();
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (_) => const MonthlyBudgets()));
              //   },
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.help_rounded,
              //       color: darkblue,
              //     ),
              //     title: const Text("Frequently asked questions"),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Preferences()));
                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/prefrences.png"),
                  title: Text(
                    "Preferences",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SettingsPage()));
                },
                child: ListTile(
                  leading: Image.asset("assets/drawericon/prefrences.png"),
                  title: Text(
                    "Settings",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.getKeys();
                  for (String key in preferences.getKeys()) {
                    preferences.remove(key);
                  }
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (Route<dynamic> route) => false);
                  });
                },
                child: ListTile(
                    leading: Icon(
                      Icons.logout_rounded,
                      color: white.withOpacity(0.7),
                    ),
                    title: Text(
                      "LogOut",
                      style: GoogleFonts.poppins(
                          color: white,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ],
          ),
        )),
        Container(
            alignment: Alignment.center,
            width: width,
            color: darkblue,
            child: Image.asset(
              "images/icon1.png",
              width: 50,
              height: 50,
              color: Colors.white,
            )),
      ]);
    });
  }
}

void showingSuplierdialogue(context, height, width, white) {
  showDialog(
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
                    "Select Supplier",
                    style: GoogleFonts.poppins(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w400),
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
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    HomeController.to.supplierList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        // PdfController.to
                                        //     .fetchsupplierReport(HomeController
                                        //         .to
                                        //         .supplierList[index]
                                        //         .supplierId!)
                                        //     .then((value) {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             SupplierReportPDFScreen(
                                        //                 supplierReportList:
                                        //                     value),
                                        //       ));
                                        // });
                                        // supplierName = HomeController.to.supplierList[index].name.toString();
                                        // supplierid = HomeController.to.supplierList[index].supplierId.toString();
                                        // print("name supplier ------$supplierName");
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
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                    HomeController
                                                        .to
                                                        .supplierList[index]
                                                        .name!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blue[900]),
                                                  ),
                                                  Text(
                                                    HomeController
                                                        .to
                                                        .supplierList[index]
                                                        .email!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    HomeController
                                                        .to
                                                        .supplierList[index]
                                                        .telePhone!,
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        color: Colors.black),
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
