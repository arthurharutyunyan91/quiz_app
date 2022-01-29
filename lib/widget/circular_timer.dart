import 'package:flutter/material.dart';

class CircularTimer extends StatefulWidget {
  final Function() onTimerEnd;
  final int timerDuration;

  CircularTimer({this.onTimerEnd, this.timerDuration = 10});

  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.timerDuration),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onTimerEnd?.call();
        }
      })
      ..forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.value,
      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff7069DB)),
      backgroundColor: Color(0xffDACAFB),
      strokeWidth: 18,
    );
  }
}
