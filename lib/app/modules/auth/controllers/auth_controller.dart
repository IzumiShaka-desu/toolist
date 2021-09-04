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

  final loginTextController = <String, TextEditingController?>{
    'password': null,
    'email': null,
  };

  String get emailLogin => loginTextController['email']?.text ?? '';
  String get passwordLogin => loginTextController['password']?.text ?? '';

  final registerTextController = <String, TextEditingController?>{
    'password': null,
    'confirm_password': null,
    'email': null,
    'fullname': null,
  };

  String get emailRegister => registerTextController['email']?.text ?? '';
  String get passwordRegister => registerTextController['password']?.text ?? '';
  String get confirmPasswRegister =>
      registerTextController['confirm_password']?.text ?? '';
  String get fullnameRegister => registerTextController['fullname']?.text ?? '';

  @override
  void onInit() {
    _initPageController();
    _initTextController();
    super.onInit();
  }

  @override
  void onClose() {
    loginTextController.forEach((key, value) {
      value?.dispose();
    });
    registerTextController.forEach((key, value) {
      value?.dispose();
    });
    _pageController.dispose();
  }

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

  void _initTextController() {
    loginTextController.forEach((key, value) {
      if (value == null) {
        loginTextController[key] = TextEditingController();
      }
    });
    registerTextController.forEach((key, value) {
      if (value == null) {
        registerTextController[key] = TextEditingController();
      }
    });
  }

  void reset() {
    loginTextController.forEach(
      (key, value) {
        value?.clear();
      },
    );
    registerTextController.forEach(
      (key, value) {
        value?.clear();
      },
    );
  }

  login() {}

  register() {}

  void toLoginPage() => (!isLoading)
      ? _pageController.animateToPage(
          0,
          duration: Duration(
            milliseconds: 500,
          ),
          curve: _curveTransition,
        )
      : null;

  void toRegisterPage() => (!isLoading)
      ? _pageController.animateToPage(
          1,
          duration: Duration(
            milliseconds: 500,
          ),
          curve: _curveTransition,
        )
      : null;

  bool _validateRegisterForm() {
    if (!(emailRegister.isEmail)) {
      Get.snackbar('Info', 'please input a valid email!',
          colorText: Colors.white70);
    } else if (passwordRegister.length < 6) {
      Get.snackbar('Info', 'password cannot less than 6 characters',
          colorText: Colors.white70);
    } else if (passwordRegister != confirmPasswRegister) {
      Get.snackbar('Info', 'confirm password are no same as password',
          colorText: Colors.white70);
    } else if (fullnameRegister.isEmpty) {
      Get.snackbar('Info', 'fullname cannot be empty',
          colorText: Colors.white70);
    } else {
      return true;
    }
    return false;
  }
}
