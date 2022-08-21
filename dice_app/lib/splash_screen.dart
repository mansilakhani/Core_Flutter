import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration duration = const Duration(minutes: 1);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlutterLogo(
              size: 200,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                //color: Colors.blue,
                strokeWidth: 3,
                //value: 0.8,
                valueColor: new AlwaysStoppedAnimation<Color>(
                    // Color(0xff234ca4),
                    Colors.blue),
                backgroundColor: Colors.grey,
              ),
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
