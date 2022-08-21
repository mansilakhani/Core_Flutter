import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_invoice_generator_app/globals/invoice_workspace_globals.dart';
import 'package:new_invoice_generator_app/invoice_workspace_widgets/business_info_widget.dart';

class Business_Info_Page extends StatefulWidget {
  const Business_Info_Page({Key? key}) : super(key: key);

  @override
  State<Business_Info_Page> createState() => _Business_Info_PageState();
}

class _Business_Info_PageState extends State<Business_Info_Page> {
  final GlobalKey<FormState> businessKey = GlobalKey<FormState>();
  final TextEditingController business_name_controller =
      TextEditingController();
  final TextEditingController business_email_controller =
      TextEditingController();
  final TextEditingController business_address_controller =
      TextEditingController();
  final TextEditingController business_website_controller =
      TextEditingController();
  final TextEditingController business_phone_number_controller =
      TextEditingController();
  final ImagePicker _picker = ImagePicker();

  var appColor = const TextStyle(fontSize: 22);

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
        backgroundColor: const Color(0xffdd6c44).withOpacity(0.9),
        actions: [
          IconButton(
            onPressed: () {
              if (businessKey.currentState!.validate()) {
                businessKey.currentState!.save();
                Invoice.busi_name = business_name_controller.text;
                Invoice.busi_email = business_email_controller.text;
                Invoice.busi_address = business_address_controller.text;
                Invoice.busi_phone_no = business_phone_number_controller.text;
                Invoice.image;

                // print(Invoice.busi_name);
                // print(Invoice.busi_email);
                // print(Invoice.busi_address);
                // print(Invoice.busi_phone_no);

              }
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
        title: Text(
          "Business Details",
          style: appColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          height: _height * 0.87,
          width: _width,
          decoration: BoxDecoration(
              // color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5)),
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 50),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    InkWell(
                      onTap: () async {
                        XFile? pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          Invoice.image = File(pickedFile!.path);
                        });
                      },
                      child: CircleAvatar(
                        // backgroundColor: Colors.blue.shade200,
                        backgroundColor: Color(0xffdd6c44).withOpacity(0.1),
                        backgroundImage: (Invoice.image != null)
                            ? FileImage(Invoice.image!)
                            : null,
                        radius: 60,
                        child: (Invoice.image != null)
                            ? const Text("")
                            : const Text(
                                "Logo",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Form(
                  key: businessKey,
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Business Name",
                          style: textstyle,
                        ),
                        const SizedBox(height: 3),
                        business_Widget(
                            businessinfo_controller: business_name_controller,
                            hint_name: "Type Business name",
                            error_name: "Enter your business name ...",
                            type: TextInputType.text,
                            onSave: (val) {
                              setState(() {
                                Invoice.busi_name;
                              });
                            }),
                        Text(
                          "Email Address",
                          style: textstyle,
                        ),
                        const SizedBox(height: 3),
                        business_Widget(
                            businessinfo_controller: business_email_controller,
                            hint_name: "Type Email",
                            //label_name: "Email",
                            error_name: "Enter your email ...",
                            //busi_data: "${Globals.busi_email}",
                            type: TextInputType.emailAddress,
                            onSave: (val) {
                              setState(() {
                                Invoice.busi_email;
                              });
                            }),
                        Text(
                          "Phone Number",
                          style: textstyle,
                        ),
                        const SizedBox(height: 3),
                        business_Widget(
                            businessinfo_controller:
                                business_phone_number_controller,
                            hint_name: "Type Phone Number",
                            error_name: "Enter your phone no. ...",
                            type: TextInputType.number,
                            onSave: (val) {
                              setState(() {
                                Invoice.busi_phone_no;
                              });
                            }),
                        Text(
                          "Address",
                          style: textstyle,
                        ),
                        const SizedBox(height: 3),
                        business_Widget(
                            businessinfo_controller:
                                business_address_controller,
                            hint_name: "Address",
                            error_name: "Enter your address ...",
                            type: TextInputType.multiline,
                            onSave: (val) {
                              setState(() {
                                Invoice.busi_address;
                              });
                            }),
                        Text(
                          "Website",
                          style: textstyle,
                        ),
                        const SizedBox(height: 3),
                        business_Widget(
                            businessinfo_controller:
                                business_website_controller,
                            hint_name: "Type Website Address",
                            error_name: "Enter your website address ... ",
                            type: TextInputType.text,
                            onSave: (val) {
                              setState(() {
                                Invoice.busi_website;
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
