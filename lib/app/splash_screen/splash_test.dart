import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/app/splash_screen/controller.dart';
import 'package:quiz_app/widget/positioned_circle.dart';

class SplashTest extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff665FDA),
      body: Stack(
        children: [
          _BackgroundShapes(),
          _Content(),
          AnimatedRocket(),
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
          circleColor: Color(0xff7069DB),
          offset: Offset(50, 120),
          circleSize: 60,
        ),
        PositionedCircle(
          alignment: Alignment.topRight,
          circleColor: Color(0xff7069DB),
          strokeColor: Color(0xffA8A3FF),
          offset: Offset(110, 70),
          circleSize: 170,
          strokeWidth: 0.5,
          strokeFactor: 1.4,
          stroke: true,
        ),
        PositionedCircle(
          alignment: Alignment.bottomLeft,
          circleColor: Color(0xff7069DB),
          strokeColor: Color(0xffA8A3FF),
          offset: Offset(-110, -15),
          strokeWidth: 0.5,
          circleSize: 200,
          strokeFactor: 1.6,
          stroke: true,
        ),
        PositionedCircle(
          alignment: Alignment.bottomRight,
          circleColor: Color(0xff7069DB),
          offset: Offset(-80, -200),
          circleSize: 40,
        )
      ],
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 112,
              height: 112,
              margin: EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xffF74D9D),
                    Color(0xffFF7B6C),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Image.asset(
                'assets/images/splash/Logo.png',
              )),
            ),
            Text(
              'Quiz Time',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedRocket extends StatefulWidget {
  @override
  _AnimatedRocketState createState() => _AnimatedRocketState();
}

class _AnimatedRocketState extends State<AnimatedRocket>
    with TickerProviderStateMixin {
  SplashScreenController controller;
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween(begin: -0.4, end: 0.8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.translationValues(
              animation.value * width, -(animation.value * width / 3), 0.0),
          child: Center(
              child: Image.asset(
            'assets/images/splash/Saly-1.png',
          )),
        );
      },
    );
  }
}
