import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

class AvatarImage extends GetView<HomeController> {
  const AvatarImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      minRadius: 35,
      maxRadius: 40,
      backgroundColor: ColorPalette.mainWhite,
    );
  }
}
