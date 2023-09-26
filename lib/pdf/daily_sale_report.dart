import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart' as p;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:snabb_business/screen/invoice/invoice_model.dart';

class DailySaleReport extends StatefulWidget {
  @override
  DailySaleReport({
    super.key,
  });

  @override
  State<DailySaleReport> createState() => _DailySaleReportState();
}

class _DailySaleReportState extends State<DailySaleReport> {
  List<pw.Widget> listofPDF = [];
  double total = 0.0;

  generatelist() {
    listofPDF.clear();

    // print("list of days $listofdays");
    // ///////////////////////
    listofPDF.add(
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

    listofPDF.add(pw.Column(children: [
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
      pw.Row(children: [
        pw.Container(
          height: 25,
          width: 70,
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
          width: 50,
          color: p.PdfColors.green,
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
          width: 50,
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
          width: 50,
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
          width: 50,
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
          width: 50,
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
          width: 50,
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
          width: 50,
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
          width: 75,
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
      pw.SizedBox(height: 10),
    ]));

    /// for loop lagna ha idhr or ya list us k andr
    ///
    for (int i = 0; i < 5; i++) {
      listofPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 25,
                    width: 75,
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        '1-july-2023',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 25,
                    width: 60,
                    child: pw.Center(
                      child: pw.Text(
                        '11223',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 20,
                    width: 60,
                    child: pw.Center(
                      child: pw.Text(
                        '12000',
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
                        '15000',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 60,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        '150',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 60,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        '150',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 60,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        '150',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 60,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        '150',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    width: 75,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        '18-12-2023',
                        style: pw.TextStyle(
                            fontSize: 9,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                ])
          ]));
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
