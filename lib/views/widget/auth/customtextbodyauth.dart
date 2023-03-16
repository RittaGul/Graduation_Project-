import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/Themes.dart';

//النص الطويييل بالصفحات
class CustomTextBodyAuth extends StatelessWidget {
  final String text;

  const CustomTextBodyAuth({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Themes().headLine3.copyWith(fontSize: 17),
    );
  }
}
