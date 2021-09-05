part of 'app_pages.dart';

final box = Get.find<GetStorage>();
final _client = Get.find<SupabaseClient>();

class AuthorizedMiddleware extends GetMiddleware {
  AuthorizedMiddleware() : super(priority: 1);
  @override
  RouteSettings? redirect(String? route) {
    final _isTokenAvailable = box.hasData(
      BoxKeys.token,
    );
    final _auth = _client.auth;
    if (!_isTokenAvailable) {
      return const RouteSettings(
        name: Routes.AUTH,
      );
    }
    final _token = box.read(BoxKeys.token);
    _auth.recoverSession(_token);
    if (!_auth.isSessionSet) {
      return const RouteSettings(
        name: Routes.AUTH,
      );
    }
    _auth.updateDataWhenFullnameAvailable();
  }
}

class NotAuthorizedMiddleware extends GetMiddleware {
  NotAuthorizedMiddleware() : super(priority: 1);

  @override
  RouteSettings? redirect(String? route) {
    final _isTokenAvailable = box.hasData(BoxKeys.token);
    final _auth = _client.auth;
    if (_isTokenAvailable) {
      _auth.recoverSession(box.read(BoxKeys.token));
      if (_auth.isSessionSet) {
        _auth.updateDataWhenFullnameAvailable();
        return const RouteSettings(
          name: _Paths.HOME,
        );
      }
    }
  }
}
