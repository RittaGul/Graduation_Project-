import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/profile_controller.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/functions/SizeConfig.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/data/model/home/profileModel.dart';
import 'package:lottie/lottie.dart';

class DrawerScreen extends GetView<ProfileControllerImp> {
  MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(left: 15, top: 50),
      color: Color.fromARGB(255, 211, 133, 133),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 64,
                backgroundColor: Color.fromARGB(255, 228, 112, 112),
                child: CircleAvatar(
                  radius: 58,
                  backgroundColor: Colors.white54.withOpacity(.6),
                  child: controller.profileModel.user_image == ""
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
                          placeholderFadeInDuration: Duration(seconds: 1),
                          fadeOutDuration: Duration(seconds: 2),
                          imageBuilder: (context, imageProvider) => ClipOval(
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Container(
                            alignment: Alignment.center,
                            width: SizeConfig(context).widthScreen / 1.5,
                            height: SizeConfig(context).heigthScreen / 7,
                            child: Lottie.asset('assets/lottie/loading.json'),
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
              SizedBox(
                height: 15,
              ),
              Text(
                '${controller.profileModel.user_name}',
                style: Themes()
                    .headLine4
                    .copyWith(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${controller.profileModel.user_email}',
                style: Themes()
                    .headLine4
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              getDrawerButtons(() {}, Icons.home_outlined, 'Home Page'),
              getDrawerButtons(() {}, Icons.favorite_border, 'Favorite'),
              getDrawerButtons(() {}, Icons.person_outline_outlined, 'Profile'),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: getDrawerButtons(() async {
              await myServices.sharedPreferences.clear();
              Get.offAllNamed(AppRoute.login);
            }, Icons.logout_outlined, 'Log Out'),
          )
        ],
      ),
    );
  }

  getDrawerButtons(var func, IconData iconData, String title) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: func,
        child: Row(
          children: [
            Card(
              color: Colors.white.withOpacity(.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.5),
                ),
                child: Icon(
                  iconData,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
