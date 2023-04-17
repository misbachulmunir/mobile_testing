import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  "REGISTRASI MOBILE TESTING",
                  style: TextStyle(fontSize: 20),
                ),
              ),
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
                                child: Text("Username"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  controller: controller.c_username,
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
                                      hintText: "Masukan alamat email"),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    return value.toString().isEmpty
                                        ? 'Tidak boleh kosong'
                                        : null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text("Password"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Obx(() => TextFormField(
                                      controller: controller.c_password,
                                      obscureText: controller.visible.value,
                                      enableSuggestions: false,
                                      style: TextStyle(),
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide()),
                                        hintStyle: TextStyle(),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            controller.visible.toggle();
                                          },
                                          child: Icon(
                                            controller.visible.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(),
                                        ),
                                        hintText: "Masukan password",
                                      ),
                                      validator: (value) {
                                        return value.toString().isEmpty
                                            ? 'Tidak boleh kosong'
                                            : null;
                                      },
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text("Ulangi Password"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Obx(() => TextFormField(
                                      controller: controller.c_password_ulangi,
                                      obscureText:
                                          controller.visible_ulangi.value,
                                      enableSuggestions: false,
                                      style: TextStyle(),
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide()),
                                        hintStyle: TextStyle(),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            controller.visible_ulangi.toggle();
                                          },
                                          child: Icon(
                                            controller.visible.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(),
                                        ),
                                        hintText: "Ulangi password",
                                      ),
                                      validator: (value) {
                                        return value.toString().isEmpty
                                            ? 'Tidak boleh kosong'
                                            : null;
                                      },
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    )),
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
                                  controller.registrasi();
                                },
                                child: Text(
                                  "REGISTRASI",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sudah memiliki akun?"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      controller.login();
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
