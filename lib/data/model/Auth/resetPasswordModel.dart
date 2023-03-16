// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetPasswordModel {
  String user_email;
  String user_password;
  String confirm_user_password;

  ResetPasswordModel({
    required this.user_email,
    required this.user_password,
    required this.confirm_user_password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_email': user_email,
      'user_password': user_password,
      'confirm_user_password': confirm_user_password,
    };
  }
}
