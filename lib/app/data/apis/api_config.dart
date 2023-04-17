import 'dart:convert';

import 'package:flutter/foundation.dart';

const String bau = '4234jfka9';
const String bap = 'dnaljsadp2410fjblwfr183010841';

String getBasicAuth() {
  return 'Basic ${base64Encode(utf8.encode("$bau:$bap"))}';
}

String getBaseUrl() {
  return "https://reqres.in/";
}

String getBaseUrl2() {
  return "https://gorest.co.in/public/v2/";
}
