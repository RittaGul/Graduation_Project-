import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:flutter_svg/flutter_svg.dart';

//حقل نموذج النص
class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String assetname;
  final TextEditingController? mycontroller;
  final IconData iconData;
  const CustomTextFormAuth({
    required this.hinttext,
    required this.assetname,
    this.mycontroller,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: Themes().headLine3.copyWith(
                fontSize: 14,
              ),
          prefixIcon: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(),
            child: Icon(iconData),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
