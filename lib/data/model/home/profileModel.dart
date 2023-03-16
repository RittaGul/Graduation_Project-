import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  var user_id;
  String user_name;
  String user_email;
  String user_bio;
  String user_image;
  ProfileModel({
    required this.user_id,
    required this.user_name,
    required this.user_email,
    required this.user_bio,
    required this.user_image,
  });

  factory ProfileModel.fromJson(map) {
    return ProfileModel(
      user_id: map['user_id'] ,
      user_name: map['user_name'] as String,
      user_email: map['user_email'] as String,
      user_bio: map['user_bio'] as String,
      user_image: map['user_image'] as String,
    );
  }
}
