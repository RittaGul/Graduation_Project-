import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/controllers/home/items.dart';
import '../../../core/theme/Themes.dart';
import '../../widget/auth/custombuttomauth.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var mediaSize, mediaHeight, mediaWidth;

  List color = [
    Colors.red,
    Colors.orange,
    Colors.black,
    Colors.green,
  ];

  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    mediaHeight = mediaSize.height;
    mediaWidth = mediaSize.width;
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                /* ${getItems[Get.arguments['index']]['imageLink']} */
                '${getItems[Get.arguments['index']]['imageLink']}',
                width: 200,
                height: 400,
                fit: BoxFit.fitWidth,
              ),
              Transform.translate(
                offset: Offset(0, -100),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    // height: double.infinity,
                    margin: EdgeInsets.only(top: 40),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${getItems[Get.arguments['index']]['title']} -------- ',
                              style: Themes().headLine2.copyWith(
                                    fontSize: 20,
                                    color: Color(0xfffF67952),
                                  ),
                            ),
                            Text(
                              "\$175",
                              style: Themes().headLine2.copyWith(
                                    color: Color(0xfffF67952),
                                  ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            '${getItems[Get.arguments['index']]['body']}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            "Colors ",
                            textAlign: TextAlign.start,
                            style: Themes().headLine3.copyWith(
                                fontSize: 20, color: Color(0xfffF67952)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: List.generate(
                            color.length,
                            (index) => Padding(
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
                                      backgroundColor: color[index],
                                    ),
                                    index == selectedColor
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 25,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomButtomAuth(text: "Add to Cart", onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
