import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/categories_Controller.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/core/constant/getCategories.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/SizeConfig.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/widget/home/productContainer.dart';
import 'package:lottie/lottie.dart';

class categoriesScreen extends StatefulWidget {
  int categoryIndex;
  categoriesScreen({required this.categoryIndex});
  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  // homePageControllerImp s1 = Get.find();
  // initialData() async {
  //   await s1.getproductById(widget.categoryIndex);
  // }

  // @override
  // void initState() {
  //   initialData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homePageControllerImp>(builder: ((controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [],
          title: Text(
            'Categoires',
            style: Themes().headLine1.copyWith(
                  fontSize: 25,
                  color: Colors.black,
                ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              if (controller.statusRequest == StatusRequest.loading)
                Transform.translate(
                  offset: Offset(0, 100),
                  child: Lottie.asset('assets/lottie/loading.json',
                      width: 300, height: 300),
                ),
              if (controller.statusRequest == StatusRequest.emptyInfo)
                Transform.translate(
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
              if (controller.statusRequest == StatusRequest.success)
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.2,
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
                            itemCount: controller.categoryInfo.length,
                            itemBuilder: (BuildContext context, int index) {
                              return productContainer(
                                type: 1,
                                allInfo: controller.categoryInfo[index],
                                productId: index,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              SizedBox(
                width: 400,
                height: SizeConfig(context).heigthScreen / 20,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    scrollDirection: Axis.horizontal,
                    itemCount: getCategories.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            controller.categoryInfo = [];
                            widget.categoryIndex = index;
                          });
                          await controller.getproductById('${index + 1}');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Text(
                                '${getCategories[index]['title']}',
                                style: Themes().headLine2.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: widget.categoryIndex == index ? 100 : 0,
                                height: widget.categoryIndex == index ? 2 : 0,
                                color: const Color.fromARGB(255, 255, 92, 47),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
