import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LobbyScreen extends StatelessWidget {
  final String userUid;

  LobbyScreen({this.userUid});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LobbyController(userUid: userUid));
    return Scaffold(
      backgroundColor: Colors.black87,
      // body: Padding(
      //   padding: EdgeInsets.only(top: 30, left: 30),
      //   child: GetBuilder<LobbyController>(
      //       builder: (_) => UsersList(users: controller.players)),
      // )
      body: Center(
        child: _AnimatedText(),
      ),
    );
  }
}

class _AnimatedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 40,
        color: Colors.white70,
        shadows: [
          Shadow(
            blurRadius: 3,
            color: Colors.white10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Please Wait...'),
        ],
        pause: Duration(milliseconds: 100),
        repeatForever: true,
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  final List<String> users;

  UsersList({@required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, i) {
        return Text(
          '${i + 1}. ' '${users[i]}',
          style: TextStyle(color: Colors.white, fontSize: 16),
        );
      },
    );
  }
}
