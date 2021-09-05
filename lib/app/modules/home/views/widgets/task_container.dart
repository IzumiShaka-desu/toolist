import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/modules/home/controllers/home_controller.dart';

import 'circle_check_box.dart';

class TaskContainer extends GetView<HomeController> {
  const TaskContainer({
    Key? key,
    required this.item,
    required this.isPersonal,
    required this.index,
    this.trailing,
  }) : super(key: key);

  final Tasks item;
  final int index;
  final bool isPersonal;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: InkWell(
          onTap: () => controller.updateState(index),
          child: CircleCheckBox(
            isChecked: item.isDone ?? false,
            color: isPersonal ? ColorPalette.altBlue : ColorPalette.pink,
          ),
        ),
        title: Text(
          item.taskName ?? '',
          style: Get.textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.w500,
              decoration: item.isDone ?? false
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontSize: 17),
        ),
        trailing: trailing ?? SizedBox(),
      ),
      color: ColorPalette.mainWhite,
    );
  }
}
