import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: gstCalc(),
  ));
}

class gstCalc extends StatefulWidget {
  const gstCalc({Key? key}) : super(key: key);

  @override
  State<gstCalc> createState() => _gstCalcState();
}

class _gstCalcState extends State<gstCalc> {
  Color? c1 = null;
  Color? c2 = null;
  Color? c3 = null;
  Color? c4 = null;
  Color? c5 = null;
  Color tc1 = Colors.black87;
  Color tc2 = Colors.black87;
  Color tc3 = Colors.black87;
  Color tc4 = Colors.black87;
  Color tc5 = Colors.black87;

  double CSGST = 00.00;
  double GSTrate = 0.0;
  String OP = "0.0";
  double FP = 0.0;

  ValueButton({@required String s = "00"}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.09,
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (OP == "0.0") {
              OP = "";
            }
            if (s == "") {
              if (OP.contains(".") == false) {
                OP = OP + s;
              }
            } else {
              OP = OP + s;
            }
          });
        },
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Color(0xffeeeeee),
        child: Text(
          s,
          style: TextStyle(
            color: Color(0xff252427),
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  ControlButton({
    @required String s = "",
    @required OnPressed,
    double size = 20,
  }) {
    return InkWell(
      onTap: OnPressed,
      borderRadius: BorderRadius.circular(50),
      child: Ink(
        decoration: BoxDecoration(
            //color: Color(0xfff6b00),
            //color: Colors.orange,
            borderRadius: BorderRadius.circular(50)
            // borderRadius: BorderRadius.circular(50),
            ),
        height: 155,
        width: 70,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              //color: Colors.black,
              color: Color(0xffff6b00)),
          child: Text(
            s,
            style: TextStyle(
              color: Color(0xffeeeeee),
              fontSize: size,
              fontWeight: FontWeight.w500,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.224,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ORIGINAL PRICE",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252427),
                  ),
                ),
                Text(
                  "$OP Rs",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252427),
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffeeeeee),
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 30, right: 30),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.095,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffeeeeee),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'GST',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252427),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          GSTrate = 3.00;
                          CSGST = (double.parse(OP) * GSTrate) / 200;
                          FP = double.parse(OP) + CSGST * 2;
                          if (c1 == const Color(0xff252427) &&
                              tc1 == Colors.white) {
                            c1 = Colors.black;
                            tc1 = const Color(0x0fff6b00);
                            c2 = Colors.white;
                            tc2 = const Color(0xff252427);
                            c3 = Colors.white;
                            tc3 = const Color(0xff252427);
                            c4 = Colors.white;
                            tc4 = const Color(0xff252427);
                            c5 = Colors.white;
                            tc5 = const Color(0xff252427);
                          } else {
                            c1 = const Color(0xffff6b00);
                            tc1 = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.19,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          "3%",
                          style: TextStyle(
                            color: tc1,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: c1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          GSTrate = 5.00;
                          CSGST = (double.parse(OP) * GSTrate) / 200;
                          FP = double.parse(OP) + CSGST * 2;
                          if (c2 == const Color(0xff252427) &&
                              tc2 == Colors.white) {
                            c2 = const Color(0xfff6b00);
                            tc2 = Colors.black;
                            c1 = const Color(0xff252427);
                            tc1 = Colors.white;
                            c3 = const Color(0xff252427);
                            tc3 = Colors.white;
                            c4 = const Color(0xff252427);
                            tc4 = Colors.white;
                            c5 = const Color(0xff252427);
                            tc5 = Colors.white;
                          } else {
                            c2 = const Color(0xffff6b00);
                            tc2 = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.19,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          "5%",
                          style: TextStyle(
                            color: tc2,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: c2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          GSTrate = 12.00;
                          CSGST = (double.parse(OP) * GSTrate) / 200;
                          FP = double.parse(OP) + CSGST * 2;
                          if (c3 == const Color(0xff252427) &&
                              tc3 == Colors.white) {
                            c3 = const Color(0x0fff6b00);
                            tc3 = Colors.black;
                            c1 = const Color(0xff252427);
                            tc1 = Colors.white;
                            c2 = const Color(0xff252427);
                            tc2 = Colors.white;
                            c4 = const Color(0xff252427);
                            tc4 = Colors.white;
                            c5 = const Color(0xff252427);
                            tc5 = Colors.white;
                          } else {
                            c3 = const Color(0xffff6b00);
                            tc3 = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.19,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          "12%",
                          style: TextStyle(
                            color: tc3,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: c3,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          GSTrate = 18.00;
                          CSGST = (double.parse(OP) * GSTrate) / 200;
                          FP = double.parse(OP) + CSGST * 2;
                          if (c4 == const Color(0xff252427) &&
                              tc4 == Colors.white) {
                            c4 == const Color(0x0fff6b00);
                            tc4 = Colors.black;
                            c1 = const Color(0xff252427);
                            tc1 = Colors.white;
                            c2 = const Color(0xff252427);
                            tc2 = Colors.white;
                            c3 = const Color(0xff252427);
                            tc3 = Colors.white;
                            c5 = const Color(0xff252427);
                            tc5 = Colors.white;
                          } else {
                            c4 = const Color(0xffff6b00);
                            tc4 = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.19,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          "18%",
                          style: TextStyle(
                            color: tc4,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: c4,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          GSTrate = 18.00;
                          CSGST = (double.parse(OP) * GSTrate) / 200;
                          FP = double.parse(OP) + CSGST * 2;
                          if (c5 == Colors.orange && tc5 == Colors.white) {
                            c1 == const Color(0x0fff6b00);
                            tc1 = Colors.black;
                            c3 = Colors.orange;
                            tc3 = Colors.white;
                            c4 = Colors.orange;
                            tc4 = Colors.white;
                            c2 = Colors.orange;
                            tc2 = Colors.white;
                          } else {
                            c5 = const Color(0xffff6b00);
                            tc5 = Colors.white;
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.19,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Text(
                          "28%",
                          style: TextStyle(
                            color: tc4,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: c5,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "FINAL PRICE",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252427),
                  ),
                ),
                Text(
                  "$FP Rs",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252427),
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffeeeeee),
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 30, right: 30),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "CGST/SGST",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252427),
                  ),
                ),
                Text(
                  '$CSGST',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff252427),
                  ),
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.095,
            width: MediaQuery.of(context).size.width * 0.68,
            decoration: BoxDecoration(
              color: const Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 10),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,

            //color: Colors.red,
            color: const Color(0xffeeeeee),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ValueButton(s: "7"),
                          ValueButton(s: "8"),
                          ValueButton(s: "9"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ValueButton(s: "4"),
                          ValueButton(s: "5"),
                          ValueButton(s: "6"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ValueButton(s: "1"),
                          ValueButton(s: "2"),
                          ValueButton(s: "3"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ValueButton(s: "00"),
                          ValueButton(s: "0"),
                          ValueButton(s: "."),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ControlButton(
                          s: "AC",
                          OnPressed: () {
                            setState(() {
                              FP = 0.0;
                              OP = "0.0";
                              CSGST = 0.0;
                            });
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      ControlButton(
                          s: "⌫",
                          size: 25,
                          OnPressed: () {
                            setState(() {
                              if (OP != "0.0" || OP != "") {
                                OP = OP.substring(0, OP.length - 1);
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 1),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
