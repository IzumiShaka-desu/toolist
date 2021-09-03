import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toolist/app/core/values/box_keys.dart';
import 'package:toolist/app/data/models/response_model.dart';
import 'package:toolist/app/data/providers/auth_provider.dart';
import 'package:supabase/supabase.dart';

class AuthRepository {
  final AuthProvider _authProvider = Get.find();
  final GoTrueClient authClient = Get.find<SupabaseClient>().auth;
  final GetStorage _box = Get.find();
  Future<ResponseModel> register({
    required String email,
    required String password,
    required String fullname,
  }) async {
    final _result = await _authProvider.register(
      email: email,
      password: password,
    );
    return _result.fold(
      (l) => ResponseModel(
        message: l,
        result: false,
      ),
      (r) {
        _box.write(
          BoxKeys.token,
          r.data?.persistSessionString,
        );
        _box.write(
          BoxKeys.savedFName,
          fullname,
        );
        return ResponseModel(
          message: 'register success',
          result: true,
        );
      },
    );
  }

  Future<ResponseModel> login({
    required String email,
    required String password,
  }) async {
    final _result = await _authProvider.login(
      email: email,
      password: password,
    );
    return _result.fold(
      (l) => ResponseModel(
        message: l,
        result: false,
      ),
      (r) {
        _box.write(
          BoxKeys.token,
          r.data?.persistSessionString,
        );
        return ResponseModel(
          message: 'register success, please check your mail',
          result: true,
        );
      },
    );
  }
}
