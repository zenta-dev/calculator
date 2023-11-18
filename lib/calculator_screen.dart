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
  List<String> calculationHistory = [];

  void onButtonClick(String context) {
    debugPrint(context);
    if (context == "C") {
      input = '';
      output = '';
    } else if (context == "()") {
      // Toggle between "(" and ")"
      if (input.endsWith("(")) {
        input = input.substring(0, input.length - 1) + ")";
      } else if (input.endsWith(")")) {
        input = input.substring(0, input.length - 1) + "(";
      } else {
        if (input.isNotEmpty && !RegExp(r'[0-9.]$').hasMatch(input)) {
          input += "(";
        } else {
          input += ")";
        }
      }
    } else if (context == "=") {
      // Check if parentheses are balanced before evaluating the expression
      if (areParenthesesBalanced(input)) {
        // Existing code for evaluating the expression
        try {
          var userInput = input;
          userInput = userInput
              .replaceAll("×", "*")
              .replaceAll("÷", "/")
              .replaceAll("%", "*0.01");

          // Add missing logic for handling negative numbers
          userInput = userInput.replaceAllMapped(
            RegExp(r'(?<=\d)\s*(-)\s*(?=\d)'),
            (match) => match.group(0)!.contains('-') ? ' - ' : ' + ',
          );

          Parser p = Parser();
          Expression expression = p.parse(userInput);
          ContextModel cm = ContextModel();
          var finalValue = expression.evaluate(EvaluationType.REAL, cm);
          output = finalValue.toString();
          if (output.endsWith(".0")) {
            output = output.substring(0, output.length - 2);
          }
          input = output;

          // Add the expression to the calculation history
          calculationHistory.add("$userInput = $output");
        } catch (e) {
          // Handle parsing or evaluation errors
          output = 'Error';
          input = '';
        }
      } else {
        // Handle the case when parentheses are not balanced
        output = 'Error';
        input = '';
      }
    } else if (context == "+/-") {
      // Toggle between positive and negative
      if (input.isNotEmpty && !input.endsWith("(-")) {
        var lastOperatorIndex = input.lastIndexOf(RegExp(r'[+*/-]'));
        if (lastOperatorIndex == -1) {
          input = "(-" + input;
        } else {
          input = input.substring(0, lastOperatorIndex + 1) +
              "(-" +
              input.substring(lastOperatorIndex + 1);
        }
      } else if (input.endsWith("(-")) {
        input = input.substring(0, input.length - 2);
      } else {
        input += "(-";
      }
    } else {
      input += context;
    }

    appendValue(context);

    setState(() {});
  }

  void appendValue(String value) {
    // Implement any additional logic for appending values to the input if needed.
  }

  bool areParenthesesBalanced(String input) {
    int count = 0;
    for (var char in input.runes) {
      if (String.fromCharCode(char) == '(') {
        count++;
      } else if (String.fromCharCode(char) == ')') {
        count--;
      }
      if (count < 0) {
        return false; // Mismatched closing parenthesis
      }
    }
    return count == 0; // Parentheses are balanced if count is zero
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
                child: Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 270,
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0XFFF4EAE0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.all(8.0),
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFF4EAE0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  input,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  output,
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Show calculation history
                              showHistoryDialog(context);
                            },
                            icon: Icon(Icons.history),
                          ),
                          IconButton(
                            onPressed: () {
                              if (input.isNotEmpty) {
                                input = input.substring(0, input.length - 1);
                                setState(() {});
                              }
                            },
                            icon: Icon(Icons.backspace_outlined),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: ButtonArea1.values
                    .map(
                      (e) => SizedBox(
                        width: screenSize.width / 4.19,
                        height: screenSize.width / 4.19,
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
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(75),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(4, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => onButtonClick(text),
        style: ElevatedButton.styleFrom(
          primary: color, // Background color
          elevation: 0, // Set elevation to 0 to delete default shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  void showHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            alignment: Alignment.center,
            child: Text("Calculation History", style: TextStyle(fontSize: 20)),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: calculationHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(calculationHistory[index]),
                );
              },
            ),
          ),
          backgroundColor: Color(0xFFF4F6F0), // Set background color
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFCB935F)
                        .withOpacity(0.83), // Set the container color
                    borderRadius:
                        BorderRadius.circular(20), // Set border radius
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Clear history
                      setState(() {
                        calculationHistory.clear();
                      });
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black, // Set button text color
                    ),
                    child: Text("Clear History"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFCB935F)
                        .withOpacity(0.83), // Set the container color
                    borderRadius:
                        BorderRadius.circular(20), // Set border radius
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black, // Set button text color
                    ),
                    child: Text("Close"),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
