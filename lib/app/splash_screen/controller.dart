import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quiz_app/app/lobby/lobby_screen.dart';
import 'package:quiz_app/app/login/sign_up_screen.dart';

class SplashScreenController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final String title = 'Quiz App';
  User _currentUser;
  var _lobbyScreen;

  SplashScreenController() {
    _currentUser = firebaseAuth.currentUser;
    _lobbyScreen = LobbyScreen(userUid: _currentUser.uid);
  }

  textAnimationEnded(AnimationController animationController) {
    if (_currentUser != null) {
      Get.off(_lobbyScreen);
    } else {
      animationController.forward();
    }
  }

  onRegistrationButtonTap() {
    Get.off(SignUpScreen());
  }
}
