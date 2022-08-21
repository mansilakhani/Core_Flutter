import 'package:flutter/material.dart';

class Discount_Page extends StatefulWidget {
  const Discount_Page({Key? key}) : super(key: key);

  @override
  State<Discount_Page> createState() => _Discount_PageState();
}

class _Discount_PageState extends State<Discount_Page> {
  //var disount_droplist = ["No Discount", "Percentage", "Flat Amount"];
  // List<String> discount = [
  //   "No Discount",
  //   "Percentage",
  //   "Flat Amount",
  // ];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discount Page"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: Container(
        height: _height * 0.30,
        width: _width,
        margin: const EdgeInsets.all(12),
        color: Colors.grey.shade300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text("Discount"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_drop_down)),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text("Discount Amount"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
