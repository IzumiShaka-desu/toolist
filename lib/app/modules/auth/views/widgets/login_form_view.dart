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
                    Image.asset(
                      'images/icon.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
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
                        icon: const Icon(
                          Icons.email_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
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
                        icon: const Icon(
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
              onTap: controller.login,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(15),
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: (controller.isLoading)
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Text(
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
