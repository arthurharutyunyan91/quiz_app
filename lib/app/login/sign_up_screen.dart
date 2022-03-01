import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/login/controller.dart';
import 'package:quiz_app/widget/button.dart';
import 'package:quiz_app/widget/loading_bar.dart';
import 'package:quiz_app/widget/positioned_circle.dart';
import 'package:quiz_app/widget/text_field.dart';
import 'package:validators/validators.dart' as validator;

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignUpController());
    return Scaffold(
      body: Stack(
        children: [
          _BackgroundShapes(),
          Align(
            alignment: Alignment(0, -0.6),
            child: Image.asset(
              'assets/images/avatars/avatar7.png',
              width: 250,
              height: 250,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: _SignUpContent(),
          ),
          GetBuilder<SignUpController>(builder: (_) {
            return controller.showLoading ? LoadingBar() : Container();
          })
        ],
      ),
    );
  }
}

class _SignUpContent extends StatelessWidget {
  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3, 5),
                  color: Colors.black26,
                  blurRadius: 20,
                )
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            padding: EdgeInsets.only(
              top: 32,
              left: 16,
              right: 32,
              bottom: 16,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
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
                  CustomTextForm(
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    validator: (value) {
                      if (!validator.isEmail(value)) {
                        // return 'Wrong email';
                      }
                      return null;
                    },
                  ),
                  GetBuilder<SignUpController>(
                    builder: (_) => CustomTextForm(
                      labelText: 'Password',
                      obscureText: controller.obscured,
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(
                          controller.obscured
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          size: 16,
                        ),
                        onPressed: controller.changeObscuredState,
                      ),
                      controller: controller.passwordController,
                      validator: (value) {
                        if (value.length < 6) {
                          // return 'Password is too short';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          QuizButton(onTap: controller.registerUser, text: 'Sign Up')
        ],
      ),
    );
  }
}

class _BackgroundShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PositionedCircle(
          alignment: Alignment.topLeft,
          circleColor: Color(0xffDACAFB),
          offset: Offset(5, 70),
          circleSize: 60,
        ),
        PositionedCircle(
          alignment: Alignment.topRight,
          circleColor: Color(0xffDACAFB),
          offset: Offset(90, 30),
          circleSize: 110,
          strokeFactor: 1.4,
          stroke: true,
        ),
        PositionedCircle(
          alignment: Alignment.bottomLeft,
          circleColor: Color(0xffDACAFB),
          offset: Offset(-130, -15),
          circleSize: 180,
          strokeFactor: 1.6,
          stroke: true,
        ),
        PositionedCircle(
          alignment: Alignment.bottomRight,
          circleColor: Color(0xffDACAFB),
          offset: Offset(-20, -15),
          circleSize: 30,
        )
      ],
    );
  }
}
