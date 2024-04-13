import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/routes/app_pages.dart';
import 'package:perm_transport_card/services/fake_api_service.dart';

void main() {
  initServices();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
  ));
}

void initServices() async {
  Get.put(FakeApiService());
}
