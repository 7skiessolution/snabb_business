import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart' as p;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:snabb_business/screen/invoice/invoice_model.dart';

class PDFPreview extends StatefulWidget {
  InvoiceModel model;
  @override
  PDFPreview({super.key, required this.model});

  @override
  State<PDFPreview> createState() => _PDFPreviewState();
}

class _PDFPreviewState extends State<PDFPreview> {
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
              color: p.PdfColors.blue900),
        ),
      ),
    );
    listofPDF.add(
      pw.Row(children: [
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text(
            '${widget.model.companyModel!.companyName}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.companyModel!.country}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.companyModel!.city}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.companyModel!.state}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.companyModel!.postal}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
        ]),
        pw.SizedBox(width: 100),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Text(
            '${widget.model.tocompanyModel!.companyName}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.tocompanyModel!.country}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.tocompanyModel!.city}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.tocompanyModel!.state}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.tocompanyModel!.postal}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
        ]),
        pw.Expanded(child: pw.SizedBox()),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
          pw.Text(
            'Invoice NO',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.invoiceNumber}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
                color: p.PdfColors.blue900),
          ),
          pw.SizedBox(height: 15),
          pw.Text(
            'Date of Invoice',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
          pw.Text(
            '${widget.model.invoidDate}',
            style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: p.PdfColors.blue900),
          ),
        ]),
      ]),
    );

    listofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 10),
      pw.Row(children: [
        pw.Container(
          height: 20,
          width: 150,
          color: p.PdfColors.blue900,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              'Name',
              style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                  color: p.PdfColors.white),
            ),
          ),
        ),
        pw.Container(
          height: 20,
          width: 50,
          color: p.PdfColors.blue900,
          child: pw.Center(
            child: pw.Text(
              'QTY',
              style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                  color: p.PdfColors.white),
            ),
          ),
        ),
        pw.Container(
          height: 20,
          width: 115,
          color: p.PdfColors.blue900,
          child: pw.Center(
            child: pw.Text(
              'Price',
              style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                  color: p.PdfColors.white),
            ),
          ),
        ),
        pw.Container(
          height: 20,
          width: 50,
          color: p.PdfColors.blue900,
          child: pw.Center(
            child: pw.Text(
              'Tax',
              style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                  color: p.PdfColors.white),
            ),
          ),
        ),
        pw.Container(
          height: 20,
          width: 115,
          color: p.PdfColors.blue900,
          child: pw.Center(
            child: pw.Text(
              'Amount',
              style: pw.TextStyle(
                  fontSize: 10,
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
    ///
    double total = 0.0;
    double tax = 0.0;
    for (int i = 0; i < widget.model.productList!.length; i++) {
      listofPDF.add(pw.Table(
          border: pw.TableBorder.all(color: p.PdfColors.grey, width: 2),
          children: [
            pw.TableRow(
                verticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.Container(
                    height: 20,
                    width: 150,
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(
                        '${widget.model.productList![i].name}',
                        style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    height: 20,
                    width: 50,
                    child: pw.Center(
                      child: pw.Text(
                        '${widget.model.productList![i].qty}',
                        style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 115,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        '${widget.model.productList![i].amount}',
                        style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                  pw.Container(
                    height: 20,
                    width: 50,
                    child: pw.Center(
                      child: pw.Text(
                        '${widget.model.productList![i].tax}%',
                        style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    ),
                  ),
                  pw.Container(
                    width: 115,
                    child: pw.Center(
                        child: pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 2),
                      child: pw.Text(
                        '${widget.model.productList![i].amount}',
                        style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.normal,
                            color: p.PdfColors.black),
                      ),
                    )),
                  ),
                ])
          ]));
      total = total + widget.model.productList![i].amount!.toDouble();
      tax = tax + widget.model.productList![i].tax!.toDouble();
    }

    listofPDF.add(pw.Column(children: [
      pw.SizedBox(height: 10),
      pw.Row(children: [
        pw.Expanded(child: pw.SizedBox()),
        pw.Container(
            width: 100,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                'Sub Total :',
                style: pw.TextStyle(
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                    color: p.PdfColors.black),
              ),
            )),
        pw.Container(
          width: 115,
          child: pw.Center(
              child: pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 2),
            child: pw.Text(
              total.toStringAsFixed(2),
              style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.normal,
                  color: p.PdfColors.black),
            ),
          )),
        ),
      ]),
      pw.SizedBox(height: 10),
      // pw.Row(children: [
      //   pw.Expanded(child: pw.SizedBox()),
      //   pw.Container(
      //       width: 100,
      //       child: pw.Align(
      //         alignment: pw.Alignment.centerLeft,
      //         child: pw.Text(
      //           'Discount :',
      //           style: pw.TextStyle(
      //               fontSize: 12,
      //               fontWeight: pw.FontWeight.bold,
      //               color: p.PdfColors.black),
      //         ),
      //       )),
      //   pw.Container(
      //     width: 115,
      //     child: pw.Center(
      //         child: pw.Padding(
      //       padding: const pw.EdgeInsets.symmetric(vertical: 2),
      //       child: pw.Text(
      //         '0',
      //         style: pw.TextStyle(
      //             fontSize: 10,
      //             fontWeight: pw.FontWeight.normal,
      //             color: p.PdfColors.black),
      //       ),
      //     )),
      //   ),
      // ]),
      // pw.SizedBox(height: 5),
      // pw.Row(children: [
      //   pw.Expanded(child: pw.SizedBox()),
      //   pw.Container(
      //       width: 100,
      //       child: pw.Align(
      //         alignment: pw.Alignment.centerLeft,
      //         child: pw.Text(
      //           'Tax Rate :',
      //           style: pw.TextStyle(
      //               fontSize: 12,
      //               fontWeight: pw.FontWeight.bold,
      //               color: p.PdfColors.black),
      //         ),
      //       )),
      //   pw.Container(
      //     width: 115,
      //     child: pw.Center(
      //         child: pw.Padding(
      //       padding: const pw.EdgeInsets.symmetric(vertical: 2),
      //       child: pw.Text(
      //         '0%',
      //         style: pw.TextStyle(
      //             fontSize: 10,
      //             fontWeight: pw.FontWeight.normal,
      //             color: p.PdfColors.black),
      //       ),
      //     )),
      //   ),
      // ]),
      pw.SizedBox(height: 5),
      pw.Row(children: [
        pw.Expanded(child: pw.SizedBox()),
        pw.Container(
            width: 100,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                'Total Tax :',
                style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                    color: p.PdfColors.black),
              ),
            )),
        pw.Container(
          width: 115,
          child: pw.Center(
              child: pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 2),
            child: pw.Text(
              tax.toStringAsFixed(2),
              style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.normal,
                  color: p.PdfColors.black),
            ),
          )),
        ),
      ]),
      pw.Row(children: [
        pw.Expanded(child: pw.SizedBox()),
        pw.Container(width: 215, height: 1, color: p.PdfColors.grey700)
      ]),
      pw.SizedBox(height: 5),
      pw.Row(children: [
        pw.Expanded(child: pw.SizedBox()),
        pw.Container(
            width: 100,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                'Invoice Total :',
                style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    color: p.PdfColors.black),
              ),
            )),
        pw.Container(
          width: 115,
          child: pw.Center(
              child: pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 2),
            child: pw.Text(
              total.toStringAsFixed(2),
              style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.normal,
                  color: p.PdfColors.black),
            ),
          )),
        ),
      ]),
      pw.SizedBox(height: 80),
      pw.Row(children: [
        pw.Container(
            width: 300,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                'Note',
                style: pw.TextStyle(
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                    color: p.PdfColors.black),
              ),
            )),
        pw.Expanded(child: pw.SizedBox()),
      ]),
      pw.SizedBox(height: 10),
      pw.Row(children: [
        pw.Container(
            width: 300,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                '${widget.model.note}',
                style:
                    const pw.TextStyle(fontSize: 15, color: p.PdfColors.black),
              ),
            )),
        pw.Expanded(child: pw.SizedBox()),
      ]),
      pw.SizedBox(height: 30),
      pw.Row(children: [
        pw.Container(
            width: 300,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                'Terms And Conditions',
                style: pw.TextStyle(
                    fontSize: 15,
                    fontWeight: pw.FontWeight.bold,
                    color: p.PdfColors.black),
              ),
            )),
        pw.Expanded(child: pw.SizedBox()),
      ]),
      pw.SizedBox(height: 10),
      pw.Row(children: [
        pw.Container(
            width: 300,
            child: pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                '${widget.model.terms}',
                style:
                    const pw.TextStyle(fontSize: 15, color: p.PdfColors.black),
              ),
            )),
        pw.Expanded(child: pw.SizedBox()),
      ]),
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
