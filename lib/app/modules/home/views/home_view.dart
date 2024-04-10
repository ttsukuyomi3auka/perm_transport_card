import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perm_transport_card/resources/resources.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.background),
              fit: BoxFit.cover,
            ),
          ),
          child:
              const Center(child: Image(image: AssetImage(Images.studentCard))),
        ));
  }
}
