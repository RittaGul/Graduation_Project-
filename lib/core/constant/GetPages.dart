import 'package:get/get.dart';
import 'package:graduation_project/controllers/middleware/AuthMiddleware.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/views/screen/auth/EmailVerifyCode.dart';
import 'package:graduation_project/views/screen/auth/PasswordVerfiyCode_page.dart';
import 'package:graduation_project/views/screen/auth/createdNewAccountSuccessfully.dart';
import 'package:graduation_project/views/screen/auth/forgetpassword_page.dart';
import 'package:graduation_project/views/screen/auth/login_page.dart';
import 'package:graduation_project/views/screen/auth/resetPasswordSuccessfully.dart';
import 'package:graduation_project/views/screen/auth/resetpassword_page.dart';
import 'package:graduation_project/views/screen/auth/signup_page.dart';
import 'package:graduation_project/views/screen/auth/successresetpassword_page.dart';
import 'package:graduation_project/views/screen/auth/successsignup_page.dart';
import 'package:graduation_project/views/screen/home/ProductDetalls.dart';
import 'package:graduation_project/views/screen/home/getPages.dart';
import 'package:graduation_project/views/screen/home/homePageSceen.dart';
import 'package:graduation_project/views/screen/start/onboarding_page.dart';

class GetPages {
  List<GetPage> getPages = [
    // on boardinggggg
    GetPage(
      name: AppRoute.onboarding,
      page: () => OnboardingPage(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    //Authhhhhhhh
    GetPage(name: AppRoute.login, page: () => Login()),
    GetPage(name: AppRoute.signUp, page: () => SignUp()),
    GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: AppRoute.verfiyCode, page: () => VerfiyCode()),
    GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
    GetPage(
        name: AppRoute.successResetPassword,
        page: () => SuccessResetPassword()),
    GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
    GetPage(name: AppRoute.homePageScreen, page: (() => homePageScreen())),

    GetPage(name: AppRoute.getPagesScreens, page: (() => getPagesScreens())),
    GetPage(
        name: AppRoute.ProductDetailsScreen,
        page: (() => ProductDetailsScreen())),
    GetPage(name: AppRoute.EmailVerifyCode, page: (() => EmailVerifyCode())),
    GetPage(
        name: AppRoute.createdNewAccountSuccessfully,
        page: (() => createdNewAccountSuccessfully())),
    GetPage(
        name: AppRoute.resetPasswordSuccessfully,
        page: (() => resetPasswordSuccessfully())),
  ];
}
