import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/app/lobby/controller.dart';
import 'package:quiz_app/model/game.dart';
import 'package:quiz_app/model/player.dart';
import 'package:quiz_app/model/question.dart';

class QuestionsController extends GetxController {
  final DatabaseReference dbQuestionIndex =
      FirebaseDatabase.instance.reference().child(Game.questionIndex);
  final DatabaseReference dbQuestions =
      FirebaseDatabase.instance.reference().child(Game.questions);
  final DatabaseReference dbPlayers =
      FirebaseDatabase.instance.reference().child(Game.players);

  final String userUid;
  final Map<String, Question> questions;
  var questionIndexChangeListener;
  var questionIndex = 0;
  var selectedButtonID = -1;
  var rightAnswerID = -1;
  var timerRunning = false;
  var resultImage = '';

  QuestionsController({@required this.questions, @required this.userUid}) {
    dbQuestionIndex.onValue.listen(_onQuestionIndexChanged);
  }

  _onQuestionIndexChanged(Event event) {
    questionIndex = event.snapshot.value;
    timerRunning = true;
    rightAnswerID = -1;
    update();
  }

  changeVariant(int id) {
    selectedButtonID = id;
    update();
  }

  setRightAnswer() {
    questions.values.toList()[questionIndex].variantsList.forEach((element) {
      if (element.isAnswer) {
        rightAnswerID = element.id;
      }
    });
    if (rightAnswerID == selectedButtonID) {
      _updateAnswerInServer();
      resultImage = 'assets/images/loading/loading2.png';
    } else {
      resultImage = 'assets/images/loading/lose.png';
    }
    timerRunning = false;
    update();
  }

  _updateAnswerInServer() async {
    var playersSnapshot = await dbPlayers.once();
    int playerTotalAnswers =
        playersSnapshot.value[userUid][Player.total_right_answers];
    String playerName = playersSnapshot.value[userUid][Player.player_name];

    dbQuestions
        .child(questions.keys.toList()[questionIndex])
        .child(Question.question_winners)
        .child(userUid)
        .set(playerName);

    dbPlayers
        .child(userUid)
        .child(Player.total_right_answers)
        .set(++playerTotalAnswers);
  }
}
