import 'dart:io';

import 'package:ch_14_contact_diary_app/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/contacts_models.dart';
import '../resources/app_theme.dart';

class Edit_Page extends StatefulWidget {
  const Edit_Page({Key? key}) : super(key: key);

  @override
  State<Edit_Page> createState() => _Edit_PageState();
}

class _Edit_PageState extends State<Edit_Page> {
  final GlobalKey<FormState> editcontactkey = GlobalKey<FormState>();

  final TextEditingController first_name_Controller = TextEditingController();
  final TextEditingController last_name_Controller = TextEditingController();
  final TextEditingController email_Controller = TextEditingController();
  final TextEditingController phone_number_Controller = TextEditingController();

  ImagePicker _picker = ImagePicker();

  File? image;
  String? first_name;
  String? last_name;
  String? email;
  String? phone_number;

  TextStyle mystyle = const TextStyle(
    fontSize: 18,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    first_name_Controller.text = res.firstname;
    last_name_Controller.text = res.lastname;
    email_Controller.text = res.email;
    phone_number_Controller.text = res.phonenumber;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor:
        //     (AppTheme.isDark == false) ? Colors.white : Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              // color: (AppTheme.isDark == false) ? Colors.white : Colors.black,
            ),
            onPressed: () {
              if (editcontactkey.currentState!.validate()) {
                editcontactkey.currentState!.save();

                Contact c = Contact(
                  firstname: first_name,
                  lastname: last_name,
                  email: email,
                  phonenumber: phone_number,
                  image: image,
                );
                int i = Global.allContacts.indexOf(res);
                Global.allContacts[i] = c;
                setState(() {
                  Navigator.of(context).pushReplacementNamed("/");
                });
              }
            },
          ),
        ],
        title: Text(
          "Add",
          style: TextStyle(
            color: (AppTheme.isDark == false) ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: (image != null) ? FileImage(image!) : null,
                    child: (image != null)
                        // ? const Text("")
                        ? Container()
                        : const Text(
                            "ADD",
                            style: TextStyle(color: Colors.black),
                          ),
                    radius: 40,
                    // backgroundColor: (AppTheme.isDark == false)
                    //     ? Colors.grey
                    //     : Colors.white,
                    // backgroundColor: Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, left: 60),
                        height: 20,
                        width: 20,
                        child: InkWell(
                          onTap: () async {
                            XFile? pickedImage = await _picker.pickImage(
                              source:
                                  ImageSource.camera, // ImageSource.gallery,
                            );
                            setState(() {
                              image = File(pickedImage!.path);
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.all(12),
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: editcontactkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First name",
                          style: mystyle,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your first name",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                          controller: first_name_Controller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your first name .....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              first_name = val;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Last name",
                          style: mystyle,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your last name",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                          controller: last_name_Controller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your last name .....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              last_name = val;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Phone number",
                          style: mystyle,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your phone number",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                          controller: phone_number_Controller,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your phone number .....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              phone_number = val;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Email",
                          style: mystyle,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your email",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.grey,
                              ))),
                          controller: email_Controller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter your email .....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
