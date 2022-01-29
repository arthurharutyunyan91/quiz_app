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

  SplashScreenController() {
    _currentUser = firebaseAuth.currentUser;
  }

  rocketAnimationEnded(AnimationController animationController) {
    // if (_currentUser != null) {
    //   Get.off(LobbyScreen(userUid: _currentUser.uid));
    // } else {
    animationController.forward();
    // }
  }

  onRegistrationButtonTap() {
    Get.off(SignUpScreen());
  }
}
