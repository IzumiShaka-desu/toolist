import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/modules/auth/controllers/auth_controller.dart';

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
