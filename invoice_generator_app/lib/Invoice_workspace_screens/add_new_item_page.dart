import 'package:flutter/material.dart';
import 'package:new_invoice_generator_app/globals/invoice_workspace_globals.dart';

class Add_New_Item_Page extends StatefulWidget {
  const Add_New_Item_Page({Key? key}) : super(key: key);

  @override
  State<Add_New_Item_Page> createState() => _Add_New_Item_PageState();
}

class _Add_New_Item_PageState extends State<Add_New_Item_Page> {
  final GlobalKey<FormState> add_newitem_key = GlobalKey<FormState>();
  final TextEditingController itemNameInputController = TextEditingController();
  final TextEditingController itemUnitcostInputController =
      TextEditingController();
  final TextEditingController itemQtyInputController = TextEditingController();

  String? itemname;
  double? unitcost;
  int? quantity;
  double? itemdiscount;

  // String itemunitcost = '0';
  // String itemquantity = "0";
  //String item_discount = "0";
  // String total = "0";

  var appColor = TextStyle(fontSize: 22);
  var textstyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: const Color(0xffdd6c44).withOpacity(0.9),
        title: Text(
          "Add New Item",
          style: appColor,
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (add_newitem_key.currentState!.validate()) {
                  add_newitem_key.currentState!.save();

                  Item I = Item(
                    item_name: itemname as String,
                    unit_cost: unitcost as double,
                    item_quantity: quantity as int,
                    //item_discount: itemdiscount as double,
                  );

                  setState(() {
                    Global_Item.AllItems_details.add(I);
                  });
                  setState(() {
                    List m = [];
                    Global_Item.AllItems_details.map((e) {
                      Global_Item.sum = e.unit_cost * e.item_quantity;
                      // Global_Item.discount =
                      //     Global_Item.sum * (Global_Item.item_discount! / 100);
                      m.add(Global_Item.sum);
                      // Global_Item.subtotal = Global_Item.sum;
                      // Global_Item.balance =
                      //     Global_Item.subtotal - Global_Item.discount;
                      //m.add(Global_Item.sum);
                      // m.add(Global_Item.discount);
                    }).toList();
                    Global_Item.sum = m.fold(0, (p, e) => p + e);
                    // Global_Item.gst_ =
                    //     (Global_Item.sum * Global_Item.rate) / 200;
                    // Global_Item.gst =
                    //     (Global_Item.sum * Global_Item.rate) / 200;
                    // Global_Item.total =
                    //     Global_Item.sum + Global_Item.gst_ + Global_Item.gst;

                    // Global_Item.total = Global_Item.sum + Global_Item.gst;
                    Global_Item.total = Global_Item.sum;
                    // Global_Item.balance =
                    //     Global_Item.sum - Global_Item.discount;
                    // Global_Item.total = (Global_Item.balance);

                    print(Global_Item.total);

                    //Global_Item.subtotal = Global_Item.sum;
                    //Global_Item.total = Global_Item.sum;

                    // Global_Item.total_list?.forEach((element) {
                    //   Global_Item.total = Global_Item.total + element;
                    //});
                  });
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _height * 0.85,
              width: _width,
              margin: const EdgeInsets.all(12),
              //color: Colors.grey.shade300,
              child: Form(
                key: add_newitem_key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Item Name",
                          style: textstyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter item name ...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            itemname = val;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            hintText: "Type Item Name",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Unit Cost",
                          style: textstyle,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 80),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Unit cost";
                            }
                          },
                          onSaved: (val) {
                            // itemunitcost = val!;
                            unitcost = double.parse(val!);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            hintText: "0.00",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Quantity",
                          style: textstyle,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 80),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Quantity ....";
                            }
                          },
                          onSaved: (val) {
                            // itemquantity = val!;
                            quantity = int.parse(val!);
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            hintText: "0",
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10, left: 10),
                      //   child: Text(
                      //     "Discount",
                      //     style: textstyle,
                      //   ),
                      // ),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(top: 10, left: 10, right: 80),
                      //   child: TextFormField(
                      //     validator: (val) {
                      //       if (val!.isEmpty) {
                      //         return "Enter discount ....";
                      //       }
                      //     },
                      //     onSaved: (val) {
                      //       itemdiscount = double.parse(val!);
                      //     },
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(6),
                      //       ),
                      //       hintText: "0 %",
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
