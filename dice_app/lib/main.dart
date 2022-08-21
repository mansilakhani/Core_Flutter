import 'dart:math';

import 'package:dice_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //  home: Dice_App(),
    initialRoute: 'splash_screen',
    routes: {
      '/': (context) => Dice_App(),
      'splash_screen': (context) => SplashScreen(),
    },
  ));
}

class Dice_App extends StatefulWidget {
  const Dice_App({Key? key}) : super(key: key);

  @override
  State<Dice_App> createState() => _Dice_AppState();
}

class _Dice_AppState extends State<Dice_App> {
  int dice1 = 1;
  int dice2 = 2;

  int totalAmount = 3;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * .8485;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff91B3CE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Text(
              'Total Amount: $totalAmount',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff234ca4),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: rollDice,
                  child: Image.asset(
                    'assets/images/$dice1.png',
                    height: 170,
                  ),
                ),
                InkWell(
                  onTap: rollDice,
                  child: Image.asset(
                    'assets/images/$dice2.png',
                    height: 170,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            InkWell(
              onTap: rollDice,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Button.png'),
                  const Text(
                    'Roll Dice',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void rollDice() {
    Random random = Random();

    setState(() {
      Random random = Random();
      setState(() {
        dice1 = random.nextInt(7);
        dice2 = random.nextInt(7);

        if (dice1 == 0) dice1++;
        if (dice2 == 0) dice2++;

        totalAmount = dice1 + dice2;
      });
    });
  }
}
