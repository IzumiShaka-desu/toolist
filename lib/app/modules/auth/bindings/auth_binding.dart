import 'package:get/get.dart';
import 'package:toolist/app/data/providers/auth_provider.dart';
import 'package:toolist/app/data/repository/auth_repository.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthProvider(),
    );

    Get.lazyPut(
      () => AuthRepository(),
    );

    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
