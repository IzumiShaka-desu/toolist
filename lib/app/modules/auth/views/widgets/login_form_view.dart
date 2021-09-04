import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/global_widget/molecules/default_form_field.dart';
import 'package:toolist/app/modules/auth/controllers/auth_controller.dart';

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
