import 'package:get/get.dart';
import 'package:perm_transport_card/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAndToNamed(Routes.HOME);
    super.onInit();
  }
}
