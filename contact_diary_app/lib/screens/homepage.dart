import 'package:ch_14_contact_diary_app/screens/add_contact_page.dart';
import 'package:ch_14_contact_diary_app/screens/edit_page.dart';
import 'package:ch_14_contact_diary_app/screens/splash_screen_page.dart';
import 'package:flutter/material.dart';

import 'dashboard_page.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.lighttheme,
      // darkTheme: AppTheme.darktheme,
      // themeMode: (AppTheme.isDark == true) ? ThemeMode.dark : ThemeMode.light,
      initialRoute: 'splash_screen_page',
      routes: {
        '/': (context) => const DashBoard_Page(),
        'add_contact_Page': (context) => const Add_Contact_Page(),
        'details_page': (context) => const Details_Page(),
        'edit_page': (context) => const Edit_Page(),
        'splash_screen_page': (context) => const Splash_Screen_Page(),
      },
    );
  }
}
