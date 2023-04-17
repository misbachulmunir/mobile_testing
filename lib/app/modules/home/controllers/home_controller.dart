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

  RxList<dynamic> listusers = [].obs;
  @override
  void onInit() {
    super.onInit();
    listuser();
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
    change(null, status: RxStatus.loading());
    try {
      Map<dynamic, dynamic> response =
          await _apiConnect2.postData(EndPoints.listuser, {});
      if (response["status"]) {
        listusers.value = response["data"];
        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error(response["message"].toString()));
      }
    } on ApiErrors catch (e) {
      dismissProgressDialog();
      Helper.showToast(e.message.toString());
    } catch (e) {
      change(null, status: RxStatus.error("Terjadi kesalahan"));
    }
  }

  Future<void> add() async {
    final data = await Get.toNamed(Routes.ADD_USER);
    if (data != null) {
      listuser();
    }
  }

  Future<void> detail(int index) async {
    print("object");
    Map data = {
      "id": listusers[index]["id"].toString(),
      "nama": listusers[index]["nama"].toString(),
      "jabatan": listusers[index]["jabatan"].toString(),
    };
    final mydata = await Get.toNamed(Routes.ADD_USER, arguments: data);
    if (mydata != null) {
      listuser();
    }
  }

  Future<void> delete(int index) async {
    showProgressDialog();
    try {
      Map<String, dynamic> response = await _apiConnect2.postData(
        EndPoints.deleteexampleuser,
        {
          "id": listusers[index]["id"].toString(),
        },
      );
      dismissProgressDialog();
      if (response["status"]) {
        listuser();
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
