import 'package:flutter/material.dart';

import '../questions_bank/questionsbank.dart';

class Congratulations_Page extends StatefulWidget {
  const Congratulations_Page({Key? key}) : super(key: key);

  @override
  State<Congratulations_Page> createState() => _Congratulations_PageState();
}

class _Congratulations_PageState extends State<Congratulations_Page> {
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
              'assets/images/firecracker.png',
              scale: 5,
            ),

            const Text(
              "Congratulations",
              style: TextStyle(
                color: Color(0xfff5b5f62),
                fontSize: 20,
              ),
            ),
            const Spacer(flex: 1),
            //  SizedBox(height: 40),
            const Text(
              "Game over",
              style: TextStyle(color: Color(0xffffffff), fontSize: 20),
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
                    horizontal: 68,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                    initialquestion = 0;
                  });
                },
                child: const Text(
                  "Restart",
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
