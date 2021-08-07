import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  QuizButton({@required this.onTap, @required this.text});

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 196, 28, 196),
          minimumSize: Size(250, 50)),
      onPressed: () => onTap?.call(),
      child: Text(text),
    );
  }
}
