import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart' as p;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:snabb_business/pdf/m/cash_flow_model.dart';
import 'package:snabb_business/pdf/m/company_sales_report_model.dart';
import 'package:snabb_business/pdf/m/daily_sales_report_model.dart';
import 'package:snabb_business/pdf/m/expense_report_model.dart';
import 'package:snabb_business/pdf/m/purchase_report_model.dart';

class CompanySaleReportPDFScreen extends StatefulWidget {
  List<CompanySaleReportData> compenysaleslist = [];
  List<DailySaleReportData> dailyslaesReportlist = [];
  List<ExpenseReportData> expenseReportList = [];
  List<PurchaseReportData> purchaseReportList = [];
  List<CashFlowData> cashflowReportList = [];
  bool daily;
  bool company;
  bool expense;
  bool purchase;
  bool flow;
  @override
  CompanySaleReportPDFScreen(
      {super.key,
      required this.compenysaleslist,
      required this.dailyslaesReportlist,
      required this.expenseReportList,
      required this.purchaseReportList,
      required this.cashflowReportList,
      required this.company,
      required this.daily,
      required this.expense,
      required this.flow,
      required this.purchase});

  @override
  State<CompanySaleReportPDFScreen> createState() =>
      _CompanySaleReportPDFScreenState();
}

