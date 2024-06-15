import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiitak_test/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HOME_SCREEN);
              },
              child: const Text(
                "Home Screen",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.STAMP_DETAIL);
              },
              child: const Text(
                "Stamp Detail",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Screen 1",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
