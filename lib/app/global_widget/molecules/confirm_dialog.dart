import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../atoms/primary_button.dart';

class ConfirmDialogs extends StatelessWidget {
  const ConfirmDialogs({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(
        message,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                text: 'yes',
                onPressed: () => Navigator.of(Get.context!).pop<bool>(true),
              ),
              TextButton(
                onPressed: () => Navigator.of(Get.context!).pop<bool>(false),
                child: Text('No'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
