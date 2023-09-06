import 'package:calculator/button_values.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
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
                  width: 300,
                  height: 200,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[400],
                  ),
                  child: Text(
                    "0",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                  children: ButtonArea1.values
                      .map((e) => SizedBox(
                            width: screenSize.width / 4.4,
                            height: screenSize.width / 4.4,
                            child: buildButton(text: e.text, color: e.color),
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
  }) {
    return Container(
      margin: EdgeInsets.all(4),
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(66)),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
