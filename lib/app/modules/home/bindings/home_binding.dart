import 'package:get/get.dart';
import 'package:perm_transport_card/repositories/fake_card_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(FakeCardRepository(Get.find())),
    );
  }
}
