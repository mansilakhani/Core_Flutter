import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class Splash_Screen_Page extends StatefulWidget {
  const Splash_Screen_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Screen_Page> createState() => _Splash_Screen_PageState();
}

class _Splash_Screen_PageState extends State<Splash_Screen_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration duration = const Duration(seconds: 5);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            FlutterLogo(
              size: 200,
            ),
            CircularProgressIndicator(
              // color: Colors.blue,
              strokeWidth: 4,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            Text(
              "Made with ❤ in India",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
