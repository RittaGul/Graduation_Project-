import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/Themes.dart';

//الزر تبع اللوغ ان و كذاااااا
class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  CustomButtomAuth({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            text,
            style: Themes().headLine2.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
