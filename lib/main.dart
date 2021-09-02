import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toolist/global_bindings.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dotenv.load();
  runApp(
    GetMaterialApp(
      title: 'Toolist',
      initialRoute: AppPages.INITIAL,
      initialBinding: globalBindings,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
    ),
  );
}
