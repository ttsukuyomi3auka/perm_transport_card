import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/routes/app_pages.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/services/fake_api_service.dart';

void main() {
  initServices();
  runApp(GetMaterialApp(
    theme: ThemeData(
      textSelectionTheme: TextSelectionThemeData(cursorColor: CustomColor.blueLight)
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
  ));
}

void initServices() async {
  Get.put(FakeApiService());
}
