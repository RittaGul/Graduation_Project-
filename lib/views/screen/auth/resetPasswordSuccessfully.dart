import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/Auth/authScreen_controller.dart';
import 'package:graduation_project/views/widget/auth/successfullyConfirmation.dart';

class resetPasswordSuccessfully extends StatelessWidget {
  AuthScreenControllerImp forgetPassword = Get.find();
  @override
  Widget build(BuildContext context) {
    return successfulConfirmation(
      timeEndFunc: () {
        forgetPassword.goToLogin();
      },
      bodyMessage: 'Password changed \nsuccessfully',
    );
  }
}
