import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/pdf/c/pdf_controller.dart';
import 'package:snabb_business/pdf/pdfs/company_sale_pdf.dart';
import 'package:snabb_business/pdf/pdfs/daily_sale_report.dart';
import 'package:snabb_business/pdf/pdfs/expense_report_pdf.dart';
import 'package:snabb_business/pdf/pdfs/purchase_report_pdf.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';

class ReportSelectionPage extends StatefulWidget {
  const ReportSelectionPage({super.key});

  @override
  State<ReportSelectionPage> createState() => _ReportSelectionPageState();
}

class _ReportSelectionPageState extends State<ReportSelectionPage> {
  bool daily = false;
  bool company = false;
  bool expense = false;
  bool purchase = false;
  bool flow = false;
  String fromDate = "Select Date";
  String toDate = "Select Date";
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

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          AppBarWidgt(text: "Genrate Reports"),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/dollar.jpg"))),
                ),
                Container(
                  height: height * 0.1,
                  color: blue.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Reports",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.07,
                  left: width * 0.05,
                  child: Card(
                    elevation: 10,
                    shadowColor: blue,
                    child: Container(
                      height: height * 0.7,
                      width: width * 0.9,
                      color: white,
                      child: Column(
                        children: [
                          Text(
                            "Compare the values of the Report",
                            style: GoogleFonts.poppins(
                                // color: white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "From: ",
                                style: GoogleFonts.poppins(
                                    color: blackcolor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                  onTap: () {
                                    _selectDate(context, true, setState);
                                  },
                                  child: Text(fromDate)),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              Text(
                                "To:",
                                style: GoogleFonts.poppins(
                                    color: blackcolor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                  onTap: () {
                                    _selectDate(context, false, setState);
                                  },
                                  child: Text(toDate)),
                            ],
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     left: width * 0.08,
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         AppLocalizations.of(context)!
                          //             .type
                          //             .capitalize!,
                          //         style: GoogleFonts.poppins(
                          //             color: Colors.black,
                          //             fontSize: width * 0.032,
                          //             fontWeight: FontWeight.w500),
                          //       ),
                          //       Container(
                          //         height: height * 0.04,
                          //         width: width * 0.25,
                          //         decoration: BoxDecoration(
                          //             color: Colors.grey.withOpacity(0.5)),
                          //         child: DropdownButtonHideUnderline(
                          //           child: DropdownButton<String>(
                          //             dropdownColor: Colors.white,
                          //             focusColor: Colors.black,
                          //             value: obj.selectedType,
                          //             style: TextStyle(
                          //                 color: Colors.black,
                          //                 fontSize: size.width * 0.035),
                          //             onChanged: (newValue) {
                          //               obj.selectedType = newValue as String;
                          //               obj.update();

                          //               if (obj.startdate != null) {
                          //                 obj.getcategory(
                          //                     obj.selectedType == "Sale"
                          //                         ? 1
                          //                         : obj.selectedType ==
                          //                                 "Expense"
                          //                             ? 2
                          //                             : obj.selectedType ==
                          //                                     "Purchase"
                          //                                 ? 0
                          //                                 : 3,
                          //                     obj.startdate!,
                          //                     obj.enddate);
                          //               }

                          //               print(
                          //                   "=-=-==-=-=- ${obj.selectedType}");
                          //             },
                          //             items: obj.types
                          //                 .map<DropdownMenuItem<String>>(
                          //                     (String value) {
                          //               return DropdownMenuItem<String>(
                          //                 value: value,
                          //                 child: Text(
                          //                   value,
                          //                   style: TextStyle(
                          //                       color: Colors.black,
                          //                       fontSize: width * 0.035),
                          //                 ),
                          //               );
                          //             }).toList(),
                          //             hint: Text(AppLocalizations.of(context)!
                          //                 .selecttype
                          //                 .capitalize!),
                          //             icon: const Icon(
                          //               Icons.arrow_drop_down,
                          //               color: Colors.black,
                          //             ),
                          //             elevation: 1,
                          //             isExpanded: true,
                          //             isDense: true,
                          //             selectedItemBuilder:
                          //                 (BuildContext context) {
                          //               return obj.types
                          //                   .map<Widget>((String value) {
                          //                 return Container(
                          //                   alignment: Alignment.centerLeft,
                          //                   child: Padding(
                          //                     padding:
                          //                         const EdgeInsets.symmetric(
                          //                             horizontal: 5.0),
                          //                     child: Text(
                          //                       value,
                          //                       style: GoogleFonts.poppins(
                          //                           color: Colors.black,
                          //                           fontSize: width * 0.032,
                          //                           fontWeight:
                          //                               FontWeight.w400),
                          //                     ),
                          //                   ),
                          //                 );
                          //               }).toList();
                          //             },
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: width * 0.08, right: width * 0.1),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         AppLocalizations.of(context)!
                          //             .from
                          //             .capitalize!
                          //             .toUpperCase(),
                          //         style: GoogleFonts.poppins(
                          //             color: blue,
                          //             fontSize: width * 0.032,
                          //             fontWeight: FontWeight.w500),
                          //       ),
                          //       Text(
                          //         AppLocalizations.of(context)!
                          //             .to
                          //             .capitalize!
                          //             .toUpperCase(),
                          //         style: GoogleFonts.poppins(
                          //             color: blue,
                          //             fontSize: width * 0.032,
                          //             fontWeight: FontWeight.w500),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Container(
                          //       height: height * 0.05,
                          //       width: width * 0.25,
                          //       alignment: Alignment.center,
                          //       decoration: BoxDecoration(
                          //           color: Colors.grey.withOpacity(0.5)),
                          //       child: TextButton(
                          //           onPressed: () {
                          //             // obj.selectDate(context, true);
                          //           },
                          //           child: Text(
                          //             !obj.dateFromPicked
                          //                 ? AppLocalizations.of(context)!.select
                          //                 : obj.startdate.toString(),
                          //             style: GoogleFonts.poppins(
                          //                 color: Colors.black,
                          //                 fontSize: width * 0.032,
                          //                 fontWeight: FontWeight.w500),
                          //           )),
                          //     ),
                          //     Container(
                          //       height: height * 0.05,
                          //       width: width * 0.25,
                          //       alignment: Alignment.center,
                          //       decoration: BoxDecoration(
                          //           color: Colors.grey.withOpacity(0.5)),
                          //       child: TextButton(
                          //           onPressed: () {
                          //             //  obj.selectDate(context, false);
                          //           },
                          //           child: Text(
                          //             !obj.dateToPicked
                          //                 ? AppLocalizations.of(context)!.select
                          //                 : obj.enddate.toString(),
                          //             style: GoogleFonts.poppins(
                          //                 color: Colors.black,
                          //                 fontSize: width * 0.032,
                          //                 fontWeight: FontWeight.w500),
                          //           )),
                          //     ),
                          //   ],
                          // ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           DailySaleReportPDFScreen(
                              //         dailysaleReportList:
                              //             PdfController.to.dailyslaesReportlist,
                              //       ),
                              //     ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => DailySaleReport()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
                              trailing: Checkbox(
                                  value: daily,
                                  activeColor: blue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      daily = newValue as bool;
                                    });
                                  }),
                              title: Text(
                                "Daily Sale Report",
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           CompanySaleReportPDFScreen(
                              //         companysaleReportList:
                              //             PdfController.to.compenysaleslist,
                              //       ),
                              //     ));
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
                              trailing: Checkbox(
                                  value: company,
                                  activeColor: blue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      company = newValue as bool;
                                    });
                                  }),
                              title: Text(
                                "Company Sale Report",
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           PurchaseReportPDFScreen(
                              //         purchaseReportList:
                              //             PdfController.to.purchaseReportList,
                              //       ),
                              //     ));
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
                              trailing: Checkbox(
                                  value: purchase,
                                  activeColor: blue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      purchase = newValue as bool;
                                    });
                                  }),
                              title: Text(
                                "Purchase Report",
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           ExpenseReportPDFScreen(
                              //         expenseReportList:
                              //             PdfController.to.expenseReportList,
                              //       ),
                              //     ));
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
                              trailing: Checkbox(
                                  value: expense,
                                  activeColor: blue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      expense = newValue as bool;
                                    });
                                  }),
                              title: Text(
                                "Expense Report",
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.wysiwyg_outlined,
                              color: blue,
                            ),
                            trailing: Checkbox(
                                value: flow,
                                activeColor: blue,
                                onChanged: (newValue) {
                                  setState(() {
                                    flow = newValue as bool;
                                  });
                                }),
                            title: Text(
                              "Cashflow Report",
                              style: GoogleFonts.poppins(
                                  color: blue,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              if (fromDate != "Select Date" &&
                                  toDate != "Select Date") {
                                if (daily) {
                                  PdfController.to
                                      .fetchdailyslaesReport(fromDate, toDate);
                                }
                                if (expense) {
                                  PdfController.to
                                      .fetchexpenseReport(fromDate, toDate);
                                }
                                if (purchase) {
                                  PdfController.to
                                      .fetchpurchaseReport(fromDate, toDate);
                                }
                                if (company) {
                                  PdfController.to
                                      .fetchcompenysales(fromDate, toDate);
                                }
                                if (flow) {
                                  PdfController.to
                                      .cashflowReport(fromDate, toDate);
                                }
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CompanySaleReportPDFScreen(),
                                    ));
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
                              height: height * 0.06,
                              width: width * 0.35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: blue),
                              child: Center(
                                child: Text(
                                  "Generate",
                                  style: GoogleFonts.poppins(
                                      color: white,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
