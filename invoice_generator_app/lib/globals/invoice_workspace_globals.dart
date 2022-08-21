import 'dart:io';

class Invoice {
  ///Business Info :-
  static String? busi_name;
  static String? busi_email;
  static String? busi_address;
  static String? busi_phone_no;
  static String? busi_website;
  static File? image;

  /// Client Info :-
  static String? client_name;
  static String? client_email;
  static String? client_address;
  static String? client_phone_no;

  /// Invoice Info :-
  static String? invoice_number;
  static String? invoice_date;
  static String? invoice_due_date;
  //static List<String> invoicedate = [];

  // Items :-
  // static String? item_name;
  // static double? item_unitcost;
  // // static int? item_quantity;
  // static List<String> allitems_detail = [];

  // Invoice({
  //   /// Business
  //   this.image,
  // });
}

/// Items :-

class Item {
  String item_name;
  double unit_cost;
  int item_quantity;
  //double item_discount;
  //double item_discount;
  // double? total = 0;
  //double subtotal = 0;
  // double discount = 0;
  // double balance = 0;

  Item({
    required this.item_name,
    required this.unit_cost,
    required this.item_quantity,
    //this.item_discount,
    // required this.item_discount,
    // this.total,
  });
}

class Global_Item {
  static String? item_name;
  static double? unit_cost;
  static double? item_quantity;
  static double? item_discount;
  static double total = 0;
  //static double discount = 0;

  ///
  static double subtotal = 0;
  static List? total_list;
  static List? cgst_list;
  static List? final_tl_list; // final_total_List;
  static double sum = 0;
  static double gst_ = 0; // cgst
  static double gst = 0; //sgst
  static double balance = 0;
  static double rate = 5;

  static List? balance_list;
  static List? final_total;

  static List<Item> AllItems_details = [];
}

List<String> toList() => [];
// class Itemlist {
//   final String? item_name;
//   final double? item_unitcost;
//   //final double item_quantity;
//   //final String? item_discount;
//   late double? total;
//
//   Itemlist({
//     required this.item_name,
//     required this.item_unitcost,
//     //required this.item_quantity,
//     //required this.item_discount,
//     this.total,
//   });
// }
//
// class Global_Item {
//   String? item_name;
//   double price = 0;
//   //double item_quantity = 0;
//   double total = 0;
//   double subtotal = 0;
//   //double discount = 0;
//   static List<Itemlist> AllItems_details = [];
// }
//
// //int quantity = 0;
