import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddtaskController extends GetxController {
  late final TextEditingController textEditingController;

  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
