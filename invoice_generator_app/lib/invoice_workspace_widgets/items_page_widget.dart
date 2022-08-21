import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Card-1 :-
Container headlineWidget(
    {required double height,
    required double width,
    //required Color color,
    required String text}) {
  return Container(
    alignment: Alignment.center,
    height: height,
    width: width,
    decoration: BoxDecoration(
        border: Border(
            right: BorderSide(
      width: 1.5,
      color: const Color(0xffdd6c44).withOpacity(0.9),
    ))),
    //color: color,
    child: Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}

/// Card-2 :-

Container table({
  required double height,
  required double width,
  required String text2,
}) {
  return Container(
    alignment: Alignment.center,
    height: height,
    width: width,
    child: Text(
      text2,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),
    decoration: BoxDecoration(
        border: Border(
            right: BorderSide(
      width: 1.5,
      color: const Color(0xffdd6c44).withOpacity(0.9),
    ))),
  );
}
