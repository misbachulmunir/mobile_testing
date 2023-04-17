import 'dart:async';

import 'package:get/get_connect/connect.dart';
import 'package:mobile_testing/app/data/apis/res_err.dart';

import 'api_config.dart';

class ApiConnect extends GetConnect {
  static final ApiConnect instance = ApiConnect._();
  dynamic _reqBody;
  late void Function(Object object) logPrint;

  ApiConnect._() {
    logPrint = print;

    httpClient.baseUrl = getBaseUrl();
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 10);
    httpClient.maxAuthRetries = 3;

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers["Authorization"] = getBasicAuth();

      logPrint('************** Request **************');
      _printKV('uri', request.url);
      _printKV('method', request.method);
      _printKV('followRedirects', request.followRedirects);
      logPrint('headers:');
      request.headers.forEach((key, v) => _printKV(' $key', v));
      logPrint('data:');
      if (_reqBody is Map) {
        _reqBody?.forEach((key, v) => _printKV(' $key', v));
      } else {
        _printAll(_reqBody.toString());
      }
      logPrint('*************************************');
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      logPrint('************** Response **************');
      _printKV('uri', response.request!.url);
      _printKV('statusCode', response.statusCode!);
      if (response.headers != null) {
        logPrint('headers:');
        response.headers?.forEach((key, v) => _printKV(' $key', v));
      }
      logPrint('Response Text:');
      _printAll(response.bodyString);
      logPrint('*************************************');
      return response;
    });
  }

  Future<dynamic> postData(String url, Map<String, String> params) async {
    _logParams(params);
    _checkIfDisposed();
    final response = await post(url, params);
    return response.getBody();
  }

  Future<dynamic> uploadFile(String url, FormData params) async {
    _logParams(params);
    _checkIfDisposed();
    final response = await post(url, params);
    return response.getBody();
  }

  void _printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void _checkIfDisposed() {
    if (isDisposed) {
      throw "Can't emit events to disposed clients";
    }
  }

  void _logParams(dynamic params) {
    logPrint('************** Params **************');
    if (params is Map) {
      _printKV('value', params.toString());
    } else {
      final formData = params as FormData;
      for (var element in formData.files) {
        _printKV(element.key, element.value.filename);
        _printKV(element.key, element.value.contentType);
      }
      for (var element in formData.fields) {
        _printKV(element.key, element.value);
      }
    }
    logPrint('*************************************');
  }
}
