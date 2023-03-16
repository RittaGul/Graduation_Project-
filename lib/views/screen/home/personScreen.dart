import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/profile_controller.dart';
import 'package:graduation_project/core/constant/imageLink.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/SizeConfig.dart';
import 'package:graduation_project/views/widget/auth/customtextformauth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../../core/theme/Themes.dart';

class PersonScreen extends StatefulWidget {
  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  ProfileControllerImp s1 = Get.find();
  initialData() async {
    await s1.getData();
  }

  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    initialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(builder: ((controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.statusRequest == StatusRequest.loading)
                  Transform.translate(
                    offset: Offset(0, -100),
                    child: Lottie.asset('assets/lottie/loading.json',
                        width: 300, height: 300),
                  ),
                if (controller.statusRequest == StatusRequest.failure)
                  Transform.translate(
                    offset: Offset(0, -100),
                    child: Lottie.asset('assets/lottie/offline.json',
                        width: 300, height: 300),
                  ),
                if (controller.statusRequest == StatusRequest.success)
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 100, left: 20, right: 20),
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 231, 225, 225),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  controller.profileModel.user_bio != ''
                                      ? '${controller.profileModel.user_bio}'
                                      : "bio has not been added yet ..!!",
                                  style:
                                      Themes().headLine3.copyWith(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Personal Information :",
                                      style: Themes().headLine2.copyWith(
                                            fontSize: 22,
                                            color: Color.fromARGB(
                                                255, 228, 112, 112),
                                          ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Card(
                                        elevation: 20,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          // margin: EdgeInsets.all(30),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "User Name :  ",
                                                    style: Themes()
                                                        .headLine2
                                                        .copyWith(
                                                          fontSize: 18,
                                                          color: Color.fromARGB(
                                                              255,
                                                              228,
                                                              112,
                                                              112),
                                                        ),
                                                  ),
                                                  Text(
                                                    "email :  ",
                                                    style: Themes()
                                                        .headLine2
                                                        .copyWith(
                                                          fontSize: 18,
                                                          color: Color.fromARGB(
                                                              255,
                                                              228,
                                                              112,
                                                              112),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    child: Text(
                                                      '${controller.profileModel.user_name} ',
                                                      style: Themes()
                                                          .headLine3
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 150,
                                                    // color: Colors.red,
                                                    child: Text(
                                                      (controller.profileModel
                                                                          .user_email
                                                                      as String)
                                                                  .length >
                                                              14
                                                          ? '${(controller.profileModel.user_email as String).substring(0, 13)}... '
                                                          : '${controller.profileModel.user_email}',
                                                      style: Themes()
                                                          .headLine3
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -60),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Color.fromARGB(255, 228, 112, 112),
                          child: CircleAvatar(
                            radius: 68,
                            backgroundColor: Colors.white54.withOpacity(.6),
                            child: controller.profileModel.user_image == ''
                                ? Icon(
                                    Icons.person,
                                    color: Colors.black.withOpacity(.4),
                                    size: 55,
                                  )
                                : CachedNetworkImage(
                                    errorWidget: (context, url, error) {
                                      return Center(
                                        child: Text('not found'),
                                      );
                                    },
                                    // fit: BoxFit.scaleDown,
                                    imageUrl:
                                        '${linkServer}/upload/${controller.profileModel.user_image}',
                                    fadeInDuration: Duration(seconds: 2),
                                    placeholderFadeInDuration:
                                        Duration(seconds: 1),
                                    fadeOutDuration: Duration(seconds: 2),
                                    imageBuilder: (context, imageProvider) =>
                                        ClipOval(
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          // color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Container(
                                      alignment: Alignment.center,
                                      width:
                                          SizeConfig(context).widthScreen / 1.5,
                                      height:
                                          SizeConfig(context).heigthScreen / 7,
                                      child: Lottie.asset(
                                          'assets/lottie/loading.json'),
                                    ),
                                  ),

                            /* ClipOval(
                                    child: Image.network(
                                      '${linkServer}/upload/${controller.profileModel.user_image}',
                                      fit: BoxFit.cover,
                                      width: 350,
                                      height: 350,
                                    ),
                                  ), */
                          ),
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 15, top: 15),
                          child: PopupMenuButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.black,
                            ),
                            iconSize: 30,
                            onSelected: (item) =>
                                onSelected(context, item as int),
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                child: Text("Edit user name"),
                                value: 0,
                              ),
                              const PopupMenuItem(
                                child: Text("Edit profile"),
                                value: 1,
                              ),
                              const PopupMenuItem(
                                child: Text("Edit bio"),
                                value: 2,
                              ),
                              const PopupMenuItem(
                                child: Text("Log Out"),
                                value: 3,
                              )
                            ],
                          ))
                    ],
                  )
              ],
            )),
          ),
        ),
      );
    }));
  }

  void onSelected(BuildContext context, int item) async {
    switch (item) {
      case 0:
        updateUserInf(
            title: 'User Name',
            hintTitle: 'enter your user name here .',
            label: 'usre name',
            controller: s1.user_name,
            func: () async {
              await s1.editUserName();
              Get.back();
            });
        break;
      case 1:
        final ImagePicker _picker = ImagePicker();
        File? pickedImage;

        final image = await _picker.pickImage(
            source: ImageSource.gallery, imageQuality: 60);
        if (image == null) {
          return;
        } else {
          setState(() {
            pickedImage = File(image.path);
          });
          s1.editProfileImage(pickedImage);
        }
        break;
      case 2:
        updateUserInf(
            maxChar: 60,
            title: 'Bio',
            hintTitle: 'enter your bio here .',
            label: 'Bio',
            controller: s1.user_bio,
            func: () async {
              await s1.editBio();
              Get.back();
            });
        break;
      case 3:
        break;
    }
  }

  Future updateUserInf(
      {required String title,
      required String hintTitle,
      required String label,
      required TextEditingController controller,
      var func,
      var maxChar}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: TextField(
          controller: controller,
          style: TextStyle(
            color: Colors.black,
          ),
          autofocus: true,
          decoration: InputDecoration(
            hintText: hintTitle,
            label: Text('$label'),
            border: OutlineInputBorder(),
          ),
          maxLength: maxChar ?? 20,
        ),
        actions: [
          ElevatedButton(
            onPressed: func,
            child: Text(
              'Submit',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Close'),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
