import 'dart:math';

import 'package:bmi_26/bmi_result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmi_calc(),
    ),
  );
}

class bmi_calc extends StatefulWidget {
  const bmi_calc({Key? key}) : super(key: key);

  @override
  State<bmi_calc> createState() => _bmi_calcState();
}

class _bmi_calcState extends State<bmi_calc> {
  double height = 175;
  double weight = 75;
  double age = 25;
  bool isMale = true;
  String message = '';
  double result = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090e21),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff0b0f1f),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Female
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !isMale
                                ? const Color(0xff3b3c4d)
                                : const Color(0xff1d1e33),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.female,
                                size: 100,
                                //color: Colors.white,
                                color: Color(0xffeb1555),
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  // color: Colors.white,
                                  color: Color(0xffeb1555),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Male
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isMale
                                  ? const Color(0xff3b3c4d)
                                  : const Color(0xff1d1e33)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.male,
                                size: 100,
                                //color: Color(0xffeb1555),
                                color: Colors.white,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontSize: 20,
                                  // color: Color(0xffeb1555),
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff1d1e33),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff626473),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        const Text(
                          ' cm',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff626473),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220.0,
                      min: 70.0,
                      thumbColor: const Color(0xffeb1555),
                      activeColor: const Color(0xfff5c1d1).withOpacity(0.2),
                      inactiveColor: const Color(0xff555555),
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff1d1e33),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${weight.toInt()}',
                              style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'weight',
                                  backgroundColor:
                                      const Color(0xfffffff).withOpacity(0.1),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 40,
                                    color: Color(0xff4c4f5e),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                FloatingActionButton(
                                  heroTag: 'weight+',
                                  backgroundColor: const Color(0xff6e6f7a),
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Color(0xfff67fa4),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff1b1a2e),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${age.toInt()}',
                              style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'age+',
                                  backgroundColor:
                                      const Color(0x0fffffff).withOpacity(0.1),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 40,
                                    color: Color(0xff4c4f5e),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 20),
                                FloatingActionButton(
                                  heroTag: 'age-',
                                  backgroundColor: const Color(0xff6e6f7a),
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Color(0xfff67fa4),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffe7144c),
            ),
            child: MaterialButton(
              onPressed: () {
                var result = weight / pow(height / 100, 2);
                if (result < 18.5) {
                  message = "You are underweight";
                } else if (result < 25) {
                  message = 'You body is fine';
                } else if (result < 30) {
                  message = 'You are overweight';
                } else {
                  message = 'You are obese';
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        height: height,
                        weight: weight,
                        age: age,
                        isMale: isMale,
                        message: message,
                        result: result,
                      ),
                    ));
              },
              child: const Text(
                'Calculator',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
