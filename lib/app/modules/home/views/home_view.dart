import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman CRUD'),
        centerTitle: true,
      ),
      floatingActionButton: InkWell(
        onTap: () {
          controller.add();
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.red,
        ),
      ),
      body: controller.obx(
          (state) => ListView.builder(
                itemCount: controller.listusers.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      controller.detail(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.listusers.value[index]["nama"]
                                  .toString()),
                              Text(controller.listusers.value[index]["jabatan"]
                                  .toString()),
                            ],
                          ),
                          InkWell(
                              onTap: () {
                                controller.delete(index);
                              },
                              child: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
              ),
          onError: (error) => Center(child: Text(error.toString())),
          onLoading: Center(child: CupertinoActivityIndicator())),
    );
  }
}
