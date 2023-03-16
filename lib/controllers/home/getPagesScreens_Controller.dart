import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/views/screen/home/favoriteScreen.dart';
import 'package:graduation_project/views/screen/home/homePageSceen.dart';

import '../../views/screen/home/personScreen.dart';

abstract class getPagesScreensController extends GetxController {
  changePageIndex(int i);
}

class getPagesScreensControllerImp extends getPagesScreensController {
  late int pageIndex;
  var getPages = [
    {
      'title': 'Home Page',
      'page': homePageScreen(),
      'icon': Icons.home_outlined,
      'selectIcon': Icons.home
    },
    {
      'title': 'Favorite',
      'page': favoriteScreen(),
      'icon': Icons.favorite_outline,
      'selectIcon': Icons.favorite_outlined
    },
    {
      'title': 'Profile',
      'page': PersonScreen(),
      'icon': Icons.person_outline,
      'selectIcon': Icons.person
    },
  ];

  @override
  changePageIndex(int i) {
    pageIndex = i;
    update();
    print('========$pageIndex');
  }

  @override
  void onInit() {
    pageIndex = 0;
    super.onInit();
  }
}
