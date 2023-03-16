import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/Auth/resetPassword_controller.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/views/widget/auth/custombuttomauth.dart';
import 'package:graduation_project/views/widget/auth/customtextbodyauth.dart';
import 'package:graduation_project/views/widget/auth/customtextformauth.dart';
import 'package:graduation_project/views/widget/auth/customtexttitleauth.dart';
import 'package:graduation_project/views/widget/auth/logoauth.dart';
import 'package:graduation_project/core/constant/imageLink.dart';
import 'package:lottie/lottie.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ForgetPasswordImp controller = Get.put(ForgetPasswordImp());
    return GetBuilder<resetPasswordControllerImp>(
      builder: ((controller) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoAuth(),
                SizedBox(
                  height: 20,
                ),
                CustomTextTitleAuth(text: "Forget Password "),
                SizedBox(height: 30),
                CustomTextBodyAuth(
                    text:
                        "please Enter Your Address To Receive A verification code"),
                SizedBox(
                  height: 50,
                ),
                CustomTextFormAuth(
                  iconData: Icons.email_outlined,
                  hinttext: 'Email',
                  assetname: imageLink.email_icon,
                  mycontroller: controller.emailController,
                ),
                controller.statusRequest == StatusRequest.none
                    ? CustomButtomAuth(
                        text: "Check",
                        onPressed: () {
                          controller.goToVerifyCode();
                        })
                    : Lottie.asset(
                        'assets/lottie/loading.json',
                        height: 150,
                        width: 150,
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
