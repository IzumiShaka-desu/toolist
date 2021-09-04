import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/modules/auth/controllers/auth_controller.dart';

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
              padding: const EdgeInsets.only(
                left: 30,
                top: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: ColorPalette.primaryBlue,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(25),
                ),
              ),
              child: const Text.rich(
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
