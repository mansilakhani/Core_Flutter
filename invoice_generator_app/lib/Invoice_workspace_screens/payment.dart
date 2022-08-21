import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<FormState> payment_key = GlobalKey<FormState>();
  final TextEditingController payment_notes_Controller =
      TextEditingController();
  String? paymentnotes;
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
          "Payment",
          style: appColor,
        ),
        //centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                payment_key.currentState?.save();
                payment_notes_Controller.text;
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "Notes",
              style: textstyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  paymentnotes = val;
                });
              },
              maxLines: 4,
              controller: payment_notes_Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
