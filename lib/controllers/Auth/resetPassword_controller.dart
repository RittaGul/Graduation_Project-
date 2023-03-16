import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/authExeptionMessage.dart';
import 'package:graduation_project/core/functions/handlingData.dart';
import 'package:graduation_project/data/model/Auth/sendVerifyCodeModel.dart';
import 'package:graduation_project/data/remote/Auth/sendVerifyCodeData.dart';

abstract class resetPasswordController extends GetxController {
  goToVerifyCode();
}

class resetPasswordControllerImp extends resetPasswordController {
  late TextEditingController emailController;
  late StatusRequest statusRequest;
  late String getStatusMessage;
  @override
  goToVerifyCode() async {
    print('${emailController.text}');
    // Get.offNamed(AppRoute.verfiyCode, arguments: {
    //   'user_email': emailController.text,
    // });
    statusRequest = StatusRequest.loading;
    update();
    var res = await sendVerifyCodeData().postsendVerifyCodeData(
      sendVerifyCodeModel: SendVerifyCodeModel(
        user_email: emailController.text,
      ),
    );
    statusRequest = handlingData(res);
    update();
    if (statusRequest == StatusRequest.success) {
      getStatusMessage = res['STATUS'];

      if (getStatusMessage.toString().contains('SUCCESSFUL')) {
        Get.offNamed(AppRoute.verfiyCode, arguments: {
          'user_email': emailController.text,
        });
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
    emailController.clear();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    emailController = TextEditingController();
    getStatusMessage = '';
    super.onInit();
  }
}
