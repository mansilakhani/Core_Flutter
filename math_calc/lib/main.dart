import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCal(),
    ),
  );
}

class MyCal extends StatefulWidget {
  const MyCal({Key? key}) : super(key: key);
  @override
  State<MyCal> createState() => _MyCalState();
}

class _MyCalState extends State<MyCal> {
  var MyStyle = const TextStyle(
    fontSize: 35,
    color: Colors.white,
  );
  var MyStyle2 = const TextStyle(
    fontSize: 35,
    color: Color(0xffff5a66),
  );
  var m1 = [7, 8, 9, "*"];
  var m2 = [4, 5, 6, "-"];
  var m3 = [1, 2, 3, "+"];
  var m4 = ["00", 0, ".", "="];
  var input = 0;
  var input2 = 0;
  var opp = "0";
  var total = 0;
  var out = 0;
  var stop = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xff2e2d32),
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      (opp == "0")
                          ? "$input"
                          : (input2 == 0)
                              ? "$input $opp"
                              : "$input $opp $input2",
                      style: const TextStyle(
                        fontSize: 40,
                        color: Color(0xff8d8d8d),
                      ),
                    ),
                    (out == 1)
                        ? Text(
                            "$total",
                            style: const TextStyle(
                              fontSize: 60,
                              color: Color(0xffffffff),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: const Color(0xff2e2d32),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              input = 0;
                              input2 = 0;
                              opp = "0";
                              out = 0;
                              stop = 0;
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 65,
                              width: 170,
                              alignment: Alignment.center,
                              child: const Text(
                                "AC",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xffff5a66),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              opp = "%";
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                "%",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Color(0xff929292),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              opp = "/";
                            });
                          },
                          child: Ink(
                            child: Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              child: Text(
                                "/",
                                style: MyStyle2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: m1.map((e) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (e == "*") {
                                    opp = "*";
                                  } else if (opp == "0") {
                                    if (e == 9) {
                                      input = (input * 10) + 9;
                                    } else if (e == 8) {
                                      input = (input * 10) + 8;
                                    } else if (e == 7) {
                                      input = (input * 10) + 7;
                                    }
                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (e == 9 && stop == 0) {
                                      input2 = (input2 * 10) + 9;
                                    } else if (e == 8 && stop == 0) {
                                      input2 = (input2 * 10) + 8;
                                    } else if (e == 7 && stop == 0) {
                                      input2 = (input2 * 10) + 7;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 100,
                                  width: 96,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$e",
                                    style: (e == "*") ? MyStyle2 : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: m2.map((e) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (e == "-") {
                                    opp = "-";
                                  } else if (opp == "0") {
                                    if (e == 6) {
                                      input = (input * 10) + 6;
                                    } else if (e == 5) {
                                      input = (input * 10) + 5;
                                    } else if (e == 4) {
                                      input = (input * 10) + 4;
                                    }
                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (e == 6 && stop == 0) {
                                      input2 = (input2 * 10) + 6;
                                    } else if (e == 5 && stop == 0) {
                                      input2 = (input2 * 10) + 5;
                                    } else if (e == 4 && stop == 0) {
                                      input2 = (input2 * 10) + 4;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 100,
                                  width: 96,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$e",
                                    style: (e == "-") ? MyStyle2 : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: m3.map((e) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (e == "+") {
                                    opp = "+";
                                  } else if (opp == "0") {
                                    if (e == 3) {
                                      input = (input * 10) + 3;
                                    } else if (e == 2) {
                                      input = (input * 10) + 2;
                                    } else if (e == 1) {
                                      input = (input * 10) + 1;
                                    }
                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (e == 3 && stop == 0) {
                                      input2 = (input2 * 10) + 3;
                                    } else if (e == 2 && stop == 0) {
                                      input2 = (input2 * 10) + 2;
                                    } else if (e == 1 && stop == 0) {
                                      input2 = (input2 * 10) + 1;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: 100,
                                  width: 96,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$e",
                                    style: (e == "+") ? MyStyle2 : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: m4.map((e) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  if (opp == "0") {
                                    if (e == "00") {
                                      input = input * 100;
                                    } else if (e == 0) {
                                      input = input * 10;
                                    }
// else if (e == ".") {
// input = (input * 0.10);
// }
                                  } else if (opp == "+" ||
                                      opp == "-" ||
                                      opp == "*" ||
                                      opp == "/" ||
                                      opp == "%") {
                                    if (e == "00" && stop == 0) {
                                      input2 = input2 * 100;
                                    } else if (e == 0 && stop == 0) {
                                      input2 = input2 * 10;
                                    }
// else if (e == ".") {
// input2 = (input2 * 0.10);
// }
                                  }
                                  if (e == "=") {
                                    stop = 1;
                                    out = 1;
                                    if (opp == "%") {
                                      total = input % input2;
                                    } else if (opp == "/") {
                                      total = input ~/ input2;
                                    } else if (opp == "*") {
                                      total = input * input2;
                                    } else if (opp == "-") {
                                      total = input - input2;
                                    } else if (opp == "+") {
                                      total = input + input2;
                                    }
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  height: (e == "=") ? 80 : 100,
                                  width: (e == "=") ? 80 : 100,
                                  alignment: Alignment.center,
                                  decoration: (e == "=")
                                      ? const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffff5a66),
                                        )
                                      : const BoxDecoration(),
                                  child: Text(
                                    "$e",
                                    style: (e == "=")
                                        ? const TextStyle(
                                            fontSize: 40,
                                            color: Colors.white,
                                          )
                                        : MyStyle,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
