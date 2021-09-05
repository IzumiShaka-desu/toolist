import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/utils/datetime_utils.dart';
import 'package:toolist/app/data/models/tasks_model.dart';

class AddtaskController extends GetxController {
  late final TextEditingController textEditingController;

  final _date = DateTime.now().obs;

  DateTime get date => _date.value;

  set dateTime(DateTime newDate) => _date.value = newDate;

  bool get isToday => _date.value.isToday;

  bool get isTomorrow => _date.value.isTomorrow;

  final _taskType = TaskType.personal.obs;

  TaskType get taskType => _taskType.value;

  set taskType(TaskType newType) => _taskType.value = newType;

  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void reset() {
    dateTime = DateTime.now();
    textEditingController.clear();
    taskType = TaskType.personal;
  }
}
