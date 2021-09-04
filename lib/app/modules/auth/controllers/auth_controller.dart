import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/data/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepo = Get.find();

  late final PageController _pageController;
  PageController get pageController => _pageController;

  final _curveTransition = Curves.fastOutSlowIn;

  final _currentPageValue = 0.0.obs;
  double get currentPageValue => _currentPageValue.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _isSucessfull = false.obs;
  bool get isSuccessfull => _isSucessfull.value;

  @override
  void onInit() {
    _initPageController();
    super.onInit();
  }

  @override
  void onClose() {}

  void _initPageController() {
    _pageController = PageController();
    _pageController.addListener(
      () {
        if (_pageController.page != null) {
          _currentPageValue.value = _pageController.page!;
        }
      },
    );
  }
}
