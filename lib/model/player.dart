import 'package:flutter/material.dart';

class Player {
  static const player_name = 'name';
  static const player_email = 'email';
  static const player_status = 'status';
  static const total_right_answers = 'totalRightAnswers';

  static const playerStatusOut = 'out';
  static const playerStatusPending = 'pending';
  static const playerStatusInGame = 'inGame';

  final String name;
  final String email;
  final String playerStatus;
  final int totalRightAnswers;

  Player({@required this.name, @required this.email})
      : totalRightAnswers = 0,
        playerStatus = playerStatusOut;

  Player.fromJson(Map<dynamic, dynamic> json)
      : name = json[player_name],
        email = json[player_email],
        playerStatus = json[player_status],
        totalRightAnswers = json[total_right_answers];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      player_name: name,
      player_email: email,
      player_status: playerStatus,
      total_right_answers: totalRightAnswers,
    };
  }
}
