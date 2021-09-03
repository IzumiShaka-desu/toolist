import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:supabase/supabase.dart';

class AuthProvider {
  final SupabaseClient _client = Get.find();

  Future<Either<String, GotrueSessionResponse>> register({
    required String email,
    required String password,
  }) async {
    final _result = await _client.auth.signUp(
      email,
      password,
    );
    if (_result.error != null) {
      return Left(
        _result.error!.message,
      );
    }

    return Right(_result);
  }
}
