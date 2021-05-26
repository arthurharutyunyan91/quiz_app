import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");

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
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((result) {
        dbRef.child(result.user.uid).set({
          'email': emailController.text,
          'name': nameController.text,
        });
      }).catchError((err) {
        Get.snackbar('Error', (err as FirebaseAuthException).message,
            backgroundColor: Colors.white70);
      });
    }
  }
}
