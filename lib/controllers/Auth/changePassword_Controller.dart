import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/authExeptionMessage.dart';
import 'package:graduation_project/core/functions/handlingData.dart';
import 'package:graduation_project/data/model/Auth/resetPasswordModel.dart';
import 'package:graduation_project/data/remote/Auth/resetPasswordData.dart';

abstract class changePasswordController extends GetxController {
  savedChangePassword();
}

class changePasswordControllerImp extends changePasswordController {
  late TextEditingController newPassword;
  late TextEditingController confimPassword;
  late StatusRequest statusRequest;
  late String getStatusMessage;
  @override
  savedChangePassword() async {
    print('${newPassword.text}');
    print('${confimPassword.text}');
    statusRequest = StatusRequest.loading;
    update();
    print('${Get.arguments['user_email']}');

    var res = await ResetPasswordData().postResetPassword(
        resetPasswordModel: ResetPasswordModel(
      user_email: Get.arguments['user_email'],
      user_password: newPassword.text,
      confirm_user_password: confimPassword.text,
    ));

    statusRequest = handlingData(res);
    if (statusRequest == StatusRequest.success) {
      getStatusMessage = res['STATUS'];
      if (getStatusMessage == 'SUCCESSFUL') {
        Get.offNamed(AppRoute.resetPasswordSuccessfully);
        statusRequest = StatusRequest.none;
        update();
      } else {
        authExeptionMessage(getStatusMessage);
        statusRequest = StatusRequest.none;
        update();
      }
    } else {
      statusRequest = handlingData(res);
      update();
    }
  }

  clearText() {
    newPassword.clear();
    confimPassword.clear();
  }

  @override
  void onInit() {
    newPassword = TextEditingController();
    confimPassword = TextEditingController();
    statusRequest = StatusRequest.none;
    getStatusMessage = '';
    super.onInit();
  }
}
