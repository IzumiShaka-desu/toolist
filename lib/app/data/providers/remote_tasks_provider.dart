import 'package:get/get.dart';
import 'package:supabase/supabase.dart';

import '../models/tasks_model.dart';

class RemoteTasksProvider {
  static const _tableName = 'tasks';
  final SupabaseClient _client = Get.find();
}
