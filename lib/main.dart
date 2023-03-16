import 'package:flutter/material.dart';
import 'package:graduation_project/controllers/Auth/authScreen_controller.dart';
import 'package:graduation_project/controllers/Auth/changePassword_Controller.dart';
import 'package:graduation_project/controllers/Auth/forgetPasswordConfirmation_Controller.dart';
import 'package:graduation_project/controllers/Auth/newAccountConfirmation_controller.dart';
import 'package:graduation_project/controllers/Auth/resetPassword_controller.dart';
import 'package:graduation_project/controllers/home/getPagesScreens_Controller.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/controllers/home/profile_controller.dart';
import 'package:graduation_project/controllers/start/onBoarding_Controller1.dart';
import 'package:graduation_project/core/constant/GetPages.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/localization/myLocale.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:get/get.dart';


void main() async {
  await initialServices();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  OnboardingControllerImp s1 = Get.put(OnboardingControllerImp());
  getPagesScreensControllerImp s2 = Get.put(getPagesScreensControllerImp());
  homePageControllerImp s3 = Get.put(homePageControllerImp());
  AuthScreenControllerImp s4 = Get.put(AuthScreenControllerImp());
  changePasswordControllerImp s5 = Get.put(changePasswordControllerImp());
  forgetPasswordConfirmationControllerImp s6 =
      Get.put(forgetPasswordConfirmationControllerImp());
  newAccountConfirmationControllerImp s7 =
      Get.put(newAccountConfirmationControllerImp());
  resetPasswordControllerImp s8 = Get.put(resetPasswordControllerImp());
  ProfileControllerImp s9 = Get.put(ProfileControllerImp());
  initailData() async {
    // await s9.getData();
    await s3.getData();
    // await s9.getproductById(1);
  }

  @override
  void initState() {
    initailData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      themeMode: ThemeMode.light,
      translations: MyTranslation(),
      locale: const Locale('en'),
      initialRoute: AppRoute.onboarding,
      getPages: GetPages().getPages,
      // home: background(),
    );
  }
}
