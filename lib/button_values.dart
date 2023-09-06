import 'package:flutter/material.dart';

enum ButtonArea1 {
  clr,
  priority,
  per,
  divide,
  n7,
  n8,
  n9,
  multiply,
  n4,
  n5,
  n6,
  subtract,
  n1,
  n2,
  n3,
  add,
  dot,
  n0,
  notation,
  calculate,
}

extension Lay1Prop on ButtonArea1 {
  Color get color {
    switch (this) {
      case ButtonArea1.clr:
      case ButtonArea1.priority:
      case ButtonArea1.per:
        return Color(0XFFB9AAE8);
      case ButtonArea1.divide:
      case ButtonArea1.multiply:
      case ButtonArea1.subtract:
      case ButtonArea1.add:
        return Color(0XFF5F70CB);
      case ButtonArea1.calculate:
        return Color(0XFFFEFFB7);

      default:
        return Color(0XFFFFC5EB);
    }
  }

  Color get textColor {
    switch (this) {
      case ButtonArea1.clr:
        return Color(0XFFFF0000);
      case ButtonArea1.divide:
      case ButtonArea1.multiply:
      case ButtonArea1.subtract:
      case ButtonArea1.add:
        return Color(0XFFFFFFFF);

      default:
        return Color(0XFF000000);
    }
  }

  String get text {
    switch (this) {
      case ButtonArea1.clr:
        return "C";
      case ButtonArea1.priority:
        return "()";
      case ButtonArea1.per:
        return '%';
      case ButtonArea1.divide:
        return "÷";
      case ButtonArea1.multiply:
        return "×";
      case ButtonArea1.add:
        return "+";
      case ButtonArea1.subtract:
        return '-';
      case ButtonArea1.calculate:
        return '=';
      case ButtonArea1.dot:
        return ".";
      case ButtonArea1.notation:
        return "+/-";
      case ButtonArea1.n0:
        return "0";
      case ButtonArea1.n1:
        return "1";
      case ButtonArea1.n2:
        return "2";
      case ButtonArea1.n3:
        return "3";
      case ButtonArea1.n4:
        return "4";
      case ButtonArea1.n5:
        return "5";
      case ButtonArea1.n6:
        return "6";
      case ButtonArea1.n7:
        return "7";
      case ButtonArea1.n8:
        return "8";
      case ButtonArea1.n9:
        return "9";
      default:
        return '';
    }
  }
}
