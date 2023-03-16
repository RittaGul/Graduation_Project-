import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/start/onBoarding_Controller1.dart';
import 'package:graduation_project/core/constant/onBoarding_inf.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/widget/start/myButton_OnBoardig.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  OnboardingControllerImp _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              physics: BouncingScrollPhysics(),
              controller: _controller.pageController,
              onPageChanged: (val) {
                setState(() {
                  _controller.onPageChange(val);
                });
              },
              children: List.generate(
                  onBoardingList.length,
                  (index) => Container(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(onBoardingList[index].imageAsset),
                            SizedBox(height: 80),
                            Text(
                              '${onBoardingList[index].title}'.tr,
                              style: Themes().headLine2.copyWith(
                                    fontSize: 28,
                                  ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(
                                '${onBoardingList[index].description}'.tr,
                                textAlign: TextAlign.center,
                                style: Themes().headLine2.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        margin: EdgeInsets.all(2),
                        width: _controller.currentPage == index ? 25 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _controller.currentPage == index
                              ? Color.fromARGB(255, 238, 118, 118)
                              : Colors.black38,
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                myButtonOnBoardig(
                  skip: '7'.tr,
                  getStarted: '8'.tr,
                  next: '9'.tr,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