class _CompanySaleReportPDFScreenState
    extends State<CompanySaleReportPDFScreen> {
  List<pw.Widget> companylistofPDF = [];
  List<pw.Widget> cashFlowlistofPDF = [];
  List<pw.Widget> dailyListOfPDF = [];
  List<pw.Widget> expenceListOfPDF = [];
  List<pw.Widget> purchaseListOfPDF = [];
  double total = 0.0;

  generatelist() {
    cashFlowlistofPDF.clear();
    dailyListOfPDF.clear();
    companylistofPDF.clear();
    expenceListOfPDF.clear();
    purchaseListOfPDF.clear();

    /////////////////////////
    cashFlowlistofPDF.add(
      pw.Header(
        level: 0,
        child: pw.Text(
          "Snabb Business",
          style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: p.PdfColors.black),
        ),
      ),
    );
    dailyListOfPDF.add(
      pw.Header(
        level: 0,
        child: pw.Text(
          "Snabb Business",
          style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: p.PdfColors.green),
        ),
      ),
    );
    cashFlowlistofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 20),
      pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 1),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        'Date',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        'Opening Balance',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                      height: 25,
                      width: 240,
                      child: pw.Row(children: [
                        pw.Container(
                            height: 25,
                            width: 80,
                            child: pw.Column(children: [
                              pw.Container(
                                height: 12,
                                width: 80,
                                decoration: pw.BoxDecoration(
                                  border:
                                      pw.Border.all(color: p.PdfColors.grey),
                                  color: p.PdfColors.black,
                                ),
                                child: pw.Center(
                                  child: pw.Text(
                                    'Cash Inflows',
                                    style: pw.TextStyle(
                                        fontSize: 9,
                                        fontWeight: pw.FontWeight.bold,
                                        color: p.PdfColors.white),
                                  ),
                                ),
                              ),
                              pw.Container(
                                height: 13,
                                width: 80,
                                decoration: pw.BoxDecoration(
                                  border:
                                      pw.Border.all(color: p.PdfColors.grey),
                                  color: p.PdfColors.blue900,
                                ),
                                child: pw.Center(
                                  child: pw.Text(
                                    'Sales',
                                    style: pw.TextStyle(
                                        fontSize: 9,
                                        fontWeight: pw.FontWeight.bold,
                                        color: p.PdfColors.white),
                                  ),
                                ),
                              ),
                            ])),
                        pw.Container(
                            height: 25,
                            width: 160,
                            child: pw.Column(children: [
                              pw.Container(
                                height: 12,
                                width: 160,
                                decoration: pw.BoxDecoration(
                                  border:
                                      pw.Border.all(color: p.PdfColors.grey),
                                  color: p.PdfColors.black,
                                ),
                                child: pw.Center(
                                  child: pw.Text(
                                    'Cash Outflows',
                                    style: pw.TextStyle(
                                        fontSize: 9,
                                        fontWeight: pw.FontWeight.bold,
                                        color: p.PdfColors.white),
                                  ),
                                ),
                              ),
                              pw.Row(children: [
                                pw.Container(
                                  height: 13,
                                  width: 80,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: p.PdfColors.grey),
                                    color: p.PdfColors.green,
                                  ),
                                  child: pw.Center(
                                    child: pw.Text(
                                      'Purchases',
                                      style: pw.TextStyle(
                                          fontSize: 9,
                                          fontWeight: pw.FontWeight.bold,
                                          color: p.PdfColors.white),
                                    ),
                                  ),
                                ),
                                pw.Container(
                                  height: 13,
                                  width: 80,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: p.PdfColors.grey),
                                    color: p.PdfColors.brown400,
                                  ),
                                  child: pw.Center(
                                    child: pw.Text(
                                      'Expenses',
                                      style: pw.TextStyle(
                                          fontSize: 9,
                                          fontWeight: pw.FontWeight.bold,
                                          color: p.PdfColors.white),
                                    ),
                                  ),
                                ),
                              ])
                            ])),
                      ])),
                  pw.Container(
                    height: 25,
                    width: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Text(
                        'Closing Balance',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                ]),
          ]),
      pw.SizedBox(height: 10),
    ]));
    dailyListOfPDF.add(pw.Column(children: [
      pw.SizedBox(height: 20),
      pw.Container(
        height: 25,
        width: 250,
        color: p.PdfColors.green,
        child: pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Amount',
            style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.white),
          ),
        ),
      ),
      pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 1),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    color: p.PdfColors.green,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Date',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Invoice #',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'OnCash',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'OnBank',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Other',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Credit Transaction',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Total',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Balance',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 100,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Return Date',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                ]),
          ]),
      pw.SizedBox(height: 10),
    ]));

    //////////////////////////////////////////
    int i = 1;
    double prevvalue=0;
    double totalS=0;
    double totalE=0;
    double totalP=0;
    
    for (var u in widget.cashflowReportList) {
      cashFlowlistofPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 80,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        u.date.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                       prevvalue.toStringAsFixed(2),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        u.sale!.toStringAsFixed(2),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.purchase!.toStringAsFixed(2),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.expense!.toStringAsFixed(2),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        (prevvalue- u.sale! -u.purchase!-u.expense!).toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                ])
          ]));
          prevvalue=prevvalue- u.sale! -u.purchase!-u.expense!;
          totalE=totalE+u.expense!;
          totalS=totalS+u.sale!;
          totalP=totalP+u.purchase!;
      i++;
    }
    cashFlowlistofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 20),
      pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 1),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    width: 160,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Padding(
                        padding: pw.EdgeInsets.symmetric(vertical: 3),
                        child: pw.Text(
                          'Profit & Lose  (+/-)',
                          style: pw.TextStyle(
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold,
                              color: p.PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Padding(
                        padding: pw.EdgeInsets.symmetric(vertical: 3),
                        child: pw.Text(
                          totalS.toStringAsFixed(2),
                          style: pw.TextStyle(
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold,
                              color: p.PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Padding(
                        padding: pw.EdgeInsets.symmetric(vertical: 3),
                        child: pw.Text(
                          totalP.toStringAsFixed(2),
                          style: pw.TextStyle(
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold,
                              color: p.PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Padding(
                        padding: pw.EdgeInsets.symmetric(vertical: 3),
                        child: pw.Text(
                          totalE.toStringAsFixed(2),
                          style: pw.TextStyle(
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold,
                              color: p.PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: p.PdfColors.grey),
                      color: p.PdfColors.black,
                    ),
                    child: pw.Center(
                      child: pw.Padding(
                        padding: pw.EdgeInsets.symmetric(vertical: 3),
                        child: pw.Text(
                          'Profit  ${(totalS-totalP-totalE).toStringAsFixed(2)}',
                          style: pw.TextStyle(
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold,
                              color: p.PdfColors.white),
                        ),
                      ),
                    ),
                  ),
                ]),
          ]),
      pw.SizedBox(height: 10),
    ]));

    //////////////////////////////////////////////
    int j = 1;
    for (var u in widget.dailyslaesReportlist) {
      dailyListOfPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        u.date == null ? '-' : u.date!.substring(0, 10),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        j.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        u.cashAmount == null ? '-' : u.cashAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 50,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.bankAmount == null ? '-' : u.bankAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.otherAmount == null ? '-' : u.otherAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.partialAmount == null
                            ? '-'
                            : u.partialAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.totalAmount == null ? '-' : u.totalAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.remainingAmount == null
                            ? '-'
                            : u.remainingAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 100,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.payBackDay == null
                            ? '-'
                            : u.payBackDay!.substring(0, 10),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                ])
          ]));
      i++;
    }
    dailyListOfPDF.add(pw.Column(children: [
      pw.SizedBox(height: 10),
      pw.SizedBox(height: 5),
    ]));

