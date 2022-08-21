import 'package:flutter/material.dart';
import 'package:new_invoice_generator_app/globals/globals.dart';

import '../pdf_page_screens/filehandleapi.dart';
import '../pdf_page_screens/pdf_page_dsg.dart';

class Invoice_Workspace_Page extends StatefulWidget {
  const Invoice_Workspace_Page({Key? key}) : super(key: key);

  @override
  State<Invoice_Workspace_Page> createState() => _Invoice_Workspace_PageState();
}

class _Invoice_Workspace_PageState extends State<Invoice_Workspace_Page> {
  var appColor = TextStyle(fontSize: 22);
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Color(0xffdd6c44).withOpacity(0.9),
        title: Text(
          "Invoice Workspace",
          style: appColor,
        ),
        // centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              // generated pdf file
              final pdfFile = await PdfInvoiceApi.generate();
              // opening the pdf file
              FileHandleApi.openFile(pdfFile);
            },
            icon: const Icon(
              Icons.picture_as_pdf_rounded,
            ),
          ),
        ],
      ),
      //backgroundColor: const Color(0xff4e8faf).withOpacity(0.9),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, i) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: alloptions
                  .map((e) => SizedBox(
                        // height: _height * 0.145,
                        // width: _width * 0.90,
                        height: _height * 0.176,
                        width: _width * 0.90,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Card(
                            //elevation: 50,
                            elevation: 10,
                            //shadowColor: Color(0xffdd6c44).withOpacity(0.3),
                            color: Colors.white.withOpacity(0.9),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    e['icons'],
                                    scale: 5,
                                    //color: Colors.black.withOpacity(0.6),
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                  title: Text(
                                    "${e['title']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.9),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  //subtitle: Text("${e['title']}"),
                                  trailing: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(e['routes']);
                                      },
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        //(Icons.arrow_forward),
                                        size: 22,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            );
          }),
    );
  }
}
