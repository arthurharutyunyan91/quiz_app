import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/model/question.dart';
import 'package:quiz_app/widget/coutndown_timer.dart';
import 'package:quiz_app/widget/question_content.dart';
import 'package:quiz_app/widget/variants.dart';

import 'controller.dart';

class QuestionsScreen extends StatelessWidget {
  final List<Question> questions;

  QuestionsScreen({@required this.questions});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionsController(questions: questions));
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GetBuilder<QuestionsController>(builder: (_) {
        return IgnorePointer(
          ignoring: !controller.startTimer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuestionContent(
                content: controller.questions[controller.questionIndex].content,
              ),
              Column(
                children: [
                  Variants(
                    variants: controller
                        .questions[controller.questionIndex].variantsList,
                    selectedButtonId: controller.selectedButtonID,
                    rightAnswerID: controller.rightAnswerID,
                    onVariantTap: (id) => controller.changeSelectedButton(id),
                  ),
                  CountDownTimer(
                    timerDuration: Duration(seconds: 20),
                    onTimerEnd: () => controller.setRightAnswer(),
                    startTimer: controller.startTimer,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}