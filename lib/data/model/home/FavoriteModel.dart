import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavoriteModel {
  String user_id;
  String product_id;
  FavoriteModel({
    required this.user_id,
    required this.product_id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_id': user_id,
      'product_id': product_id,
    };
  }
}
