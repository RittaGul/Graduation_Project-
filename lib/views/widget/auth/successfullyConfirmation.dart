import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:lottie/lottie.dart';

class successfulConfirmation extends StatefulWidget {
  var timeEndFunc;
  String bodyMessage;
  successfulConfirmation({
    required this.timeEndFunc,
    required this.bodyMessage,
  });
  @override
  State<successfulConfirmation> createState() => _successfulConfirmationState();
}

class _successfulConfirmationState extends State<successfulConfirmation> {
  static const maxSecond = 4;
  int seconds = maxSecond;

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
      seconds--;
      if (seconds == 0) {
        widget.timeEndFunc();
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 233, 138, 138),
              Color.fromARGB(255, 210, 121, 121),
              Color.fromARGB(255, 222, 128, 128),
              Color.fromARGB(255, 240, 150, 150),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/lf30_editor_kwujrtq0.json'),
            Text(
              '${widget.bodyMessage}',
              style: Themes().headLine2.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    value: 1 - seconds / maxSecond,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    strokeWidth: 5,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  '$seconds',
                  style: Themes().headLine1.copyWith(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
