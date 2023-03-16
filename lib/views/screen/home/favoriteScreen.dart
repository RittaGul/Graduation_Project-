import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/widget/home/productContainer.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/Themes.dart';

class favoriteScreen extends StatefulWidget {
  @override
  State<favoriteScreen> createState() => _favoriteScreenState();
}

class _favoriteScreenState extends State<favoriteScreen> {
  homePageControllerImp s1 = Get.find();
  initailData() async {
    await s1.favoriteInfo();
  }

  @override
  void initState() {
    initailData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homePageControllerImp>(
      builder: ((controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (controller.statusRequest == StatusRequest.loading)
                    Center(
                      child: Transform.translate(
                        offset: Offset(0, 100),
                        child: Lottie.asset('assets/lottie/loading.json',
                            width: 300, height: 300),
                      ),
                    ),
                  if (controller.statusRequest == StatusRequest.emptyInfo)
                    Center(
                      child: Transform.translate(
                        offset: Offset(0, 100),
                        child: Column(
                          children: [
                            Lottie.asset('assets/lottie/emptyList.json',
                                width: 300, height: 300),
                            Text(
                              'Is Empty List',
                              style: Themes().headLine1,
                            )
                          ],
                        ),
                      ),
                    ),
                  if (controller.statusRequest == StatusRequest.success)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.25,
                            child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent:
                                    MediaQuery.of(context).size.height / 2.8,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: controller.favoriteProduct.length,
                              itemBuilder: (BuildContext context, int index) {
                                return productContainer(
                                  type: 2,
                                  allInfo: controller.favoriteProduct[index],
                                  productId: index,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
