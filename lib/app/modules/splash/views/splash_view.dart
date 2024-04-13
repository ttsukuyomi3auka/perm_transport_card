import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/resources/resources.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: const Center(
          child: Image(
              width: 150,
              height: 150,
              image: AssetImage(
                  Images.icLauncherRound)), 
        ),
      ),
    );
  }
}
