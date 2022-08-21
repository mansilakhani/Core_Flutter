import 'package:flutter/material.dart';

import '../questions_bank/questionsbank.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: _width,
              color: Colors.pink,
              child: IndexedStack(
                alignment: Alignment.center,
                index: initialquestion,
                children: Questions.map(
                  (e) => Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: e['color'],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        e['question'],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              width: _width,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Options(option: Options[initialquestion]['1']),
                        const SizedBox(width: 6),
                        _Options(option: Options[initialquestion]['2']),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Options(option: Options[initialquestion]['3']),
                        const SizedBox(width: 6),
                        _Options(option: Options[initialquestion]['4']),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Options({required String option}) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        if (option == Questions[initialquestion]['answer']) {
          Navigator.of(context).pushReplacementNamed('correct_page',
              arguments: Questions[initialquestion]['price']);
        } else {
          Navigator.of(context).pushReplacementNamed('lost_page');
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: _height * 0.068,
        width: _width * 0.46,
        decoration: BoxDecoration(
            color: const Color(0xff1e1f23),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          '$option',
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xffa8a8a9).withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
