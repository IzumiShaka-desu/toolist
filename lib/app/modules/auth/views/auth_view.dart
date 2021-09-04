import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:toolist/app/routes/app_pages.dart';

import '../controllers/auth_controller.dart';
import 'widgets/form_auth_view.dart';
import 'widgets/to_login_button.dart';
import 'widgets/to_register_button.dart';

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
            children: const [
              Positioned.fill(
                child: FormAuthView(),
              ),
              ToLoginButton(),
              ToRegisterButton(),
            ],
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(
              milliseconds: 200,
            ),
            bottom: (controller.isSuccessfull) ? -Get.height : -2,
            right: (controller.isSuccessfull) ? -Get.width : -2,
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 250,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              height: controller.isSuccessfull ? Get.height * 3 : 0,
              width: controller.isSuccessfull ? Get.width * 3 : 0,
              onEnd: () {
                controller.reset();
                Get.offAllNamed(
                  Routes.HOME,
                );
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
                      const CircularProgressIndicator(),
                      const SizedBox(
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
              : const SizedBox(),
        ),
      ],
    );
  }
}
