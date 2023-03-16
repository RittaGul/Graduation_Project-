import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/services/services.dart';

MyServices myServices = Get.find();

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getInt('step') == 1) {
      return RouteSettings(name: AppRoute.getPagesScreens);
    } else if (myServices.sharedPreferences.getInt('step') == 0) {
      return RouteSettings(name: AppRoute.login);
    }
  }
}
