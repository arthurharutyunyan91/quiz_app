import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final Duration timerDuration;
  final Function() onTimerEnd;
  final bool startTimer;

  CountDownTimer(
      {this.timerDuration = const Duration(seconds: 30),
      this.onTimerEnd,
      this.startTimer});

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

  @override
  void didUpdateWidget(covariant CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startTimer != widget.startTimer) {
      if (widget.startTimer) {
        _animationController.reset();
        _animationController.forward();
      } else {
        _animationController.stop();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.timerDuration)
          ..addListener(() {
            if (_animationController.isCompleted) {
              widget.onTimerEnd?.call();
            }
          });
    _colorTween = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(_animationController);
  }

  startTimer() {
    _animationController?.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgetWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedBuilder(
          animation: _colorTween,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.only(top: 16),
              color: _colorTween.value,
              height: 50,
              width: widgetWidth - (widgetWidth * _animationController.value),
              child: child,
              // width: 300,
            );
          }),
    );
  }
}
