import 'dart:convert';

import 'package:flutter/foundation.dart';

const String bau = '4234jfka9';
const String bap = 'dnaljsadp2410fjblwfr183010841';

String getBasicAuth() {
  return 'Basic ${base64Encode(utf8.encode("$bau:$bap"))}';
}

String getBaseUrl() {
  return "https://koperasi-online.web.id/toko_buku/api/app/";
  // return "https://75f5-180-214-233-2.ngrok-free.app/gooddiet_service/api/app/";
  // return "http://192.168.238.187/gooddiet_service/api/app/";
  // return "https://972a-180-214-233-18.ap.ngrok.io/ambyar/api/ambyar/";
  // return "http://192.168.133.106/ambyar/api/ambyar/";
}
