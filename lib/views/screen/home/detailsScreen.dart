import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/categories_Controller.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/core/constant/getProducts.dart';
import 'package:graduation_project/core/functions/SizeConfig.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/data/model/home/homePageModel.dart';
import 'package:graduation_project/views/widget/home/categoreisItems.dart';
import 'package:graduation_project/views/widget/home/productContainer.dart';
import 'package:lottie/lottie.dart';

class detailsScreen extends StatefulWidget {
  int productid;
  var allInfo;
  var type;
  detailsScreen({
    required this.type,
    required this.productid,
    required this.allInfo,
  });
  @override
  State<detailsScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<detailsScreen> {
  var colors = [
    Colors.red,
    Colors.black,
    Colors.blue,
  ];
  var selectedColor = 0;

  bool favorite = false;

  bool card = false;

  int countNumber = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homePageControllerImp>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 255, 92, 47).withOpacity(.6),
                          ),
                      // width: double.infinity,
                      height: 200,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) {
                          return Center(
                            child: Text('not found'),
                          );
                        },
                        // fit: BoxFit.scaleDown,
                        imageUrl: '${widget.allInfo.product_image}',
                        fadeInDuration: Duration(seconds: 4),
                        placeholderFadeInDuration: Duration(seconds: 3),
                        fadeOutDuration: Duration(seconds: 4),
                        imageBuilder: (context, imageProvider) => Hero(
                          tag: widget.productid,
                          child: Container(
                            width: SizeConfig(context).widthScreen / 1.2,
                            height: SizeConfig(context).heigthScreen / 2.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.scaleDown,
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
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          '${widget.allInfo.product_supTitle}',
                          style: Themes().headLine1.copyWith(
                                color: Color.fromARGB(255, 38, 94, 122),
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    countNumber++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  border: Border.all(
                                      color: Colors.black, width: 1.2),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  '${countNumber}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (countNumber > 0) countNumber--;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              '${widget.allInfo.product_price} TL',
                              style: Themes().headLine1.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255, 255, 92, 47),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        // color: Colors.red,
                        width: double.infinity,
                        child: Text(
                          '${widget.allInfo.product_title}',
                          style: Themes().headLine1.copyWith(
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          'Available colors',
                          style: Themes().headLine1.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: List.generate(colors.length, ((index) {
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor:
                                        Color.fromARGB(179, 240, 128, 128),
                                    child: CircleAvatar(
                                      backgroundColor: colors[index] as Color,
                                      radius: 20,
                                    ),
                                  ),
                                  if (selectedColor == index)
                                    Icon(
                                      Icons.check,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                ],
                              ),
                            ),
                          );
                        })),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    card = !card;
                                  });
                                },
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: !card ? Colors.black : Colors.green,
                                  size: 30,
                                ),
                              ),
                              AnimatedOpacity(
                                opacity: card ? 0 : 1,
                                duration: Duration(milliseconds: 400),
                                child: Text(
                                  'Add To Card',
                                  style: Themes().headLine1.copyWith(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(0, -20),
                                child: AnimatedOpacity(
                                  opacity: !card ? 0 : 1,
                                  duration: Duration(milliseconds: 600),
                                  child: Text(
                                    'Added',
                                    style: Themes().headLine1.copyWith(
                                          color: Colors.green,
                                          fontSize: 15,
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await controller.favorite(
                                    widget.allInfo.product_id,
                                    widget.type,
                                  );
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: int.parse(widget.allInfo.favorite) == 0
                                      ? Colors.black
                                      : Colors.red,
                                  size: 30,
                                ),
                              ),
                              AnimatedOpacity(
                                opacity: int.parse(widget.allInfo.favorite)  == 1 ? 0 : 1,
                                duration: Duration(milliseconds: 400),
                                child: Text(
                                  'Add to favorite',
                                  style: Themes().headLine1.copyWith(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(0, -20),
                                child: AnimatedOpacity(
                                  opacity: int.parse(widget.allInfo.favorite) == 0 ? 0 : 1,
                                  duration: Duration(milliseconds: 600),
                                  child: Text(
                                    'Added',
                                    style: Themes().headLine1.copyWith(
                                          color: Colors.red,
                                          fontSize: 15,
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'similar products',
                        style: Themes().headLine1.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GetBuilder<homePageControllerImp>(
                        builder: ((controller) {
                          return SizedBox(
                            width: double.infinity,
                            height: SizeConfig(context).heigthScreen / 2.7,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.allInfo.length,
                              itemBuilder: ((context, index) {
                                return productContainer(
                                  type: '',
                                  tag: index + 100,
                                  allInfo: controller.allInfo[index],
                                  productId: index,
                                );
                              }),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
