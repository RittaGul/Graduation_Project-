// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConfirmationModel {
  String user_email;
  String user_verifycode;

  ConfirmationModel({
    required this.user_email,
    required this.user_verifycode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user_email': user_email,
      'user_verifycode': user_verifycode,
    };
  }
}
