import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/handlingData.dart';
import 'package:graduation_project/core/functions/snackBarMessage.dart';
import 'package:graduation_project/data/model/Auth/confirmationModel.dart';
import 'package:graduation_project/data/model/Auth/sendVerifyCodeModel.dart';
import 'package:graduation_project/data/remote/Auth/confirmationData.dart';
import 'package:graduation_project/data/remote/Auth/sendVerifyCodeData.dart';

abstract class forgetPasswordConfirmationController extends GetxController {
  successfullyScreen(value);
  goToLogin();
  resetPassword();
}

class forgetPasswordConfirmationControllerImp
    extends forgetPasswordConfirmationController {
  late String userVerifyCode;
  late StatusRequest statusRequest;

  @override
  successfullyScreen(value) async {
    print('$value');
    // Get.offNamed(AppRoute.resetPassword);

    userVerifyCode = value;
    statusRequest = StatusRequest.loading;
    update();

    var res = await confirmationData().PostconfirmationData(
        confirmationModel: ConfirmationModel(
      user_email: Get.arguments['user_email'],
      user_verifycode: value,
    ));
    statusRequest = handlingData(res);
    update();
    if (statusRequest == StatusRequest.success) {
      var statusMessage = res['STATUS'];

      if (statusMessage == 'SUCCESSFUL') {
        Get.offAllNamed(AppRoute.resetPassword, arguments: {
          'user_email': Get.arguments['user_email'],
        });
        statusRequest = StatusRequest.none;
        update();
      } else {
        sncakBarMessage('wrong entry', 'The code does not match');
        statusRequest = StatusRequest.none;
        update();
      }
    } else {
      statusRequest = handlingData(res);
      update();
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(
      AppRoute.login,
    );
  }

  @override
  void onInit() {
    userVerifyCode = '';
    statusRequest = StatusRequest.none;
    super.onInit();
  }

  @override
  sendVerifyCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await sendVerifyCodeData().postsendVerifyCodeData(
      sendVerifyCodeModel: SendVerifyCodeModel(
        user_email: Get.arguments['user_email'],
      ),
    );
    print('$statusRequest');
    statusRequest = handlingData(res);
    update();
    if (statusRequest == StatusRequest.success) {
      if (res['STATUS'] == 'SUCCESSFUL') {
        sncakBarMessage('wrong entry', 'send code successfully');
        statusRequest = StatusRequest.none;
        update();
      }
    } else {
      statusRequest = handlingData(res);
      update();
    }
  }

  @override
  resetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }
}
