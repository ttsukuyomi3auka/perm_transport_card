import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/resources/resources.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final HomeController controller = Get.find();
  CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentTab.value,
          backgroundColor: CustomColor.blackUpDown,
          unselectedItemColor: CustomColor.grey,
          selectedItemColor: CustomColor.blueIcon,
          onTap: controller.setCurrentTab,
          items: [
            drawBottomNavigationBarItem(
                LocalIcons.ticket, "Билеты", controller.currentTab.value, 0),
            drawBottomNavigationBarItem(
                LocalIcons.text, "Проездной", controller.currentTab.value, 1),
            drawBottomNavigationBarItem(LocalIcons.busWithRoadSign,
                "Расписание", controller.currentTab.value, 2),
            drawBottomNavigationBarItem(
                LocalIcons.user, "Кабинет", controller.currentTab.value, 3),
          ],
        ));
  }
}

BottomNavigationBarItem drawBottomNavigationBarItem(
    String icon, String label, int currentTab, int thisTab) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      icon,
      width: 20,
      height: 20,
      color:
          currentTab == thisTab ? CustomColor.blueIcon : CustomColor.greyIcon,
    ),
    label: label,
  );
}
