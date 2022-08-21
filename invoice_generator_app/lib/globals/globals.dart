// TextStyle? appstyle = TextStyle(
//   fontSize: 22,
// );

import 'dart:ui';

List<Map<String, dynamic>> alloptions = [
  {
    'id': 1,
    'icons': 'assets/icons/1.png',
    'title': "Business Info",
    'routes': 'business_info_page',
  },
  {
    'id': 2,
    'icons': 'assets/icons/2.png',
    'title': "Client Info",
    'routes': 'client_info_page',
  },
  {
    'id': 3,
    'icons': 'assets/icons/3.png',
    'title': "Invoice Info",
    'routes': 'invoice_info_page',
  },
  {
    'id': 4,
    'icons': 'assets/icons/4.png',
    'title': "Items",
    'routes': 'items_page',
  },
  {
    'id': 5,
    'icons': 'assets/icons/5.png',
    'title': "Payment ",
    'routes': 'payment',
  },
  // {
  //   'id': 6,
  //   'icons': 'assets/icons/6.png',
  //   'title': "PDF",
  //   'routes': 'pdf_page_',
  // }
];

class Global {
  static TextStyle? Button =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
}