///////////////////////////////////
    companylistofPDF.add(
      pw.Header(
        level: 0,
        child: pw.Text(
          "Snabb Business",
          style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: p.PdfColors.green),
        ),
      ),
    );

    companylistofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 20),
      pw.Container(
        height: 25,
        width: 250,
        color: p.PdfColors.green,
        child: pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Amount',
            style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.white),
          ),
        ),
      ),
      pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 1),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    color: p.PdfColors.green,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Date',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Invoice #',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'OnCash',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'OnBank',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Other',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 85,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Credit Transaction',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Total',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Balance',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 95,
                    color: p.PdfColors.green,
                    child: pw.Center(
                      child: pw.Text(
                        'Return Date',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                ]),
          ]),
      pw.SizedBox(height: 10),
    ]));

    /// for loop
    int k = 1;
    for (var u in widget.compenysaleslist) {
      companylistofPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        u.date == null ? '-' : u.date!.substring(0, 10),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        k.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        u.cashAmount == null ? '-' : u.cashAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.bankAmount == null ? '-' : u.bankAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.otherAmount == null ? '-' : u.otherAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 85,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.partialAmount == null
                            ? '-'
                            : u.partialAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.totalAmount == null ? '-' : u.totalAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.remainingAmount == null
                            ? '-'
                            : u.remainingAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 95,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.payBackDay == null
                            ? '-'
                            : u.payBackDay!.substring(0, 10),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                ])
          ]));
      i++;
    }
    companylistofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 10),
      pw.SizedBox(height: 5),
    ]));
