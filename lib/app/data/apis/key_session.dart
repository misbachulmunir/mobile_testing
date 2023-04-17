// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

class KeySession {
  static const IS_LOGIN = 'IS_LOGIN';
  static const TOKEN = 'token';
  static const USERNAME = 'USERNAME';
  static const PASSWORD = 'PASSWORD';

  static void logoutSession() {
    final box = GetStorage();
    box.write(KeySession.IS_LOGIN, false);
    box.write(KeySession.TOKEN, null);
    box.write(KeySession.USERNAME, null);
    box.write(KeySession.PASSWORD, null);
  }
}
