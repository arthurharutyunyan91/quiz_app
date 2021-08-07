import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/splash_screen/controller.dart';
import 'package:quiz_app/widget/button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  SplashScreenController controller;
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    controller = Get.put(SplashScreenController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.5),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(controller.title,
                    textStyle: TextStyle(color: Colors.white70, fontSize: 40),
                    speed: Duration(milliseconds: 250)),
              ],
              onFinished: () =>
                  controller.textAnimationEnded(animationController),
              repeatForever: false,
              totalRepeatCount: 1,
            ),
          ),
          FadeTransition(
            opacity: animation,
            child: Align(
                alignment: Alignment(0, 0.5),
                child: QuizButton(
                  text: 'Create an Account',
                  onTap: controller.onRegistrationButtonTap,
                )),
          ),
        ],
      ),
    );
  }
}
