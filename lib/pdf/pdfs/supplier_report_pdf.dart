import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart' as p;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:snabb_business/pdf/m/supliers_report_model.dart';

class SupplierReportPDFScreen extends StatefulWidget {
  List<SupplierReportData>? supplierReportList;
  @override
  SupplierReportPDFScreen({
    required this.supplierReportList,
    super.key,
  });

  @override
  State<SupplierReportPDFScreen> createState() =>
      _SupplierReportPDFScreenState();
}

class _SupplierReportPDFScreenState extends State<SupplierReportPDFScreen> {
  List<pw.Widget> listofPDF = [];
  double total = 0.0;

  generatelist() {
    listofPDF.clear();

    // print("list of days $listofdays");
    // ///////////////////////
    listofPDF.add(
      pw.Header(
          level: 0,
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Snabb Business",
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    color: p.PdfColor.fromHex("006400"),
                  ),
                ),
                pw.Text(
                  "Suplier Sales Sheet",
                  style: pw.TextStyle(
                    fontSize: 17,
                    fontWeight: pw.FontWeight.bold,
                    color: p.PdfColor.fromHex("006400"),
                  ),
                ),
              ])),
    );

    listofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 20),
      pw.Container(
        height: 25,
        width: 250,
        color: p.PdfColor.fromHex("006400"),
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
                    width: 95,
                    color: p.PdfColor.fromHex("006400"),
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
                    color: p.PdfColor.fromHex("006400"),
                    child: pw.Center(
                      child: pw.Text(
                        'Ref #',
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
                    color: p.PdfColor.fromHex("006400"),
                    child: pw.Center(
                      child: pw.Text(
                        'Supplier\'s\n   Name',
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
                    color: p.PdfColor.fromHex("006400"),
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
                    color: p.PdfColor.fromHex("006400"),
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
                    color: p.PdfColor.fromHex("006400"),
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
                    width: 90,
                    color: p.PdfColor.fromHex("006400"),
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
                    color: p.PdfColor.fromHex("006400"),
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
                    color: p.PdfColor.fromHex("006400"),
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
                    color: p.PdfColor.fromHex("006400"),
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
    int i = 1;

    ///
    for (var u in widget.supplierReportList!) {
      listofPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 95,
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
                        i.toString(),
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
                        u.name == null ? '-' : u.name!,
                        style: pw.TextStyle(
                            fontSize: 8,
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

    listofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 10),
      pw.SizedBox(height: 5),
    ]));
  }

  Uint8List? savelist;
  Future<Uint8List> createPDF() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) {
          return listofPDF;
        },
      ),
    );

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
