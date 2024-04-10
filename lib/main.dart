import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/routes/app_pages.dart';

void main() {
  initServices();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
  ));
}

void initServices() async {}
