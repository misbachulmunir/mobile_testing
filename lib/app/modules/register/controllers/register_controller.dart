import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_testing/app/routes/app_pages.dart';

import '../../../data/apis/api_connect.dart';
import '../../../data/apis/api_error.dart';
import '../../../data/apis/end_point.dart';
import '../../../data/helper.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController c_username = TextEditingController();
  TextEditingController c_password = TextEditingController();
  TextEditingController c_password_ulangi = TextEditingController();
  RxBool visible = true.obs;
  RxBool visible_ulangi = true.obs;
  ApiConnect _apiConnect = ApiConnect.instance;
  //TODO: Implement RegisterSuccessController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    c_username.text = "eve.holt@reqres.in";
    c_password.text = "pistol";
    c_password_ulangi.text = "pistol";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void login() {
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> registrasi() async {
    final form = keyForm.currentState?.validate();
    if (form == true) {
      if (c_password.text != c_password_ulangi.text) {
        return Helper.showToast("Password tidak sama");
      }
      showProgressDialog();
      try {
        Map<String, dynamic> response = await _apiConnect.postData(
          EndPoints.register,
          {
            "username": c_username.text,
            "password": c_password.text,
          },
        );
        dismissProgressDialog();
        if (response.containsKey("token")) {
          Helper.showToast("Berhasil registrasi");
          Get.offAllNamed(Routes.LOGIN);
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
