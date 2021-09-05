import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toolist/app/core/values/color_palette.dart';
import 'package:toolist/app/data/models/tasks_model.dart';
import 'package:toolist/app/modules/home/controllers/add_task_controller.dart';

class AddtaskView extends GetView<AddtaskController> {
  const AddtaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.reset();
        return true;
      },
      child: Material(
        child: SafeArea(
          child: Container(
            color: ColorPalette.secondary,
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                        child: TextFormField(
                          controller: controller.textEditingController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: '         Enter New Task ',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: setDate,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                  8,
                                  5,
                                  8,
                                  5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.calendar_today_outlined),
                                    const SizedBox(width: 5),
                                    Obx(
                                      () => Text(
                                        controller.isToday
                                            ? 'Today'
                                            : controller.isTomorrow
                                                ? 'Tomorrow'
                                                : '${controller.date.day}/${controller.date.month}/${controller.date.year}',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Row(
                          children: [
                            Radio<TaskType>(
                              groupValue: controller.taskType,
                              value: TaskType.personal,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.taskType = value;
                                }
                              },
                            ),
                            InkWell(
                              child: const Text('Personal'),
                              onTap: () {
                                controller.taskType = TaskType.personal;
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Radio<TaskType>(
                              groupValue: controller.taskType,
                              value: TaskType.business,
                              activeColor: ColorPalette.pink,
                              onChanged: (value) {
                                if (value != null) {
                                  controller.taskType = value;
                                }
                              },
                            ),
                            InkWell(
                              child: const Text('business'),
                              onTap: () {
                                controller.taskType = TaskType.business;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.scale(
                      scale: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close_outlined,
                            size: 30,
                          ),
                          onPressed: () {
                            controller.reset();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: controller.add,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(
                          30,
                          15,
                          30,
                          15,
                        ),
                        decoration: BoxDecoration(
                          color: ColorPalette.altBlue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'Save New Task',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: ColorPalette.mainWhite,
                                  ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setDate() async {
    DateTime? pickedDateTime = await showDialog<DateTime>(
      context: Get.context!,
      builder: (context) => SimpleDialog(
        title: const Text('Select Date'),
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: Get.width,
            child: CalendarDatePicker(
              initialDate: controller.date,
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
              onDateChanged: (DateTime value) {
                Navigator.of(context).pop(value);
              },
            ),
          ),
        ],
      ),
    );
    if (pickedDateTime != null) {
      controller.dateTime = pickedDateTime;
    }
  }
}
