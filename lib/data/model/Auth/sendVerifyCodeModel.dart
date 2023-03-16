// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SendVerifyCodeModel {
  String user_email;
  SendVerifyCodeModel({
    required this.user_email,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_email': user_email,
    };
  }
}
