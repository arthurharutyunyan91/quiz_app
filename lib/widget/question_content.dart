import 'package:flutter/material.dart';

class QuestionContent extends StatelessWidget {
  final String content;
  final int questionIndex;
  final int questionsCount;

  QuestionContent(
      {@required this.content,
      @required this.questionIndex,
      @required this.questionsCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60, right: 20, left: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question $questionIndex/$questionsCount',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
