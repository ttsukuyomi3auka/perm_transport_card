import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/app/modules/home/widgets/app_bar.dart';
import 'package:perm_transport_card/app/modules/home/widgets/card_added_screen.dart';
import 'package:perm_transport_card/app/modules/home/widgets/custom_dot.dart';
import 'package:perm_transport_card/app/modules/home/widgets/no_card_screen.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentTab.value,
              backgroundColor: CustomColor.blackUpDown,
              unselectedItemColor: CustomColor.grey,
              selectedItemColor: CustomColor.blueIcon,
              onTap: controller.setCurrentTab,
              items: [
                drawBottomNavigationBarItem(LocalIcons.ticket, "Билеты",
                    controller.currentTab.value, 0),
                drawBottomNavigationBarItem(LocalIcons.text, "Проездной",
                    controller.currentTab.value, 1),
                drawBottomNavigationBarItem(LocalIcons.busWithRoadSign,
                    "Расписание", controller.currentTab.value, 2),
                drawBottomNavigationBarItem(
                    LocalIcons.user, "Кабинет", controller.currentTab.value, 3),
              ],
            )),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Obx(
              () => controller.cards.when(
                success: (List<PermCard> cards) {
                  return Column(
                    children: [
                      drawAppBar(cards[controller.indexPage.value]),
                      CarouselSlider.builder(
                          itemCount: cards.length,
                          itemBuilder: (context, index, realIndex) {
                            return Image(
                              height: 200,
                              width: 380,
                              image: AssetImage(cards[index].type.image),
                            );
                          },
                          options: CarouselOptions(
                            viewportFraction: 0.9,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              controller.indexPage.value = index;
                              controller.updateCurrentCard(cards[index]);
                            },
                          )),
                      drawCustomDot(cards, controller.indexPage.value),
                      IndexedStack(
                        index: controller.indexPage.value,
                        children: cards
                            .map((e) => e.type == CardTypes.newCard
                                ? NoCardScreen(e)
                                : CardAddedScreen(e))
                            .toList(),
                      )
                    ],
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
                failed: (message) {
                  Get.snackbar("", message,
                      backgroundColor: CustomColor.grey,
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white,
                      margin: const EdgeInsets.only(bottom: 80),
                      borderRadius: 5,
                      instantInit: false);
                  controller.getCardById();
                  return PageView();
                },
              ),
            )));
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
