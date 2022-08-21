import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorPallet(),
    ),
  );
}

class ColorPallet extends StatefulWidget {
  const ColorPallet({Key? key}) : super(key: key);

  @override
  _ColorPalletState createState() => _ColorPalletState();
}

class _ColorPalletState extends State<ColorPallet> {
  @override
  Random r1 = Random();

  List colors = [
    Colors.pink,
    Colors.greenAccent,
    Colors.tealAccent,
    Colors.yellowAccent,
    Colors.lightBlueAccent,
    Colors.orange,
    Colors.lightGreen,
    Colors.blueGrey,
    Colors.cyan,
    Colors.white,
    Colors.purpleAccent,
    Colors.black,
    Colors.brown,
    Colors.redAccent,
    Colors.indigoAccent,
    Colors.black12,
    Colors.teal,
  ];

  radius(int n) {
    if (n == 0) {
      return const BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20));
    } else if (n == 5) {
      return const BorderRadius.only(
          bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20));
    } else {
      BorderRadius.circular(0);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFD8E6F4),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(
                  flex: 2,
                ),
                const Text(
                  "Color Palette\nGenerator",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF3BB3F9),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Column(
                  children: List.generate(
                      6,
                      (index) => Container(
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              color: colors[r1.nextInt(16)],
                              borderRadius: radius(index),
                            ),
                          )),
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF3BB3F9),
                      width: 3,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    "Generate",
                    style: TextStyle(
                        color: Color(0xFF3BB3F9),
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
