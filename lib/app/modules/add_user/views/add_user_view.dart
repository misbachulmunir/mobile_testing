import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.mytitle.value)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: controller.keyForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text("Nama"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextFormField(
                                controller: controller.c_nama,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    hintStyle: TextStyle(),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Masukan nama"),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  return value.toString().isEmpty
                                      ? 'Tidak boleh kosong'
                                      : null;
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Text("Jabatan"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextFormField(
                                controller: controller.c_jabatan,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    hintStyle: TextStyle(),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Masukan jabatan"),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  return value.toString().isEmpty
                                      ? 'Tidak boleh kosong'
                                      : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Container(
                          width: Get.width,
                          height: 50,
                          child: Material(
                            color: Colors.blue,
                            //Wrap with Material
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),

                            clipBehavior: Clip.antiAlias, // Add This
                            child: MaterialButton(
                              onPressed: () {
                                controller.simpan();
                              },
                              child: Text(
                                "SIMPAN",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
