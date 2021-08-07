import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/app/home/question_screen.dart';
import 'package:quiz_app/model/game.dart';
import 'package:quiz_app/model/player.dart';
import 'package:quiz_app/model/question.dart';
import 'package:quiz_app/util/errorMessages.dart';

class LobbyController extends GetxController {
  final DatabaseReference dbQuestions =
      FirebaseDatabase.instance.reference().child(Game.questions);
  final DatabaseReference dbGameStatus =
      FirebaseDatabase.instance.reference().child(Game.gameStatus);
  final DatabaseReference playersRef =
      FirebaseDatabase.instance.reference().child(Game.players);
  final String userUid;
  var statusChangeListener;
  final questions = <String, Question>{};

  //TODO for admin
  var playersChangeListener;
  var players = <String>[];

  LobbyController({this.userUid}) {
    loadQuestions();
    statusChangeListener = dbGameStatus.onValue.listen(_onGameStatusChanged);
    playersChangeListener = playersRef.onValue.listen(_onPlayersChanged);
  }

  loadQuestions() async {
    var questionsSnapshot = await dbQuestions.once();
    questionsSnapshot.value.forEach((key, value) {
      questions.addIf(true, key, Question.fromJson(value));
    });
    _changePlayerStatus(Player.playerStatusPending);
  }

  // ignore: missing_return
  Future _onGameStatusChanged(Event event) {
    if (event.snapshot.value == Game.gameStatusStart) {
      if (questions.length > 0) {
        _navigateToHomePage(questions);
        _changePlayerStatus(Player.playerStatusInGame);
        statusChangeListener.cancel();
      } else {
        showErrorSnackbar('Check internet connection');
      }
    }
  }

  _changePlayerStatus(String playerStatus) {
    playersRef.child(userUid).update({Player.player_status: playerStatus});
  }

  _navigateToHomePage(Map<String, Question> questions) {
    Get.off(QuestionsScreen(questions: questions, userUid: userUid));
  }

  //TODO for Admin
  // ignore: missing_return
  Future _onPlayersChanged(Event event) {
    List<dynamic> playersData = event.snapshot.value.values.toList();
    players.clear();
    playersData.forEach((element) {
      if (element[Player.player_status] == Player.playerStatusPending) {
        players.add(element[Player.player_name]);
      }
    });
    players.sort((a, b) => a.compareTo(b));
    update();
  }
}
