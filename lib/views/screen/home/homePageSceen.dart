import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/controllers/home/items.dart';
import 'package:graduation_project/core/constant/getProducts.dart';
import 'package:graduation_project/core/functions/SizeConfig.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/screen/home/DrawerScreen.dart';
import 'package:graduation_project/views/screen/home/categoriesScreen.dart';
import 'package:graduation_project/views/widget/home/TextFaildSearth.dart';
import 'package:graduation_project/views/widget/home/categoreisItems.dart';
import 'package:graduation_project/views/widget/home/productContainer.dart';

class homePageScreen extends StatefulWidget {
  @override
  State<homePageScreen> createState() => _homePageScreenState();
}

class _homePageScreenState extends State<homePageScreen> {
  homePageControllerImp s1 = Get.find();
  initialData() async {
    await s1.getData();
    print('asdas');
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }

  TextEditingController controller1 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homePageControllerImp>(builder: ((homePage) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore',
                    style: Themes().headLine2.copyWith(
                          fontSize: 30,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'best outfits for you',
                    style: Themes().headLine3.copyWith(
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFaildSearth(
                    title: 'Search items',
                    textEditingController: controller1,
                    onPressedSearch: () {},
                    onPressedIcon: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  categoreisItem(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrival',
                        style: Themes().headLine4.copyWith(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await homePage.getproductById(5);
                          Get.to(
                            () => categoriesScreen(categoryIndex: 4),
                          );
                        },
                        child: Text(
                          'See All',
                          style: Themes().headLine3.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 255, 92, 47),
                              ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig(context).heigthScreen / 2.7,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemCount: homePage.allInfo.length,
                        itemBuilder: ((context, index) {
                          return productContainer(
                            type: 0,
                            allInfo: homePage.allInfo[index],
                            productId: index,
                          );
                        })),
                  ),
                  SizedBox(
                    height: SizeConfig(context).heigthScreen / 10.5,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
