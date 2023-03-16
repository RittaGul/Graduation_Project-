import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/Auth/changePassword_Controller.dart';
import 'package:graduation_project/views/widget/auth/custombuttomauth.dart';
import 'package:graduation_project/views/widget/auth/customtextbodyauth.dart';
import 'package:graduation_project/views/widget/auth/customtextformauth.dart';
import 'package:graduation_project/views/widget/auth/customtexttitleauth.dart';
import 'package:graduation_project/views/widget/auth/logoauth.dart';
import 'package:graduation_project/core/constant/imageLink.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ResetPasswordControllerImp controller =
    //     Get.put(ResetPasswordControllerImp());
    return GetBuilder<changePasswordControllerImp>(builder: ((controller) {
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
              CustomTextTitleAuth(text: "Reset Password"),
              SizedBox(
                height: 10,
              ),
              CustomTextBodyAuth(text: "Please Enter new Password"),
              SizedBox(height: 20),
              CustomTextFormAuth(
                mycontroller: controller.newPassword,
                iconData: Icons.lock_outline,
                hinttext: 'Enter your password',
                assetname: imageLink.password_icon,
              ),
              CustomTextFormAuth(
                mycontroller: controller.confimPassword,
                iconData: Icons.lock_outline,
                hinttext: 'Re Enter your password',
                assetname: imageLink.password_icon,
              ),
              CustomButtomAuth(
                text: "save",
                onPressed: () async {
                  await controller.savedChangePassword();
                },
              ),
            ],
          ),
        ),
      );
    }));
  }
}
