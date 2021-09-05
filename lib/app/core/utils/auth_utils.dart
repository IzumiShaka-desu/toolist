import 'package:supabase/supabase.dart';
import 'package:toolist/app/core/values/box_keys.dart';
import 'package:toolist/app/routes/app_pages.dart';

extension IntExtension on int? {
  bool get isExpire {
    final exp = DateTime(0).add(
      Duration(
        seconds: this ?? 0,
      ),
    );
    return DateTime.now().isAfter(
      exp,
    );
  }
}

extension SessionExtension on GoTrueClient {
  bool get isSessionSet {
    if ([
      currentSession,
      currentUser,
    ].contains(
      null,
    )) {
      return false;
    }
    return currentSession?.expiresIn.isExpire ?? false;
  }

  void updateDataWhenFullnameAvailable() async {
    if (box.hasData(
      BoxKeys.savedFName,
    )) {
      final result = await update(
        UserAttributes(
          data: {
            BoxKeys.savedFName,
            box.read(
              BoxKeys.savedFName,
            ),
          },
        ),
      );
      if (result.error == null) {
        box.remove(
          BoxKeys.savedFName,
        );
        refreshSession();
      }
    }
  }
}
