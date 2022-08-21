import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_invoice_generator_app/Invoice_workspace_screens/business_info_page.dart';
import 'package:new_invoice_generator_app/Invoice_workspace_screens/client_info_page.dart';
import 'package:new_invoice_generator_app/Invoice_workspace_screens/payment.dart';
import 'package:new_invoice_generator_app/Screens/homepage.dart';
import 'package:new_invoice_generator_app/Screens/invoice_workspace_page.dart';
import 'package:new_invoice_generator_app/Screens/splash_screen_page.dart';

import 'Invoice_workspace_screens/Items_page.dart';
import 'Invoice_workspace_screens/add_new_item_page.dart';
import 'Invoice_workspace_screens/invoice_info_page.dart';
import 'Invoice_workspace_screens/pdf_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen_page',
      routes: {
        '/': (context) => Home_Page(),
        'invoice_workspace_page': (context) => Invoice_Workspace_Page(),
        'business_info_page': (context) => Business_Info_Page(),
        'client_info_page': (context) => Client_Info_Page(),
        'invoice_info_page': (context) => Invoice_Info_Page(),
        'items_page': (context) => Items_Page(),
        'add_new_item_page': (context) => Add_New_Item_Page(),
        'payment': (context) => Payment(),
        //'pdf_page_': (context) => Pdf_Page(),
        'pdf_page_dsg': (context) => const Pdf_Page(),
        'splash_screen_page': (context) => Splash_Screen_Page(),
      },
    ),
  );
}
