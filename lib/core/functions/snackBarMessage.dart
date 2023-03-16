import 'package:flutter/material.dart';
import 'package:get/get.dart';

sncakBarMessage(title, message) {
  Get.snackbar(
    '$title',
    '$message',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.redAccent,
    colorText: Colors.white,
    icon: Icon(Icons.error),
    margin: EdgeInsets.all(15),
  );
}
