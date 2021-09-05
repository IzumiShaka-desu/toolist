import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountTextView extends StatelessWidget {
  const CountTextView({
    Key? key,
    required this.count,
  }) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$count Tasks',
      style: Get.textTheme.bodyText2?.copyWith(
        color: Colors.grey,
      ),
    );
  }
}
