import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/app/modules/home/widgets/card_added_screen.dart';
import 'package:perm_transport_card/app/modules/home/widgets/no_card_screen.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Row(
                  children: [
                    Text(
                      controller.currentCard.value.id == defaultId
                          ? "Добавить карту"
                          : controller.currentCard.value.id,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    if (controller.currentCard.value.id != defaultId)
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.copy,
                          size: 16,
                          color: Colors.blue,
                        ),
                      ),
                  ],
                )),
            const SizedBox(height: 4),
            Obx(
              () {
                if (controller.currentCard.value.id != defaultId) {
                  return const Text(
                    "Транспортная карта",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.left,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 40, color: Colors.white),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentTab.value,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            onTap: controller.setCurrentTab,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  LocalIcons.ticket,
                  width: 20,
                  height: 20,
                  color: controller.currentTab.value == 0
                      ? Colors.blue
                      : Colors.grey,
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
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return controller.cards.when(
                  success: (List<PermCard> cards) {
                    return PageView.builder(
                      itemCount: cards.length,
                      controller: controller.pageController,
                      onPageChanged: (index) {
                        controller.updateCurrentCard(cards[index]);
                      },
                      itemBuilder: (context, index) {
                        return ListenableBuilder(
                            listenable: controller.pageController,
                            builder: (context, child) {
                              double factor = 1;
                              if (controller.pageController.position
                                  .hasContentDimensions) {
                                factor = 1 -
                                    (controller.pageController.page! - index)
                                        .abs();
                              }
                              if (cards[index].id == defaultId) {
                                return NoCardScreen(cards[index], controller);
                              } else {
                                return CardAddedScreen(cards[index]);
                              }
                            });
                      },
                    );
                    // return Swiper(
                    //   viewportFraction: 0.9,
                    //   itemCount: cards.length,
                    //   itemBuilder: (context, index) {
                    //     if (cards[index].id == defaultId) {
                    //       return NoCardScreen(cards[index]);
                    //     } else {
                    //       return CardAddedScreen(cards[index]);
                    //     }
                    //   },
                    //   pagination: const SwiperPagination(),
                    // );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                  failed: (message) {
                    Get.snackbar("Ошибка", message);
                    return Container();
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
