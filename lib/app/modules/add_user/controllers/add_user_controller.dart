import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_connect2.dart';
import '../../../data/apis/api_error.dart';
import '../../../data/apis/end_point.dart';
import '../../../data/helper.dart';

class AddUserController extends GetxController {
  //TODO: Implement AddUserController
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController c_nama = TextEditingController();
  TextEditingController c_jabatan = TextEditingController();
  RxBool visible = true.obs;
  ApiConnect2 _apiConnect = ApiConnect2.instance;
  RxString id = "".obs;
  RxString mytitle = "Tambah User".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    final data = Get.arguments;
    if (data != null) {
      id.value = data["id"];
      mytitle.value = "Ubah User";
      c_nama.text = data["nama"];
      c_jabatan.text = data["jabatan"];
    }
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

  Future<void> simpan() async {
    final form = keyForm.currentState?.validate();
    if (form == true) {
      showProgressDialog();
      try {
        Map<String, dynamic> response = await _apiConnect.postData(
          EndPoints.add,
          {
            "id": id.value,
            "nama": c_nama.text,
            "jabatan": c_jabatan.text,
          },
        );
        dismissProgressDialog();
        if (response["status"]) {
          Get.back(result: true);
        }
        Helper.showToast(response["message"].toString());
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
