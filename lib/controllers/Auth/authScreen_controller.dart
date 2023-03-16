import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/authExeptionMessage.dart';
import 'package:graduation_project/core/functions/handlingData.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/data/model/Auth/LoginModel.dart';
import 'package:graduation_project/data/model/Auth/SignUpModel.dart';
import 'package:graduation_project/data/remote/Auth/loginData.dart';
import 'package:graduation_project/data/remote/Auth/signUpData.dart';

abstract class AuthScreenController extends GetxController {
  changeAuthMode();
  forgetPassword();
  LoginMode();
  SignUpMode();
  goToLogin();
  goToSignup();
}

enum AuthMode { Login, SignUp }

MyServices myServices = Get.find();

class AuthScreenControllerImp extends AuthScreenController {
  late AuthMode authMode;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordContoller;
  late StatusRequest statusRequest;
  late String getStatusMessage;
  @override
  changeAuthMode() async {
    if (authMode == AuthMode.Login) {
      authMode = AuthMode.SignUp;
      clearItems();
    } else {
      authMode = AuthMode.Login;
      clearItems();
    }
  }

  void clearItems() {
    userNameController.clear();
    emailController.clear();
    passwordContoller.clear();
  }

  @override
  forgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
    clearItems();
  }

  @override
  LoginMode() async {
    print('=========${emailController.text}');
    print('=========${passwordContoller.text}');
    statusRequest = StatusRequest.loading;
    update();
    var res = await LoginData().postLoginData(
      loginModel: LoginModel(
        user_email: emailController.text,
        user_password: passwordContoller.text,
      ),
    );
    statusRequest = handlingData(res);
    update();
    print('===========$res');
    if (statusRequest == StatusRequest.success) {
      getStatusMessage = res['STATUS'];

      if (getStatusMessage.toString().contains('SUCCESSFUL')) {
        var getInfo = res['INFO'][0];
        if (getInfo['user_approve'] == 0) {
          Get.toNamed(AppRoute.EmailVerifyCode, arguments: {
            'user_email': emailController.text,
          });
        } else {
          myServices.sharedPreferences
              .setString('user_name', getInfo['user_name']);
          myServices.sharedPreferences
              .setString('user_email', getInfo['user_email']);
          myServices.sharedPreferences.setString('user_id', getInfo['user_id']);
          myServices.sharedPreferences.setInt('step', 1);
          Get.offAllNamed(AppRoute.getPagesScreens);
        }
        clearItems();
      } else {
        authExeptionMessage(getStatusMessage);
      }
      statusRequest = StatusRequest.none;
      update();
    } else {
      statusRequest = handlingData(res);
      update();
    }
  }

  @override
  SignUpMode() async {
    print('=========${emailController.text}');
    print('=========${passwordContoller.text}');
    print('=========${userNameController.text}');

    statusRequest = StatusRequest.loading;
    update();
    var res = await signUpData().postSignUpData(
      signUpModel: SignUpModel(
        user_email: emailController.text,
        user_name: userNameController.text,
        user_password: passwordContoller.text,
      ),
    );

    statusRequest = handlingData(res);
    update();
    if (statusRequest == StatusRequest.success) {
      getStatusMessage = res['STATUS'];
      if (getStatusMessage.toString().contains('SUCCESSFUL')) {
        Get.toNamed(AppRoute.EmailVerifyCode, arguments: {
          'user_email': emailController.text,
        });
        clearItems();
        authMode = AuthMode.Login;
        update();
      } else {
        authExeptionMessage(getStatusMessage);
      }
      statusRequest = StatusRequest.none;
      update();
    } else {
      statusRequest = handlingData(res);
      update();
      print('$statusRequest');
    }
  }

  @override
  void onInit() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordContoller = TextEditingController();
    authMode = AuthMode.Login;
    statusRequest = StatusRequest.none;
    getStatusMessage = '';
    super.onInit();
  }

  @override
  void dispose() {
    userNameController.clear();
    emailController.clear();
    passwordContoller.clear();
    userNameController.dispose();
    emailController.dispose();
    passwordContoller.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoute.login);
  }

  @override
  goToSignup() {
    Get.toNamed(AppRoute.signUp);
  }
}
