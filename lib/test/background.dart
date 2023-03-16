import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 71, 71),
      body: Center(
        child: Image.asset(
          'assets/lottie/logo22-22.png',
          width: 1000,
          height: 1000,
          // color: Colors.orange,
        ),
      ),
    );
  }
}
