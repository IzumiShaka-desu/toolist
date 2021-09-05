import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase/supabase.dart';
import 'package:toolist/app/core/utils/auth_utils.dart';
import 'package:toolist/app/core/values/box_keys.dart';

import 'package:toolist/app/modules/auth/bindings/auth_binding.dart';
import 'package:toolist/app/modules/auth/views/auth_view.dart';
import 'package:toolist/app/modules/home/bindings/home_binding.dart';
import 'package:toolist/app/modules/home/views/home_view.dart';

part 'app_routes.dart';
part 'middlewares.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [
        AuthorizedMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      middlewares: [
        NotAuthorizedMiddleware(),
      ],
    ),
  ];
}
