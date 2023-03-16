import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/getPagesScreens_Controller.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/screen/home/DrawerScreen.dart';
import 'package:graduation_project/views/widget/home/bottomAppbarMaterialButton.dart';

class getPagesScreens extends GetView<getPagesScreensControllerImp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<getPagesScreensControllerImp>(builder: ((controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            controller.pageIndex == 0
                ? Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.notifications,
                      size: 30,
                      color: Color.fromARGB(255, 255, 92, 47),
                    ),
                  )
                : Container(),
          ],
          title: Text(
            '${controller.getPages[controller.pageIndex]['title']}',
            style: Themes().headLine1,
          ),
        ),

        ///البوتونات اللي تحت
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            controller.getPages[controller.pageIndex]['page'] as Widget,
            Card(
              elevation: 10,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 92, 47),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    controller.getPages.length,
                    (index) => bottomAppbarMaterialButton(
                      title: '${controller.getPages[index]['title']}',
                      onPressedIcon: () {
                        controller.changePageIndex(index);
                      },
                      iconData: controller.getPages[index]['icon'] as IconData,
                      selectIconData:
                          controller.getPages[index]['selectIcon'] as IconData,
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }
}
