import 'package:flutter/material.dart';
import 'package:kbc_app/screens/congratulation_page.dart';
import 'package:kbc_app/screens/correct_page.dart';
import 'package:kbc_app/screens/homepage.dart';
import 'package:kbc_app/screens/lost_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'correct_page': (context) => const Correct_Page(),
        'lost_page': (context) => const Lost_Page(),
        'congratulation_page': (context) => const Congratulations_Page(),
      },
    ),
  );
}
