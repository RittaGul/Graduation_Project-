import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/controllers/Auth/forgetPasswordConfirmation_Controller.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/views/widget/auth/customtextbodyauth.dart';
import 'package:graduation_project/views/widget/auth/customtexttitleauth.dart';
import 'package:graduation_project/views/widget/auth/logoauth.dart';
import 'package:lottie/lottie.dart';

class VerfiyCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // VerfiyCodeControllerImp controller = Get.put(VerfiyCodeControllerImp());
    return GetBuilder<forgetPasswordConfirmationControllerImp>(
        builder: ((controller) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: controller.statusRequest == StatusRequest.none ? 0 : 1,
                child: Center(
                  child: Lottie.asset('assets/lottie/loading.json'),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity:
                    controller.statusRequest == StatusRequest.none ? 1 : .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoAuth(),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextTitleAuth(text: "verification code"),
                    SizedBox(height: 30),
                    CustomTextBodyAuth(text: "Check code"),
                    SizedBox(height: 10),
                    CustomTextBodyAuth(
                        text:
                            "please Enter The Digit Code Sent To \n${Get.arguments['user_email']}"),
                    SizedBox(
                      height: 25,
                    ),
                    OtpTextField(
                      borderRadius: BorderRadius.circular(20),
                      fieldWidth: 50,
                      numberOfFields: 5,
                      borderColor: Color(0xfffF67952),
                      showFieldAsBox: true,

                      onSubmit: (String verificationCode) {
                        controller.successfullyScreen(verificationCode);
                      }, // end onSubmit
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'To send the code again, ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.sendVerifyCode();
                          },
                          child: Text(
                            'click here.',
                            style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              color: Colors.redAccent.withOpacity(.8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
