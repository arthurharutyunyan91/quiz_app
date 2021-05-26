import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/app/home/controller.dart';
import 'package:quiz_app/app/home/question_screen.dart';
import 'package:quiz_app/model/question.dart';

class LobbyController extends GetxController {
  final DatabaseReference dbQuestions =
      FirebaseDatabase.instance.reference().child('questions');
  final DatabaseReference dbStatus =
      FirebaseDatabase.instance.reference().child('status');
  var statusChangeListener;
  final questions = <Question>[];

  LobbyController() {
    loadQuestions();
    statusChangeListener = dbStatus.onValue.listen(_onStatusChanged);
  }

  loadQuestions() async {
    var questionsSnapshot = await dbQuestions.once();
    List<dynamic> questionsData = questionsSnapshot.value.values.toList();
    questionsData.forEach((element) {
      questions.add(Question.fromJson(element));
    });
  }

  // ignore: missing_return
  Future _onStatusChanged(Event event) {
    if (event.snapshot.value == stStart) {
      if (questions.length > 0) {
        navigateToHomePage(questions);
        statusChangeListener.cancel();
      } else {
        Get.snackbar('Questions are not loaded', 'Check internet connection',
            backgroundColor: Colors.white70);
      }
    }
  }

  navigateToHomePage(List<Question> questions) {
    Get.off(QuestionsScreen(questions: questions));
  }
}
