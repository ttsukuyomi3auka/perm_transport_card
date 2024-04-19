import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/app/modules/home/widgets/app_bar.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(

        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: drawAppBarTitle(controller.currentCard.value),
          actions: [drawAppBarAction(controller.currentCard.value)],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentTab.value,
              backgroundColor: CustomColor.blackUpDown,
              unselectedItemColor: CustomColor.grey,
              selectedItemColor: CustomColor.blueIcon,
              onTap: controller.setCurrentTab,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    LocalIcons.ticket,
                    width: 20,
                    height: 20,
                    color: controller.currentTab.value == 0
                        ? CustomColor.blueIcon
                        : CustomColor.greyIcon,
                  ),
                  label: "Билеты",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    LocalIcons.text,
                    width: 20,
                    height: 20,
                    color: controller.currentTab.value == 1
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  label: "Проездной",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    LocalIcons.busWithRoadSign,
                    width: 20,
                    height: 20,
                    color: controller.currentTab.value == 2
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  label: "Расписание",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    LocalIcons.user,
                    width: 20,
                    height: 20,
                    color: controller.currentTab.value == 3
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  label: "Кабинет",
                )
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
                      CarouselSlider.builder(
                          itemCount: cards.length,
                          carouselController: controller.carouselController,
                          itemBuilder: (context, index, realIndex) {
                            return Image(
                              height: 200,
                              width: 400,
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
                      //customdot
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: cards.asMap().entries.map((entry) {
                          return Container(
                              width: 15.0,
                              height: 15.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getColorForCard(
                                      entry, controller.indexPage.value)),
                              child: getIconForCard(entry.value));
                        }).toList(),
                      ),
                      Container(
                        color: Colors.white,
                        child: IndexedStack(
                          index: controller.indexPage.value,
                          children: cards.map((e) => Text(e.id)).toList(),
                        ),
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
                  controller.getCard();
                  return PageView();
                },
              ),
            ))));
  }
}

Color getColorForCard(MapEntry<int, PermCard> entry, int currentIndex) {
  bool isCurrent = entry.key == currentIndex;
  return isCurrent ? Colors.red : Colors.grey;
}

Widget getIconForCard(PermCard card) {
  bool isNewCard = card.type == CardTypes.newCard;
  return isNewCard
      ? const Center(child: Icon(Icons.add, size: 14))
      : const SizedBox();
}

//storage index image
//index stack
