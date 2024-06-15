import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jiitak_test/app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jiitak Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GetMaterialApp(
        initialRoute: Routes.HOME,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
