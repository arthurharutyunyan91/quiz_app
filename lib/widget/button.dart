import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  QuizButton(
      {@required this.onTap,
      @required this.text,
      this.color = const Color(0xff7069DB)});

  final Function() onTap;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: Size(216, 40),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8),
          )),
      onPressed: () => onTap?.call(),
      child: Text(text),
    );
  }
}
