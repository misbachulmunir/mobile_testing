import 'package:get/get.dart';
import 'package:mobile_testing/app/data/apis/api_connect2.dart';
import 'package:mobile_testing/app/routes/app_pages.dart';

import '../../../data/apis/api_error.dart';
import '../../../data/apis/end_point.dart';
import '../../../data/helper.dart';

class HomeController extends GetxController with StateMixin {
  //TODO: Implement HomeController

  final count = 0.obs;
  ApiConnect2 _apiConnect2 = ApiConnect2.instance;
  RxList<String> listdata = [
    "Fitur Login",
    "Fitur Register",
    "Error Register",
    "Error Login",
    "List User",
    "CRUD"
  ].obs;
  @override
  void onInit() {
    super.onInit();
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

  ontap(int index) {}
  Future<void> listuser() async {
    try {
      Map<String, dynamic> response = await _apiConnect2.getData(
        EndPoints.listuser,
      );
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