//////////////////////////////////////////////////////////////////////
    expenceListOfPDF.add(
      pw.Header(
        level: 0,
        child: pw.Text(
          "Snabb Business",
          style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: p.PdfColors.blue),
        ),
      ),
    );

    expenceListOfPDF.add(pw.Column(children: [
      pw.SizedBox(height: 20),
      pw.Container(
        height: 25,
        width: 250,
        color: p.PdfColors.blue,
        child: pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Payment',
            style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.white),
          ),
        ),
      ),
      pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 1),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    color: p.PdfColors.blue,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Date',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.blue,
                    child: pw.Center(
                      child: pw.Text(
                        'Narrations',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.blue,
                    child: pw.Center(
                      child: pw.Text(
                        'Expense Type',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.blue,
                    child: pw.Center(
                      child: pw.Text(
                        'By Cash',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.blue,
                    child: pw.Center(
                      child: pw.Text(
                        'By Bank',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.blue,
                    child: pw.Center(
                      child: pw.Text(
                        'Total',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.blue,
                    child: pw.Center(
                      child: pw.Text(
                        'Balance',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  // pw.Container(
                  //   height: 25,
                  //   width: 80,
                  //   color: p.PdfColors.green,
                  //   child: pw.Center(
                  //     child: pw.Text(
                  //       'Balance',
                  //       style: pw.TextStyle(
                  //           fontSize: 9,
                  //           fontWeight: pw.FontWeight.bold,
                  //           color: p.PdfColors.white),
                  //     ),
                  //   ),
                  // ),
                  // pw.Container(
                  //   height: 25,
                  //   width: 100,
                  //   color: p.PdfColors.purple,
                  //   child: pw.Center(
                  //     child: pw.Text(
                  //       'Return Date',
                  //       textAlign: pw.TextAlign.center,
                  //       style: pw.TextStyle(
                  //           fontSize: 9,
                  //           fontWeight: pw.FontWeight.bold,
                  //           color: p.PdfColors.white),
                  //     ),
                  //   ),
                  // ),
                ]),
          ]),
      pw.SizedBox(height: 10),
    ]));

    /// for loop lagna ha idhr or ya list us k andr
    int e = 1;

    ///
    for (var u in widget.expenseReportList) {
      expenceListOfPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        u.date == null ? '-' : u.date!.substring(0, 10),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        u.note == null ? '-' : u.note!,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        u.name == null ? '-' : u.name!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.cashAmount == null ? '-' : u.cashAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.bankAmount == null ? '-' : u.bankAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.totalAmount == null ? '-' : u.totalAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.otherAmount == null ? '-' : u.otherAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  // pw.Container(
                  //   width: 80,
                  //   child: pw.Center(
                  //       child: pw.Padding(
                  //     padding: const pw.EdgeInsets.symmetric(vertical: 2),
                  //     child: pw.Text(
                  //       u.remainingAmount == null
                  //           ? '-'
                  //           : u.remainingAmount!.toString(),
                  //       style: pw.TextStyle(
                  //           fontSize: 9,
                  //           fontWeight: pw.FontWeight.normal,
                  //           color: p.PdfColors.black),
                  //     ),
                  //   )),
                  // ),
                  // pw.Container(
                  //   width: 100,
                  //   child: pw.Center(
                  //       child: pw.Padding(
                  //     padding: const pw.EdgeInsets.symmetric(vertical: 2),
                  //     child: pw.Text(
                  //       u.payBackDay == null
                  //           ? '-'
                  //           : u.payBackDay!.substring(0, 10),
                  //       style: pw.TextStyle(
                  //           fontSize: 9,
                  //           fontWeight: pw.FontWeight.normal,
                  //           color: p.PdfColors.black),
                  //     ),
                  //   )),
                  // ),
                ])
          ]));
      i++;
    }

    expenceListOfPDF.add(pw.Column(children: [
      pw.SizedBox(height: 10),
      pw.SizedBox(height: 5),
    ]));

    /////////////////////////////////////////
    purchaseListOfPDF.add(
      pw.Header(
        level: 0,
        child: pw.Text(
          "Snabb Business",
          style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: p.PdfColors.indigo),
        ),
      ),
    );

    purchaseListOfPDF.add(pw.Column(children: [
      pw.SizedBox(height: 20),
      pw.Container(
        height: 25,
        width: 250,
        color: p.PdfColors.indigo,
        child: pw.Align(
          alignment: pw.Alignment.center,
          child: pw.Text(
            'Amount',
            style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.white),
          ),
        ),
      ),
      pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 1),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    color: p.PdfColors.indigo,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        'Date',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'No #',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'OnCash',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'OnBank',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'Other',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 85,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'Credit Transaction',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'Total',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'Balance',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 95,
                    color: p.PdfColors.indigo,
                    child: pw.Center(
                      child: pw.Text(
                        'Return Date',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                            color: p.PdfColors.white),
                      ),
                    ),
                  ),
                ]),
          ]),
      pw.SizedBox(height: 10),
    ]));

    /// for loop lagna ha idhr or ya list us k andr
    int a = 1;

    ///
    for (var u in widget.purchaseReportList!) {
      purchaseListOfPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 100,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        u.date == null ? '-' : u.date!.substring(0, 10),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        a.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 20,
                    width: 80,
                    child: pw.Center(
                      child: pw.Text(
                        u.cashAmount == null ? '-' : u.cashAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.bankAmount == null ? '-' : u.bankAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.otherAmount == null ? '-' : u.otherAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 85,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.partialAmount == null
                            ? '-'
                            : u.partialAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.totalAmount == null ? '-' : u.totalAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 80,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.remainingAmount == null
                            ? '-'
                            : u.remainingAmount!.toString(),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 95,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        u.payBackDay == null
                            ? '-'
                            : u.payBackDay!.substring(0, 10),
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                ])
          ]));
      i++;
    }

    purchaseListOfPDF.add(pw.Column(children: [
      pw.SizedBox(height: 10),
      pw.SizedBox(height: 5),
    ]));
  }

  Uint8List? savelist;
  Future<Uint8List> createPDF() async {
    final pdf = pw.Document();

    if (widget.daily) {
      pdf.addPage(
        pw.MultiPage(
          build: (pw.Context context) {
            return dailyListOfPDF;
          },
        ),
      );
    }
    if (widget.company) {
      pdf.addPage(
        pw.MultiPage(
          build: (pw.Context context) {
            return companylistofPDF;
          },
        ),
      );
    }
    if (widget.expense) {
      pdf.addPage(
        pw.MultiPage(
          build: (pw.Context context) {
            return expenceListOfPDF;
          },
        ),
      );
    }
    if (widget.purchase) {
      pdf.addPage(
        pw.MultiPage(
          build: (pw.Context context) {
            return purchaseListOfPDF;
          },
        ),
      );
    }
    if (widget.flow) {
      pdf.addPage(
        pw.MultiPage(
          build: (pw.Context context) {
            return cashFlowlistofPDF;
          },
        ),
      );
    }

    savelist = await pdf.save();
    return savelist!;
  }

  PrintingInfo? info;
  Future init() async {
    final i = await Printing.info();
    setState(() {
      info = i;
    });
  }

  @override
  void initState() {
    init();
    generatelist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
        // actions: [
        //   PdfPrintAction(
        //     icon: const Icon(Icons.save_alt_rounded),
        //   )
        // ],
        allowPrinting: true,
        allowSharing: true,
        canChangePageFormat: false,
        canChangeOrientation: false,
        build: (format) => createPDF());
  }
}
