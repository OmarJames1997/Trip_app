import 'package:flutter/material.dart';

class TextBoldComp extends StatelessWidget {
  final String text;
  double size;
  final Color color;

  TextBoldComp(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.size = 30});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size, color: color, fontWeight: FontWeight.bold));
  }
}

class TextNormalComp extends StatelessWidget {
  final String text;
  double size;
  final Color color;

  TextNormalComp(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.size = 16});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          color: color,
        ));
  }
}
