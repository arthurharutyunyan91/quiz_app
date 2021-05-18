import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/model/question.dart';

import '../home/home_screen.dart';

class HomeController extends GetxController {
  final List<Question> questions;

  HomeController({@required this.questions});
}
