// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
  String user_name;
  String user_email;
  String user_password;

  SignUpModel({
    required this.user_email,
    required this.user_name,
    required this.user_password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_name': user_name,
      'user_email': user_email,
      'user_password': user_password,
    };
  }
}
