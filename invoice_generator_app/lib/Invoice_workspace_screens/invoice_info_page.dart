import 'package:flutter/material.dart';
import 'package:new_invoice_generator_app/globals/invoice_workspace_globals.dart';

class Invoice_Info_Page extends StatefulWidget {
  const Invoice_Info_Page({Key? key}) : super(key: key);

  @override
  State<Invoice_Info_Page> createState() => _Invoice_Info_PageState();
}

class _Invoice_Info_PageState extends State<Invoice_Info_Page> {
  final GlobalKey<FormState> invoicekey = GlobalKey<FormState>();
  final TextEditingController invoice_number_controller =
      TextEditingController();
  final TextEditingController invoice_date_controller =
      TextEditingController(); //date issue
  final TextEditingController invoice_due_date_controller =
      TextEditingController();

  String? invoice_number;
  String? invoice_date;
  String? invoice_due_date;

  var appColor = TextStyle(fontSize: 22);
  var textstyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );
  //DateTime date = DateTime(2022, 12, 24);

  // /// create datetime variable
  //
  // DateTime _dateTime = DateTime.now();
  //
  // /// show date picker method
  // void _showDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   ).then((value) {
  //     setState(() {
  //       _dateTime = value!;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: const Color(0xffdd6c44).withOpacity(0.9),
          actions: [
            IconButton(
              onPressed: () {
                invoicekey.currentState?.save();
                Invoice.invoice_number = invoice_number;
                Invoice.invoice_date = invoice_date;
                Invoice.invoice_due_date = invoice_due_date;
              },
              icon: const Icon(
                Icons.save,
              ),
            ),
          ],
          title: Text(
            "Invoice Setting",
            style: appColor,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          height: _height * 0.87,
          width: _width,
          decoration: BoxDecoration(
              //color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Invoice Number",
                    style: textstyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        invoice_number = val!;
                      });
                    },
                    controller: invoice_number_controller,
                    decoration: const InputDecoration(
                        hintText: "#N8345", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Date",
                    style: textstyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        invoice_date = val;
                      });
                    },
                    controller: invoice_date_controller,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        //icon: Icon(Icons.calendar_today_rounded),
                        //suffix: Icon(Icons.calendar_today_rounded),
                        hintText: "dd-MM-yyy",
                        border: OutlineInputBorder()),
                    // onTap: () async {
                    //   DateTime? pickeddate = await showDatePicker(
                    //       context: context,
                    //       initialDate: DateTime.now(),
                    //       firstDate: DateTime(2000),
                    //       lastDate: DateTime(2025));
                    //
                    //   if (pickeddate != null) {
                    //     //print(pickeddate);
                    //     String formatdate =
                    //         DateFormat('dd-MM-yyy').format(pickeddate);
                    //     print(formatdate);
                    //     setState(() {
                    //       invoice_date_controller.text = formatdate;
                    //     });
                    //   } else {
                    //     print("Date isnot selected");
                    //   }
                    // },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Due Date",
                    style: textstyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        invoice_due_date = val;
                      });
                    },
                    controller: invoice_due_date_controller,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        //icon: Icon(Icons.calendar_today_rounded),
                        //suffix: Icon(Icons.calendar_today_rounded),
                        hintText: "dd-MM-yyy",
                        border: OutlineInputBorder()),
                    // onTap: () async {
                    //   DateTime? pickeddate = await showDatePicker(
                    //       context: context,
                    //       initialDate: DateTime.now(),
                    //       firstDate: DateTime(2000),
                    //       lastDate: DateTime(2025));
                    //
                    //   if (pickeddate != null) {
                    //     //print(pickeddate);
                    //     String formatdate =
                    //         DateFormat('dd-MM-yyy').format(pickeddate);
                    //     print(formatdate);
                    //     setState(() {
                    //       invoice_due_date_controller.text = formatdate;
                    //     });
                    //   } else {
                    //     print("Date isnot selected");
                    //   }
                    // },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
