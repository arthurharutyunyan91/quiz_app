import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/home/controller.dart';
import 'package:quiz_app/model/question.dart';
import 'package:quiz_app/model/variant.dart';

class TMPPage extends StatelessWidget {
  final List<Question> questions;

  TMPPage({@required this.questions});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(questions: questions));
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _QuestionContent(
            content: controller.questions[0].content,
          )
        ],
      ),
    );
  }
}

class _QuestionContent extends StatelessWidget {
  final String content;

  _QuestionContent({this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          content,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}

class _Variant extends StatelessWidget {
  final Function onVariantTap;
  final Variant variant;

  _Variant({this.onVariantTap, this.variant});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(variant.content),
    );
  }
}
