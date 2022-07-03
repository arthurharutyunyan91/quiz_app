import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/lobby/lobby_screen.dart';
import 'package:quiz_app/model/game.dart';
import 'package:quiz_app/model/player.dart';
import 'package:quiz_app/util/errorMessages.dart';

class SignUpController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference playersRef =
      FirebaseDatabase.instance.reference().child(Game.players);
  bool showLoading = false;

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  var obscured = true;

  changeObscuredState() {
    obscured = !obscured;
    update();
  }

  registerUser() {
    if (formKey.currentState.validate()) {
      showLoading = true;
      update();
      _registerWithEmail()
          .then((result) {
            _addPlayer(uid: result.user.uid);
          })
          .then((res) => _navigateToLobby(uid: firebaseAuth.currentUser.uid))
          .catchError((err) {
            final errorMessage =
                err is FirebaseAuthException ? err.message : 'Connection Error';
            showErrorSnackbar(errorMessage);
            showLoading = false;
            update();
          });
    }
  }

  _registerWithEmail() {
    return firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  _addPlayer({String uid}) {
    return playersRef.child(uid).set(
        Player(email: emailController.text, name: nameController.text)
            .toJson());
  }

  _navigateToLobby({String uid}) {
    Get.off(LobbyScreen(userUid: uid));
  }
}
