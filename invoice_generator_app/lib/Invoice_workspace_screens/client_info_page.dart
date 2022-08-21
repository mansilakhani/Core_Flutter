import 'package:flutter/material.dart';

import '../globals/invoice_workspace_globals.dart';
import '../invoice_workspace_widgets/client_info_widget.dart';

class Client_Info_Page extends StatefulWidget {
  const Client_Info_Page({Key? key}) : super(key: key);

  @override
  State<Client_Info_Page> createState() => _Client_Info_PageState();
}

class _Client_Info_PageState extends State<Client_Info_Page> {
  final GlobalKey<FormState> clientKey = GlobalKey<FormState>();
  final TextEditingController client_name_controller = TextEditingController();
  final TextEditingController client_email_controller = TextEditingController();
  final TextEditingController client_phone_controller = TextEditingController();
  final TextEditingController client_address_controller =
      TextEditingController();

  var appColor = TextStyle(fontSize: 22);

  var textstyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Color(0xffdd6c44).withOpacity(0.9),
        actions: [
          IconButton(
              onPressed: () {
                if (clientKey.currentState!.validate()) {
                  clientKey.currentState!.save();
                  Invoice.client_name = client_name_controller.text;
                  Invoice.client_email = client_email_controller.text;
                  Invoice.client_phone_no = client_phone_controller.text;
                  Invoice.client_address = client_address_controller.text;
                }
              },
              icon: const Icon(Icons.save))
        ],
        title: Text(
          "Client Information",
          style: appColor,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        height: _height * 0.60,
        decoration: BoxDecoration(
          //color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Form(
              key: clientKey,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Client Name",
                        style: textstyle,
                      ),
                      const SizedBox(height: 5),
                      client_Widget(
                          clientinfo_controller: client_name_controller,
                          hint_name: "Type Name",
                          error_name: "Enter client's business name ...",
                          type: TextInputType.text,
                          onSave: (val) {
                            setState(() {
                              Invoice.client_name;
                            });
                          }),
                      Text(
                        "Email Address",
                        style: textstyle,
                      ),
                      const SizedBox(height: 5),
                      client_Widget(
                          clientinfo_controller: client_email_controller,
                          hint_name: "Type Email",
                          error_name: "Enter your email ...",
                          type: TextInputType.emailAddress,
                          onSave: (val) {
                            setState(() {
                              Invoice.client_email;
                            });
                          }),
                      Text(
                        "Phone Number",
                        style: textstyle,
                      ),
                      const SizedBox(height: 5),
                      client_Widget(
                          clientinfo_controller: client_phone_controller,
                          hint_name: "Type Phone ",
                          error_name: "Enter your phone number ...",
                          type: TextInputType.number,
                          onSave: (val) {
                            setState(() {
                              Invoice.client_phone_no;
                            });
                          }),
                      Text(
                        "Address",
                        style: textstyle,
                      ),
                      const SizedBox(height: 5),
                      client_Widget(
                          clientinfo_controller: client_address_controller,
                          hint_name: "Type Address",
                          error_name: "Enter your address ...",
                          type: TextInputType.text,
                          onSave: (val) {
                            setState(() {
                              Invoice.client_address;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            //const SizedBox(height: 10),
            //const Spacer(),
          ],
        ),
      ),
    );
  }
}
