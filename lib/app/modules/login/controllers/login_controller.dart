import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_testing/app/data/apis/api_connect.dart';
import 'package:mobile_testing/app/data/apis/api_error.dart';
import 'package:mobile_testing/app/data/apis/end_point.dart';
import 'package:mobile_testing/app/routes/app_pages.dart';

import '../../../data/helper.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController c_username = TextEditingController();
  TextEditingController c_password = TextEditingController();
  RxBool visible = true.obs;
  ApiConnect _apiConnect = ApiConnect.instance;
  final count = 0.obs;
  @override
  void onInit() {
    c_username.text = "eve.holt@reqres.in";
    c_password.text = "cityslicka";
    super.onInit();
  }

  @override
  void onReady() {
    c_username.text = "eve.holt@reqres.in";
    c_password.text = "cityslicka";
    super.onReady();
  }

  @override
  void onClose() {
    c_username.dispose();
    c_password.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  void registrasi() {
    Get.toNamed(Routes.REGISTER);
  }

  Future<void> login() async {
    final form = keyForm.currentState?.validate();
    if (form == true) {
      showProgressDialog();
      try {
        Map<String, dynamic> response = await _apiConnect.postData(
          EndPoints.login,
          {
            "username": c_username.text,
            "password": c_password.text,
          },
        );
        dismissProgressDialog();
        if (response.containsKey("token")) {
          Helper.showToast("Berhasil login");
          Get.offAllNamed(Routes.HOME);
        } else {
          Helper.showToast(response["error"].toString());
        }
      } on ApiErrors catch (e) {
        dismissProgressDialog();
        Helper.showToast(e.message.toString());
      } catch (e) {
        print("eror hm");
        dismissProgressDialog();
        Helper.showToast("Terjadi kesalahan");
      }
    }
  }
}
