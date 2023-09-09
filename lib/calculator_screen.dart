import 'package:calculator/button_values.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                    width: 325,
                    height: 228,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFCBBFED),
                    ),
                    child: Column(children: <Widget>[
                      Text(
                        "0",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        "0",
                        style: const TextStyle(
                          fontSize: 96,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                  children: ButtonArea1.values
                      .map((e) => SizedBox(
                            width: screenSize.width / 4.4,
                            height: screenSize.width / 4.4,
                            child: buildButton(
                                text: e.text,
                                color: e.color,
                                textColor: e.textColor),
                          ))
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required String text,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      margin: EdgeInsets.all(3),
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(75)),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 32,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
