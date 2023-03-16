import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomePageModel {
  var product_id;
  var categories_id;
  var product_price;
  String product_image;
  String product_title;
  String product_supTitle;
  var product_stars;
  String favorite;
  HomePageModel(
      {required this.product_id,
      required this.categories_id,
      required this.product_price,
      required this.product_image,
      required this.product_title,
      required this.product_supTitle,
      required this.product_stars,
      required this.favorite});

  factory HomePageModel.fromJson(map) {
    return HomePageModel(
      product_id: map['product_id'] ,
      categories_id: map['categories_id'] ,
      product_price: map['product_price'] ,
      product_image: map['product_image'] as String,
      product_title: map['product_title'] as String,
      product_supTitle: map['product_supTitle'] as String,
      product_stars: map['product_stars'] ,
      favorite: map['favorite'] as String ,
    );
  }
}
