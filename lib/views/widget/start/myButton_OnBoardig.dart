import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:graduation_project/controllers/start/onBoarding_Controller1.dart';
import 'package:graduation_project/core/constant/onBoarding_inf.dart';
import 'package:graduation_project/core/theme/Themes.dart';

class myButtonOnBoardig extends GetView<OnboardingControllerImp> {
  String skip;
  String next;
  String getStarted;
  myButtonOnBoardig({
    required this.skip,
    required this.next,
    required this.getStarted,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              controller.skip();
            },
            child: Text(
              '$skip',
              style: Themes().headLine2.copyWith(
                    color: Colors.black54,
                  ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
            onPressed: () {
              controller.next();
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                controller.currentPage == onBoardingList.length - 1
                    ? "$getStarted"
                    : "$next",
                style: Themes().headLine2.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
