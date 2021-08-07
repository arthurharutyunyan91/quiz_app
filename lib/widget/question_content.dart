import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  final String content;

  QuestionContent({this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 16),
        child: Text(
          content,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
