import 'dart:async';

import 'package:flutter/material.dart';

class Splash_Screen_Page extends StatefulWidget {
  const Splash_Screen_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Screen_Page> createState() => _Splash_Screen_PageState();
}

class _Splash_Screen_PageState extends State<Splash_Screen_Page> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration duration = const Duration(seconds: 3);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff4e8faf).withOpacity(0.3),
      //backgroundColor: Color(0xffdd6c44).withOpacity(0.8),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Container(
        // height: double.infinity,
        //color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/invoice_lab.png",
              //scale: 1.5,
              //scale: 2.3,
              scale: 2.5,
              //color: Colors.white,
              // color: const Color(0xffacd4b9),
            ),
            //const SizedBox(height: 5),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Invoice",
                  style: TextStyle(
                    color: Color(0xfff87547),
                    letterSpacing: 0.3,
                    wordSpacing: 2,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )),
              TextSpan(
                text: "Labs",
                style: TextStyle(
                  //color: Colors.blue,
                  color: Color(0xff0d6b99),
                  letterSpacing: 0.3,
                  wordSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              )
            ])),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              strokeWidth: 2.6,
              backgroundColor: Color(0xfff87547).withOpacity(0.3),
              color: Color(0xff0d6b99).withOpacity(0.7),
            ),
            //Text("Made with in India")
          ],
        ),
      ),
    );
  }
}
