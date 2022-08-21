import 'package:flutter/material.dart';

import '../globals/invoice_workspace_globals.dart';
import '../invoice_workspace_widgets/items_page_widget.dart';

class Items_Page extends StatefulWidget {
  const Items_Page({Key? key}) : super(key: key);

  @override
  State<Items_Page> createState() => _Items_PageState();
}

class _Items_PageState extends State<Items_Page> {
  var appColor = TextStyle(fontSize: 22);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: const Color(0xffdd6c44).withOpacity(0.9),
          title: Text(
            "Add Item Details",
            style: appColor,
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: _height * 0.07,
                      width: _width,
                      //color: Colors.grey.shade300,
                      color: Colors.white.withOpacity(0.7),
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context)
                                      .pushNamed('add_new_item_page');
                                });
                              },
                              icon: CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    const Color(0xffdd6c44).withOpacity(0.9),
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              )),
                          const Text(
                            "New Items",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        ],
                      )),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color:
                                      const Color(0xffdd6c44).withOpacity(0.9),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                headlineWidget(
                                  height: _height * 0.06,
                                  width: _width * 0.305,
                                  //color: Colors.red,
                                  text: "Item Name",
                                ),
                                headlineWidget(
                                  height: _height * 0.06,
                                  width: _width * 0.163,
                                  //color: Colors.blue,
                                  text: "Price",
                                ),
                                headlineWidget(
                                  height: _height * 0.06,
                                  width: _width * 0.120,
                                  //color: Colors.amber,
                                  text: "Qty",
                                ),
                                // headlineWidget(
                                //     height: _height * 0.06,
                                //     width: _width * 0.078,
                                //     //color: Colors.greenAccent,
                                //     text: "Dis"),
                                headlineWidget(
                                    height: _height * 0.06,
                                    width: _width * 0.19,
                                    //color: Colors.purpleAccent,
                                    text: "Total"),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.delete,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ...Global_Item.AllItems_details.map(
                          (e) => Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SizedBox(
                                  height: _height * 0.06,
                                  width: _width * 0.97,
                                  child: Card(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Color(0xffdd6c44)
                                              .withOpacity(0.9),
                                        )),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        table(
                                            height: _height * 0.06,
                                            width: _width * 0.305,
                                            text2: "${e.item_name}"),
                                        table(
                                            height: _height * 0.06,
                                            width: _width * 0.163,
                                            text2: "${e.unit_cost.toInt()}"),
                                        table(
                                            height: _height * 0.06,
                                            width: _width * 0.120,
                                            text2:
                                                "${e.item_quantity.toInt()}"),
                                        // table(
                                        //     height: _height * 0.06,
                                        //     width: _width * 0.078,
                                        //     text2:
                                        //         "${e.item_discount.toInt()}"),
                                        table(
                                            height: _height * 0.06,
                                            width: _width * 0.19,
                                            text2:
                                                "${(e.unit_cost * e.item_quantity)}"),
                                        // "${(e.unit_cost * e.item_quantity) - ((e.unit_cost * e.item_quantity) * (e.item_discount / 100))}"),
                                        // "${e.unit_cost.toInt() * (e.item_discount / 100)}"),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                Global_Item.AllItems_details
                                                    .removeAt(Global_Item
                                                            .AllItems_details
                                                        .indexOf(e));
                                              });
                                            },
                                            icon: const Icon(Icons.remove)),

                                        // IconButton(
                                        //     onPressed: () {
                                        //       setState(() {
                                        //         // Global_Item.AllItems_details
                                        //         //     .removeAt(Global_Item
                                        //         //     .AllItems_details
                                        //         //     .indexOf(e));
                                        //         Global_Item.AllItems_details
                                        //             .addAll([e]);
                                        //       });
                                        //     },
                                        //     icon: const Icon(Icons.add)),
                                        // Text(
                                        //     "${(e.unit_cost * e.item_quantity) * (e.item_discount! / 100)}"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
