import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  var appColor = TextStyle(fontSize: 22);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text(
          "Invoice generator",
          style: appColor,
          //style: AppColor.appStyle,
        ),
        backgroundColor: const Color(0xffdd6c44).withOpacity(0.9),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffdd6c44).withOpacity(0.9),
        onPressed: () {
          Navigator.of(context).pushNamed('invoice_workspace_page');
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              "It's empty:(",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.7),
                // color: Colors.grey.shade600,
              ),
            ),
            Image.asset(
              "assets/images/box.png",
              scale: 3,
              color: const Color(0xffdd6c44).withOpacity(0.9),
            ),
            const SizedBox(height: 10),
            Text(
              "Tap here or ➕ button to\n   create your invoice",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black.withOpacity(0.7),
                //color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
