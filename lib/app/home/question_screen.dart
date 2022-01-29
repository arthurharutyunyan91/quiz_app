import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/model/question.dart';
import 'package:quiz_app/widget/circular_timer.dart';
import 'package:quiz_app/widget/question_content.dart';
import 'package:quiz_app/widget/variants.dart';

import 'controller.dart';

class QuestionsScreen extends StatelessWidget {
  final Map<String, Question> questions;
  final String userUid;

  QuestionsScreen({@required this.questions, @required this.userUid});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(QuestionsController(questions: questions, userUid: userUid));
    return Scaffold(
      body: GetBuilder<QuestionsController>(builder: (_) {
        return IgnorePointer(
          ignoring: !controller.timerRunning,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuestionContent(
                content: controller.questions.values
                    .toList()[controller.questionIndex]
                    .content,
                questionIndex: controller.questionIndex + 1,
                questionsCount: controller.questions.length,
              ),
              Variants(
                variants: controller.questions.values
                    .toList()[controller.questionIndex]
                    .variantsList,
                selectedButtonId: controller.selectedButtonID,
                rightAnswerID: controller.rightAnswerID,
                onVariantTap: (id) => controller.changeVariant(id),
              ),
              SizedBox(height: 16),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: controller.timerRunning
                    ? Center(
                        key: ValueKey(2),
                        child: Container(
                          width: 250,
                          height: 250,
                          padding: EdgeInsets.all(20),
                          child: CircularTimer(
                            onTimerEnd: () => controller.setRightAnswer(),
                          ),
                          // child: Image.asset(
                          //   'assets/images/loading/loading1.png',
                          // ),
                        ),
                      )
                    : Center(
                        key: ValueKey(1),
                        child: Image.asset(
                          controller.resultImage,
                          width: 250,
                          height: 250,
                        ),
                      ),
              )
            ],
          ),
        );
      }),
    );
  }
}
