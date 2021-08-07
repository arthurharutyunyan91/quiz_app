import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/login/controller.dart';
import 'package:quiz_app/widget/button.dart';
import 'package:quiz_app/widget/loading_bar.dart';
import 'package:quiz_app/widget/text_field.dart';
import 'package:validators/validators.dart' as validator;

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignUpController());
    return Scaffold(
        body: Stack(
      children: [
        SignUpContent(),
        GetBuilder<SignUpController>(builder: (_) {
          return controller.showLoading ? LoadingBar() : Container();
        })
      ],
    ));
  }
}

class SignUpContent extends StatelessWidget {
  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              CustomTextForm(
                labelText: 'Email',
                textInputType: TextInputType.emailAddress,
                controller: controller.emailController,
                validator: (value) {
                  if (!validator.isEmail(value)) {
                    return 'Wrong email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              GetBuilder<SignUpController>(
                builder: (_) => CustomTextForm(
                  labelText: 'Password',
                  obscureText: controller.obscured,
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    icon: Icon(controller.obscured
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash),
                    onPressed: controller.changeObscuredState,
                  ),
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Password is too short';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextForm(
                labelText: 'Full name',
                controller: controller.nameController,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              QuizButton(onTap: controller.registerUser, text: 'Sign Up')
            ],
          ),
        ),
      ),
    );
  }
}
