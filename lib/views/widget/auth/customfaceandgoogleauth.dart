import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:graduation_project/core/constant/imageLink.dart';

//اللوغو تبع الفيس و غوغل
class CustomFaceAndGoogleAuth extends StatelessWidget {
  final void Function()? onTap;
  var iconData;
  String imageUrl;
  CustomFaceAndGoogleAuth(
      {this.onTap, required this.iconData, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
