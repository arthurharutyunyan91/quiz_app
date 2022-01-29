import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/widget/changable_loading_image.dart';

import 'controller.dart';

class LobbyScreen extends StatelessWidget {
  final String userUid;

  LobbyScreen({this.userUid});

  @override
  Widget build(BuildContext context) {
    Get.put(LobbyController(userUid: userUid));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Hang tight, we’ll start in a few minutes!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            LoadingMonster(),
            _ProgressBar(),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 30),
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: LinearProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff7069DB)),
          backgroundColor: Color(0xffDACAFB),
          minHeight: 8,
        ),
      ),
    );
  }
}
