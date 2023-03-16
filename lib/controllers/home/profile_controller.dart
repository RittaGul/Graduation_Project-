import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/handlingData.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/data/model/home/profileModel.dart';
import 'package:graduation_project/data/remote/home/profileData.dart';

abstract class ProfileController extends GetxController {
  getData();
  editUserName();
  editBio();
  editProfileImage(user_image);
}

MyServices myServices = Get.find();

class ProfileControllerImp extends ProfileController {
  var profileModel;
  late StatusRequest statusRequest;
  late TextEditingController user_name;
  late TextEditingController user_bio;
  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    profileModel = '';
    user_name = TextEditingController();
    user_bio = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    user_bio.clear();
    user_name.clear();
    super.dispose();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    Future.delayed(Duration(seconds: 2), () async {
      var res = await profileData().PostprofileData(
          userId: "${myServices.sharedPreferences.getString('user_id')}");
      statusRequest = handlingData(res);
      if (statusRequest == StatusRequest.success) {
        profileModel = ProfileModel.fromJson(res['INFO'][0]);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    });
  }

  @override
  editUserName() async {
    var res = await profileData().editUserName(
      userId: '${myServices.sharedPreferences.getString('user_id')}',
      user_name: '${user_name.text}',
    );
    user_name.clear();
    print('${res}');
    await getData();
  }

  @override
  editBio() async {
    var res = await profileData().editBio(
      userId: '${myServices.sharedPreferences.getString('user_id')}',
      user_bio: '${user_bio.text}',
    );
    user_bio.clear();
    print('${res}');
    await getData();
  }

  @override
  editProfileImage(user_image) async {
    var res = await profileData().editUserProfile(
      userId: '${myServices.sharedPreferences.getString('user_id')}',
      user_image: user_image,
    );

    print('${res}');
    await getData();
  }
}
