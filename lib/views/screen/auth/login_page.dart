import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/Auth/authScreen_controller.dart';
import 'package:graduation_project/core/constant/imageLink.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/widget/auth/custombuttomauth.dart';
import 'package:graduation_project/views/widget/auth/customfaceandgoogleauth.dart';
import 'package:graduation_project/views/widget/auth/customtextformauth.dart';
import 'package:graduation_project/views/widget/auth/customtextsignuporlogin.dart';
import 'package:graduation_project/views/widget/auth/customtexttitleauth.dart';
import 'package:graduation_project/views/widget/auth/logoauth.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LoginConrollerImp controller = Get.put(LoginConrollerImp());
    return GetBuilder<AuthScreenControllerImp>(
      builder: ((controller) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                LogoAuth(),
                SizedBox(
                  height: 20,
                ),
                CustomTextTitleAuth(text: "Log in"),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormAuth(
                  hinttext: 'Email',
                  assetname: imageLink.email_icon,
                  mycontroller: controller.emailController,
                  iconData: Icons.email_outlined,
                ),
                CustomTextFormAuth(
                  hinttext: 'Password',
                  assetname: imageLink.password_icon,
                  mycontroller: controller.passwordContoller,
                  iconData: Icons.lock_outline,
                ),
                GestureDetector(
                  onTap: () {
                    controller.forgetPassword();
                  },
                  child: Text(
                    "Forgot password ?!",
                    textAlign: TextAlign.end,
                    style: Themes()
                        .headLine3
                        .copyWith(fontSize: 15, color: Color(0xfffF67952)),
                  ),
                ),
                controller.statusRequest == StatusRequest.none
                    ? CustomButtomAuth(
                        text: "Log in",
                        onPressed: () async {
                          await controller.LoginMode();
                        })
                    : Lottie.asset(
                        'assets/lottie/loading.json',
                        height: 150,
                        width: 150,
                      ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text('OR'),
                    ),
                    SizedBox(
                      width: 120,
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFaceAndGoogleAuth(
                      onTap: () {},
                      iconData: Icon(
                        Icons.facebook_outlined,
                        size: 30,
                      ),
                      imageUrl: 'assets/images/facebookSvg.svg',
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    CustomFaceAndGoogleAuth(
                      onTap: () {},
                      iconData: Icon(
                        FontAwesomeIcons.google,
                        size: 30,
                      ),
                      imageUrl: 'assets/images/googleSvg.svg',
                    ),
                  ],
                ),
                SizedBox(height: 40),
                CustomTextSignUpOrLogIn(
                  title: "Don’t have an account  ? ",
                  choiceText: " Sign Up",
                  onTap: () async {
                    await controller.goToSignup();
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
