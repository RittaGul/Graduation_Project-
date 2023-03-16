import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoriesModel {
  String categories_id;
  String user_id;
  CategoriesModel({
    required this.user_id,
    required this.categories_id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': user_id,
      'categories_id': categories_id,
    };
  }
}
