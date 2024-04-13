import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/widgets/card_added_screen.dart';
import 'package:perm_transport_card/app/modules/home/widgets/no_card_screen.dart';
import 'package:perm_transport_card/resources/resources.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: const Color.fromARGB(255, 18, 18, 18),
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTab(LocalIcons.ticket, "Билеты", 0),
                  buildTab(LocalIcons.text, "Проездной", 1),
                  buildTab(LocalIcons.busWithRoadSign, "Расписание", 2),
                  buildTab(LocalIcons.user, "Кабинет", 3),
                ],
              ),
            ),
          ),
          ListView( 
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: const [
              Image(
                height: 175,
                width: 350,
                image: AssetImage(Images.defaultCard),
              ),
              SizedBox(width: 10),
              Image(
                height: 175,
                width: 350,
                image: AssetImage(Images.defaultCardGreyAdd),
              ),
            ],
          ),
          Obx(
            () => IndexedStack(
              index: controller.hasCard.value,
              children: const [
                CardAddedScreen(),
                NoCardScreen(),
              ],
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
        width: Get.width / 4,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 32,
                height: 32,
                color: controller.currentTab.value == tabIndex
                    ? const Color.fromARGB(255, 69, 117, 210)
                    : const Color.fromARGB(255, 90, 90, 90),
              ),
              Text(
                label,
                style: TextStyle(
                  color: controller.currentTab.value == tabIndex
                      ? const Color.fromARGB(255, 69, 117, 210)
                      : const Color.fromARGB(255, 90, 90, 90),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
