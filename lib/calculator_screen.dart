import 'package:calculator/button_values.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String output = '';

  void onButtonClick(String context) {
    debugPrint(context);
    if (context == "C") {
      input = '';
      output = '';
    } else if (context == "()") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (context == "=") {
      if (input.isNotEmpty) {}
      var userInput = input;
      userInput = userInput.replaceAll("×", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
      if (output.endsWith(".0")) {
        output = output.substring(0, output.length - 2);
      }
      input = output;
    } else {
      input = input + context;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  width: 325,
                  height: 228,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0XFFCBBFED),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        input,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        output,
                        style: const TextStyle(
                          fontSize: 96,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: ButtonArea1.values
                    .map(
                      (e) => SizedBox(
                        width: screenSize.width / 4.4,
                        height: screenSize.width / 4.4,
                        child: buildButton(
                            text: e.text,
                            color: e.color,
                            textColor: e.textColor),
                      ),
                    )
                    .toList(),
              ),
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
        onPressed: () => onButtonClick(text),
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
