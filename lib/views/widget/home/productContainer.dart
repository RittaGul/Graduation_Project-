// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graduation_project/core/functions/SizeConfig.dart';
import 'package:graduation_project/core/theme/Themes.dart';
import 'package:graduation_project/views/screen/home/detailsScreen.dart';
import 'package:lottie/lottie.dart';

class productContainer extends StatelessWidget {
  int productId;
  var allInfo;
  var tag;
  var type;
  productContainer({
    this.tag,
    required this.productId,
    required this.allInfo,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => detailsScreen(
              productid: productId,
              allInfo: allInfo,
              type: type,
            ),
          );
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: SizeConfig(context).widthScreen / 2,
            height: SizeConfig(context).heigthScreen / 2.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Center(
                      child: Text('not found'),
                    );
                  },
                  // fit: BoxFit.scaleDown,
                  imageUrl: '${allInfo.product_image}',
                  fadeInDuration: Duration(seconds: 2),
                  placeholderFadeInDuration: Duration(seconds: 1),
                  fadeOutDuration: Duration(seconds: 2),
                  imageBuilder: (context, imageProvider) => Hero(
                    tag: tag ?? productId,
                    child: Container(
                      width: SizeConfig(context).widthScreen / 1.5,
                      height: SizeConfig(context).heigthScreen / 7,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: imageProvider,
                          // fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Container(
                    alignment: Alignment.center,
                    width: SizeConfig(context).widthScreen / 1.5,
                    height: SizeConfig(context).heigthScreen / 7,
                    child: Lottie.asset('assets/lottie/loading.json'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${allInfo.product_price} TL',
                  style: Themes().headLine2.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: Text(
                    (allInfo.product_title as String).length > 35
                        ? '${allInfo.product_title.substring(0, 34)} ... '
                        : allInfo.product_title,
                    style: Themes().headLine1.copyWith(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < int.parse(allInfo.product_stars)
                            ? Icons.star_sharp
                            : Icons.star_outline_sharp,
                        color: index < int.parse(allInfo.product_stars)
                            ? Colors.orange
                            : Colors.black,
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
