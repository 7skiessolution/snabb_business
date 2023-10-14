import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DailySaleReportPDFScreen(
                                      dailysaleReportList:
                                          PdfController.to.dailyslaesReportlist,
                                    ),
                                  ));
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CompanySaleReportPDFScreen(
                                      companysaleReportList:
                                          PdfController.to.compenysaleslist,
                                    ),
                                  ));
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PurchaseReportPDFScreen(
                                      purchaseReportList:
                                          PdfController.to.purchaseReportList,
                                    ),
                                  ));
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
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
                              // showingSuplierdialogue(
                              //     context, height, width, white);
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
                              title: Text(
                                "Supplier Report",
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ExpenseReportPDFScreen(
                                      expenseReportList:
                                          PdfController.to.expenseReportList,
                                    ),
                                  ));
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
                              title: Text(
                                "Expense Report",
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: blue,
                              ),
                              title: Text(
                                "Cashflow Report",
                                style: GoogleFonts.poppins(
                                    color: blue,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
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
