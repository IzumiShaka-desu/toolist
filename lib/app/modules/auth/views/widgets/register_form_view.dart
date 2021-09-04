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
