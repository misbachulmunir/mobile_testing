// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

class KeySession {
  static const IS_LOGIN = 'IS_LOGIN';
  static const IS_MULAI = 'IS_MULAI';
  static const USERNAME = 'USERNAME';
  static const PASSWORD = 'PASSWORD';
  static const VERSION = 'VERSION';
  static const ROLE = 'ROLE';
  static void logoutSession() {
    final box = GetStorage();
    box.write(KeySession.IS_LOGIN, false);
    box.write(KeySession.IS_MULAI, false);
    box.write(KeySession.USERNAME, null);
    box.write(KeySession.PASSWORD, null);
    box.write(KeySession.VERSION, null);
    box.write(KeySession.ROLE, null);
  }
}
