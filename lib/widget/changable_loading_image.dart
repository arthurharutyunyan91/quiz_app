import 'dart:async';
import 'package:flutter/material.dart';

class LoadingMonster extends StatefulWidget {
  @override
  _LoadingMonsterState createState() => _LoadingMonsterState();
}

class _LoadingMonsterState extends State<LoadingMonster> {
  var imageIndex = 1;
  Timer _timer;
  var imageFade = 1.0;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _startTimer() {
    _timer = new Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        if (imageIndex == 5) {
          setState(() {
            imageIndex = 1;
          });
        } else {
          setState(() {
            imageIndex++;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      child: Image.asset(
        'assets/images/loading/loading$imageIndex.png',
        key: Key('$imageIndex'),
        width: 350,
        height: 350,
      ),
    );
  }
}
