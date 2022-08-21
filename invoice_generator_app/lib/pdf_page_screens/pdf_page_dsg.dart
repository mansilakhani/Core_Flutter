import 'dart:io';

import 'package:new_invoice_generator_app/globals/invoice_workspace_globals.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'filehandleapi.dart';

pw.TextStyle mystyle1 = pw.TextStyle(
  color: PdfColors.black,
  fontWeight: pw.FontWeight.bold,
  fontSize: 14,
);

pw.TextStyle mystyle2 = const pw.TextStyle(
  color: PdfColors.black,
  fontSize: 14,
);

class PdfInvoiceApi {
  static Future<File> generate() async {
    final pdf = pw.Document();

    // final iconImage = (await rootBundle.load("assets/icons/invoice.png"))
    //     .buffer
    //     .asUint8List();
    final image = pw.MemoryImage(
      File(Invoice.image!.path).readAsBytesSync(),
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Billed From :', style: mystyle1),
                      pw.SizedBox(height: 10),
                      pw.Text('${Invoice.busi_name}', style: mystyle2),
                      pw.Container(
                        width: 200,
                        child:
                            pw.Text('${Invoice.busi_address}', style: mystyle2),
                      ),
                      pw.Text('${Invoice.busi_email},', style: mystyle2),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        height: 70,
                        width: 70,
                        color: PdfColors.black,
                        child: pw.Image(image, fit: pw.BoxFit.cover),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            Invoice.busi_name!.split(' ')[0],
                            style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          pw.Text(
                            '${Invoice.busi_name}',
                            style: const pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 25),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Billed To :', style: mystyle1),
                      pw.SizedBox(height: 10),
                      pw.Text('${Invoice.client_name}', style: mystyle2),
                      pw.Container(
                        width: 200,
                        child: pw.Text('${Invoice.client_address}',
                            style: mystyle2),
                      ),
                      pw.Text('${Invoice.client_email}', style: mystyle2),
                    ],
                  ),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('Invoice #:', style: mystyle1),
                          pw.Text('Date of Issue :', style: mystyle1),
                          pw.Text('Due Date :', style: mystyle1),
                          pw.Text('Balance :', style: mystyle1),
                        ],
                      ),
                      pw.SizedBox(width: 20),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('${Invoice.invoice_number}', style: mystyle2),
                          pw.Text('${Invoice.invoice_date}', style: mystyle2),
                          pw.Text('${Invoice.invoice_due_date}',
                              style: mystyle2),
                          pw.Text('${Global_Item.total}', style: mystyle2),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 50),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Container(
                    width: 80,
                    child: pw.Text('Description', style: mystyle1),
                  ),
                  pw.Container(
                    child: pw.Text('Price', style: mystyle1),
                  ),
                  pw.Container(
                    width: 50,
                    child: pw.Text('Qty.', style: mystyle1),
                  ),
                  pw.Container(
                    width: 70,
                    child: pw.Text('Total', style: mystyle1),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 2,
                color: PdfColors.black,
              ),
              pw.SizedBox(height: 20),
              pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  ...Global_Item.AllItems_details.map((e) => pw.Row(children: [
                        pw.Container(
                            width: 150, //110

                            child: pw.Text(e.item_name)),
                        pw.Container(
                          width: 150, //50
                          child: pw.Text('${e.unit_cost.toInt()}',
                              style: mystyle2),
                        ),
                        pw.Container(
                          width: 100,
                          child: pw.Text('${e.item_quantity}', style: mystyle2),
                        ),
                        pw.Container(
                          width: 70,
                          child: pw.Text("${(e.unit_cost * e.item_quantity)}",
                              style: mystyle2),
                        ),
                      ])).toList(),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(
                thickness: 1,
                color: PdfColors.grey,
              ),
              pw.SizedBox(height: 30),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(width: 310),
                      pw.Text('Total Amount  :  ', style: mystyle1),
                      pw.Text('${Global_Item.total}', style: mystyle2),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 50),
              pw.Divider(
                thickness: 1,
                color: PdfColors.black,
              ),
              pw.SizedBox(height: 5),
              pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      'THANK YOU FOR YOUR BUSINESS! ',
                      style: const pw.TextStyle(
                        fontSize: 12,
                        color: PdfColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
    return FileHandleApi.saveDocument(name: "My_Invoice.PDF", pdf: pdf);
  }
}
