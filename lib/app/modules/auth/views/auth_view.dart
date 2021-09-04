import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/global_widget/molecules/default_form_field.dart';
import 'package:toolist/app/routes/app_pages.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(),
        ),
        Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  child: const FormAuthView(),
                ),
              ),
              const ToLoginButton(),
              const ToRegisterButton(),
            ],
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: (controller.isSuccessfull) ? -Get.height : -2,
            right: (controller.isSuccessfull) ? -Get.width : -2,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              height: controller.isSuccessfull ? Get.height * 3 : 0,
              width: controller.isSuccessfull ? Get.width * 3 : 0,
              onEnd: () {
                controller.reset();
                Get.offAllNamed(Routes.HOME);
              },
            ),
          ),
        ),
        Obx(
          () => controller.isLoading
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.black87,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'processing your request, please wait.',
                        style: Get.textTheme.subtitle1?.copyWith(
                          color: Get.theme.primaryColor,
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}

class FormAuthView extends GetView<AuthController> {
  const FormAuthView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      itemCount: 2,
      itemBuilder: (context, position) {
        return Obx(() {
          return Transform.rotate(
            angle: controller.currentPageValue - position,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              transformAlignment:
                  position == 1 ? Alignment.topRight : Alignment.topLeft,
              child: (position == 0)
                  ? const LoginFormView()
                  : const RegisterFormView(),
            ),
          );
        });
      },
    );
  }
}

class LoginFormView extends GetView<AuthController> {
  const LoginFormView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: ColorPalette.primaryGreen,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: Get.height / 8),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'images/icon.png',
                        width: 80,
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryGreen,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: Get.width * 0.7,
                      child: DefaultFormField(
                        disableBorder: true,
                        themeData: Get.theme.copyWith(
                          colorScheme: Get.theme.colorScheme.copyWith(
                            primary: ColorPalette.mainBlue,
                          ),
                        ),
                        labelText: 'email',
                        textEditingController:
                            controller.loginTextController['email']!,
                        icon: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryGreen,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: DefaultFormField(
                        themeData: Get.theme.copyWith(
                          colorScheme: Get.theme.colorScheme.copyWith(
                            primary: ColorPalette.mainBlue,
                          ),
                        ),
                        labelText: 'password',
                        isObscure: true,
                        disableBorder: true,
                        textEditingController:
                            controller.loginTextController['password']!,
                        icon: Icon(
                          Icons.password_outlined,
                        ),
                      ),
                      width: Get.width * 0.7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: Get.height * 0.58),
            child: InkWell(
              onTap: () => (!controller.isLoading)
                  ? controller.login()
                  : {debugPrint('controller.isLoading')},
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.all(15),
                duration: Duration(milliseconds: 200),
                child: (controller.isLoading)
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        '      Login        ',
                        style: TextStyle(
                          color: ColorPalette.primaryBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterFormView extends GetView<AuthController> {
  const RegisterFormView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: ColorPalette.primaryBlue,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: Get.height / 8,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'images/icon.png',
                        width: 80,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryBLue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: Get.width * 0.7,
                      child: DefaultFormField(
                        disableBorder: true,
                        themeData: Get.theme.copyWith(
                          brightness: Brightness.dark,
                        ),
                        labelText: 'fullname',
                        textEditingController:
                            controller.registerTextController['fullname']!,
                        icon: Icon(
                          Icons.person_outline,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryBLue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: Get.width * 0.7,
                      child: DefaultFormField(
                        disableBorder: true,
                        themeData: Get.theme.copyWith(
                          brightness: Brightness.dark,
                        ),
                        labelText: 'email',
                        textEditingController:
                            controller.registerTextController['email']!,
                        icon: Icon(
                          Icons.email_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryBLue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: Get.width * 0.7,
                      child: DefaultFormField(
                        disableBorder: true,
                        themeData: Get.theme.copyWith(
                          brightness: Brightness.dark,
                        ),
                        isObscure: true,
                        labelText: 'password',
                        textEditingController:
                            controller.registerTextController['password']!,
                        icon: Icon(Icons.password_outlined),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryBLue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: Get.width * 0.7,
                      child: DefaultFormField(
                        disableBorder: true,
                        isObscure: true,
                        themeData: Get.theme.copyWith(
                          brightness: Brightness.dark,
                        ),
                        labelText: 'confirm password',
                        textEditingController: controller
                            .registerTextController['confirm_password']!,
                        icon: Icon(
                          Icons.password_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () => (!controller.isLoading)
                          ? controller.register()
                          : {debugPrint('controller.isLoading')},
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.all(15),
                        duration: Duration(milliseconds: 200),
                        child: (controller.isLoading)
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                '     Register       ',
                                style: TextStyle(
                                  color: ColorPalette.primaryBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ToLoginButton extends GetView<AuthController> {
  const ToLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool _isActivePage = controller.currentPageValue == 0;
        return AnimatedPositioned(
          left: _isActivePage ? -Get.width : 0,
          top: Get.height * 0.8,
          curve: Curves.bounceOut,
          child: InkWell(
            onTap: controller.toLoginPage,
            child: Container(
              padding: EdgeInsets.only(
                left: 30,
                top: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: ColorPalette.primaryGreen,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(
                    25,
                  ),
                ),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                  text: 'OR ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          duration: Duration(
            milliseconds: _isActivePage ? 100 : 500,
          ),
        );
      },
    );
  }
}

class ToRegisterButton extends GetView<AuthController> {
  const ToRegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        bool _isActivePage = controller.currentPageValue == 1;
        return AnimatedPositioned(
          right: _isActivePage ? -Get.width : 0,
          curve: Curves.bounceOut,
          top: Get.height * 0.8,
          child: InkWell(
            onTap: controller.toRegisterPage,
            child: Container(
              padding: EdgeInsets.only(
                left: 30,
                top: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: ColorPalette.primaryBlue,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25),
                ),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' Register',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                  text: 'OR ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          duration: Duration(
            milliseconds: _isActivePage ? 100 : 500,
          ),
        );
      },
    );
  }
}
