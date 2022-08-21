import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../globals/globals.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({Key? key}) : super(key: key);

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!
        .settings
        .arguments; // Context generate in this class

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Contacts",
          style: TextStyle(
              // color: (AppTheme.isDark) ? Colors.white : Colors.black,
              ),
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
                // color: (AppTheme.isDark == false) ? Colors.black : Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                // color: (AppTheme.isDark == false) ? Colors.black : Colors.white,
              )),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(flex: 5),
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      (res.image != null) ? FileImage(res.image!) : null,
                ),
                const Spacer(flex: 1),
                IconButton(
                    onPressed: () {
                      Global.allContacts.remove(res);
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    },
                    icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed("edit_page", arguments: res);
                    },
                    icon: const Icon(Icons.edit)),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            Text("${res.firstname} ${res.lastname}"),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                Text('+91 ${res.phonenumber}'),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(
              thickness: 1,
              //height: 25,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  backgroundColor: Colors.green,
                  onPressed: () async {
                    // await canLaunchUrlString("tel:+91" + res.phonenumber);
                    // await launchUrlString("tel:+91" + res.phonenumber);
                    // Or .......

                    Uri url = Uri.parse("tel:+91${res.phonenumber}");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Can't be launched",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Icon(
                    Icons.call,
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  backgroundColor: Colors.amber,
                  onPressed: () async {
                    // await canLaunchUrlString("sms:+91" + res.phonenumber);
                    // await launchUrlString("sms:+91" + res.phonenumber);

                    // Or

                    Uri url = Uri.parse("sms:+91${res.phonenumber}");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Can't be launched ...",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Icon(Icons.message),
                ),
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  backgroundColor: Colors.lightBlue,
                  onPressed: () async {
                    await canLaunchUrlString("mailto:+91" + res.phonenumber);
                    await launchUrlString("mailto:+91" + res.phonenumber);

                    // Or

                    // Uri url = Uri.parse("mailto:+91${res.phonenumber}");
                    // if (await canLaunchUrl(url)) {
                    //   await canLaunchUrl(url);
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     content: Text(
                    //       "Can't be launched ...",
                    //     ),
                    //     backgroundColor: Colors.red,
                    //     behavior: SnackBarBehavior.floating,
                    //   ));
                    //}
                  },
                  child: const Icon(Icons.email),
                ),
                FloatingActionButton(
                  heroTag: null,
                  mini: true,
                  backgroundColor: Colors.orange,
                  onPressed: () async {
                    await Share.share("+91 ${res.phonenumber}");
                  },
                  child: const Icon(Icons.share),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(
              //height: 25,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            ),
            const Spacer(flex: 7),
          ],
        ),
      ),
    );
  }
}
