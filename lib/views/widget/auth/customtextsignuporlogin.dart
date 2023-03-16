import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/Themes.dart';

//النص تبع هل عندك حساب و كذا
class CustomTextSignUpOrLogIn extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String choiceText;

  const CustomTextSignUpOrLogIn(
      {required this.title, required this.onTap, required this.choiceText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Themes().headLine3.copyWith(fontSize: 14),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            choiceText,
            style: Themes().headLine2.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
