import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/modules/auth/controllers/auth_controller.dart';
import 'login_form_view.dart';
import 'register_form_view.dart';

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
