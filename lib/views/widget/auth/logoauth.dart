import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/constant/imageLink.dart';

//اللوغوووووو
class LogoAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SvgPicture.asset(
        imageLink.logo,
      ),
    );
  }
}
