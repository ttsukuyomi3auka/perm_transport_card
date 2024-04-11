import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/resources/resources.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.background),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
                child: Image(image: AssetImage(Images.studentCard))),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: const Color.fromARGB(255, 15, 13, 13),
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTab(LocalIcons.ticket, "Билеты", 0),
                  buildTab(LocalIcons.wallet, "Проездной", 1),
                  buildTab(LocalIcons.busWithRoadSign, "Расписание", 2),
                  buildTab(LocalIcons.user, "Кабинет", 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildTab(String icon, String label, int tabIndex) {
    return InkWell(
      onTap: () {
        controller.setCurrentTab(tabIndex);
      },
      child: SizedBox(
        width:
            Get.width / 4, // Используем Get.width для доступа к ширине экрана
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 32,
                height: 32,
                color: controller.currentTab.value == tabIndex
                    ? Colors.blue
                    : Colors.grey,
              ),
              Text(
                label,
                style: TextStyle(
                  color: controller.currentTab.value == tabIndex
                      ? Colors.blue
                      : Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
