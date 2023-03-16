import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/Themes.dart';

//النص تبع عنوان الصفحة فوق
class CustomTextTitleAuth extends StatelessWidget {
  final String text;

  const CustomTextTitleAuth({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Themes().headLine4.copyWith(fontSize: 23),
    );
  }
}
