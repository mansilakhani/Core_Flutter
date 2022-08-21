import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals/globals.dart';

class DashBoard_Page extends StatefulWidget {
  const DashBoard_Page({Key? key}) : super(key: key);

  @override
  State<DashBoard_Page> createState() => _DashBoard_PageState();
}

class _DashBoard_PageState extends State<DashBoard_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // StatusBarIcon -> Permanent stable .........
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        title: const Text(
          "Contacts",
          style: TextStyle(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  // AppTheme.isDark = !AppTheme.isDark;
                });
              },
              icon: const Icon(
                Icons.circle_rounded,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor:
        //     (AppTheme.isDark == false) ? Colors.blue : Colors.greenAccent,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed('add_contact_Page');
          });
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: (Global.allContacts.isEmpty)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/open-box.png",
                    scale: 4,
                    // color: (AppTheme.isDark == false)
                    //     ? Colors.black
                    //     : Colors.white,
                  ),
                  Text(
                    "You have no contacts yet",
                    // style: TextStyle(
                    //   color: Colors.grey,
                    // ),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: Global.allContacts.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('details_page',
                          arguments: Global.allContacts[i]);
                    },
                    leading: CircleAvatar(
                      //radius: 26,
                      backgroundImage: (Global.allContacts[i].image != null)
                          ? FileImage(Global.allContacts[i].image as File)
                          : null,
                    ),
                    title: Text(
                      "${Global.allContacts[i].firstname} ${Global.allContacts[i].lastname}",
                    ),
                    subtitle: Text("+91 ${Global.allContacts[i].phonenumber}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () async {
                        // await canLaunchUrlString("tel:+91" + res.phonenumber);
                        // await launchUrlString("tel:+91" + res.phonenumber);

                        Uri url = Uri.parse(
                            "tel:+91${Global.allContacts[i].phonenumber}");

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Can't be launched ..."),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
