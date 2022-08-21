import 'package:flutter/material.dart';

import '../questions_bank/questionsbank.dart';

class Correct_Page extends StatefulWidget {
  const Correct_Page({Key? key}) : super(key: key);

  @override
  State<Correct_Page> createState() => _Correct_PageState();
}

class _Correct_PageState extends State<Correct_Page> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
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
              'assets/images/firecracker.png',
              scale: 5,
            ),

            const Text(
              "Your Answer Is Correct",
              style: TextStyle(
                color: Color(0xfffa6a83),
                fontSize: 20,
              ),
            ),
            const Spacer(flex: 1),
            //  SizedBox(height: 40),
            Text(
              "You Won\n ₹ $res",
              style: const TextStyle(color: Color(0xffC78640), fontSize: 20),
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
                  vertical: 12,
                  horizontal: 72,
                ),
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                  initialquestion++;

                  if (initialquestion > Questions.length - 1) {
                    Navigator.of(context).pushNamed("congratulation_page");
                  }
                });
              },
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffd4d4ff),
                ),
              ),
            ),
            const Spacer(
              flex: 7,
            ),
          ],
        ),
      ),
    );
  }
}
