import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/model/question.dart';

import '../home/home_screen.dart';

class SplashScreenController extends GetxController {
  final databaseQuestions =
      FirebaseDatabase.instance.reference().child('questions');

  SplashScreenController() {
    loadData();
  }

  loadData() async {
    var questionsSnapshot = await databaseQuestions.once();
    List<dynamic> questionsData = questionsSnapshot.value.values.toList();
    var questions = <Question>[];
    questionsData.forEach((element) {
      questions.add(Question.fromJson(element));
    });
    navigateToHomePage(questions);
  }

  navigateToHomePage(List<Question> questions) {
    Get.to(TMPPage(questions: questions));
  }
}
