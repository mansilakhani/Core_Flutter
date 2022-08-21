import 'package:flutter/material.dart';

import '../questions_bank/questionsbank.dart';

class Lost_Page extends StatefulWidget {
  const Lost_Page({Key? key}) : super(key: key);

  @override
  State<Lost_Page> createState() => _Lost_PageState();
}

class _Lost_PageState extends State<Lost_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 8,
            ),
            Image.asset(
              'assets/images/lose.png',
              scale: 5,
            ),

            const Text(
              "oops!",
              style: TextStyle(
                color: Color(0xffd4d4ff),
                fontSize: 20,
              ),
            ),
            const Spacer(flex: 1),
            //  SizedBox(height: 40),
            const Text(
              "Sorry You are\n     the lost ",
              style: TextStyle(color: Color(0xffd4d4ff), fontSize: 20),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //foregroundColor: const Color(0xffd6d6d6),
                  backgroundColor: const Color(0xff1e1f23),
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 66,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                  initialquestion = 0;
                },
                child: const Text(
                  "Try again",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffd4d4ff),
                  ),
                )),
            const Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
