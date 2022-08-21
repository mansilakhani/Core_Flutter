import 'package:flutter/material.dart';

import '../pdf_page_screens/filehandleapi.dart';
import '../pdf_page_screens/pdf_page_dsg.dart';

class Pdf_Page extends StatefulWidget {
  const Pdf_Page({Key? key}) : super(key: key);

  @override
  State<Pdf_Page> createState() => _Pdf_PageState();
}

class _Pdf_PageState extends State<Pdf_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Color(0xffdd6c44).withOpacity(0.9),
        title: Text("Invoice PDF Generator"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                /// generate pdf file
                final pdfFile = await PdfInvoiceApi.generate();

                /// opening the pdf file
                FileHandleApi.openFile(pdfFile);
              },
              child: Icon(
                Icons.picture_as_pdf,
                color: Colors.black.withOpacity(0.8),
                size: 50,
              ),
            ),
            Text(
              "Generate Invoice",
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //foregroundColor: Colors.white,
                backgroundColor: Color(0xffdd6c44).withOpacity(0.9),
                //disabledForegroundColor: Colors.grey.withOpacity(0.38),
                //disabledBackgroundColor: Colors.grey.withOpacity(0.12),
              ),
              onPressed: () async {
                // /// generate pdf file
                // final pdfFile = await PdfInvoiceApi.generate();
                //
                // /// opening the pdf file
                // FileHandleApi.openFile(pdfFile);
              },
              child: const Text(
                "Invoice PDF",
                style: TextStyle(
                  //color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
