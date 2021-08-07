import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorSnackbar(String errorMessage) {
  Get.snackbar('Error', errorMessage,
      colorText: Colors.white70, backgroundColor: Colors.black87);
}
