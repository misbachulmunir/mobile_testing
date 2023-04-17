import 'package:get/get.dart';
import 'package:mobile_testing/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
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
}
