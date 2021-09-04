import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/global_widget/molecules/default_form_field.dart';
import 'package:toolist/app/modules/auth/controllers/auth_controller.dart';

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
                    Image.asset(
                      'images/icon.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(
                        4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorPalette.secondaryBLue,
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
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
                        icon: const Icon(
                          Icons.person_outline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
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
                        icon: const Icon(
                          Icons.email_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
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
                        icon: const Icon(
                          Icons.password_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(
                        4,
                      ),
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
                        icon: const Icon(
                          Icons.password_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: controller.register,
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
