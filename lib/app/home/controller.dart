import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/model/question.dart';

const String stPending = 'pending';
const String stStart = 'start';
const String stFinish = 'finish';

class QuestionsController extends GetxController {
  final DatabaseReference dbQuestionIndex =
      FirebaseDatabase.instance.reference().child('questionIndex');
  var questionIndexChangeListener;
  final List<Question> questions;
  var questionIndex = 0;
  var selectedButtonID = -1;
  var rightAnswerID = -1;
  var startTimer = false;

  QuestionsController({@required this.questions}) {
    questionIndexChangeListener =
        dbQuestionIndex.onValue.listen(_onQuestionIndexChanged);
  }

  // ignore: missing_return
  Future _onQuestionIndexChanged(Event event) {
    questionIndex = event.snapshot.value;
    startTimer = true;
    rightAnswerID = -1;
    update();
  }

  changeSelectedButton(int id) {
    selectedButtonID = id;
    update();
  }

  setRightAnswer() async {
    questions[questionIndex].variantsList.forEach((element) {
      if (element.isAnswer) {
        rightAnswerID = element.id;
      }
    });
    await Future.delayed(Duration(microseconds: 100));
    startTimer = false;
    update();
  }
}
