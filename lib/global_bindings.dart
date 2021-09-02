import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase/supabase.dart';

final globalBindings = BindingsBuilder(
  () {
    Get.lazyPut(
      () => GetStorage(),
    );
    Get.lazyPut(
      () => SupabaseClient(
        dotenv.env['base_url']!,
        dotenv.env['supa_key']!,
      ),
    );
  },
);
