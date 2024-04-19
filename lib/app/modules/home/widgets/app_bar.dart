import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/app/modules/home/widgets/card_info.dart';
import 'package:perm_transport_card/app/modules/home/widgets/delete_card.dart';
import 'package:perm_transport_card/app/modules/home/widgets/rename_card.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';

class CunstomAppBar extends GetView<HomeController> {
  const CunstomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return AppBar(
      backgroundColor: CustomColor.blackUpDown,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Row(
                children: [
                  Text(
                    controller.currentCard.value.type == CardTypes.newCard
                        ? "Добавить карту"
                        : controller.currentCard.value.id,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  if (controller.currentCard.value.type != CardTypes.newCard)
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.copy,
                        size: 16,
                        color: CustomColor.blueIcon,
                      ),
                    ),
                ],
              )),
          const SizedBox(height: 4),
          Obx(() {
            if (controller.currentCard.value.type != CardTypes.newCard) {
              return Obx(() => Text(
                    controller.currentCard.value.name,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.left,
                  ));
            } else {
              return const SizedBox();
            }
          })
        ],
      ),
      actions: [
        Obx(() => PopupMenuButton(
              enabled: controller.currentCard.value.type != CardTypes.newCard,
              color: CustomColor.black,
              icon:
                  Icon(Icons.more_vert, size: 40, color: CustomColor.greyIcon),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      "Информация о карте",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onTap: () {
                      Get.to(const CardInfo(),
                          arguments: controller.currentCard.value);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      "Обновить",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onTap: () {
                      controller.getCard();
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      "Переименовать карту",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: RenameCard(controller.currentCard.value),
                          );
                        },
                      );
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      "Удалить карту",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteCard(
                              controller, controller.currentCard.value);
                        },
                      );
                    },
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

Widget drawAppBarTitle(PermCard card) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(() => Row(
            children: [
              Text(
                card.type == CardTypes.newCard ? "Добавить карту" : card.id,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(width: 4),
              if (card.type != CardTypes.newCard)
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.copy,
                    size: 16,
                    color: CustomColor.blueIcon,
                  ),
                ),
            ],
          )),
      const SizedBox(height: 4),
      if (card.type != CardTypes.newCard)
        Text(
          card.name,
          style: const TextStyle(fontSize: 14, color: Colors.white),
          textAlign: TextAlign.left,
        )
    ],
  );
}

Widget drawAppBarAction(PermCard card) {
  return PopupMenuButton(
    enabled: card.type != CardTypes.newCard,
    color: CustomColor.black,
    icon: Icon(Icons.more_vert, size: 40, color: CustomColor.greyIcon),
    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
      getItem("Информация о карте", () {
        print("fffff");
      }),
      // PopupMenuItem(
      //   child: ListTile(
      //     title: const Text(
      //       "Обновить",
      //       style: TextStyle(color: Colors.white, fontSize: 12),
      //     ),
      //     onTap: () {
      //       controller.getCard();
      //     },
      //   ),
      // ),
      // PopupMenuItem(
      //   child: ListTile(
      //     title: const Text(
      //       "Переименовать карту",
      //       style: TextStyle(color: Colors.white, fontSize: 12),
      //     ),
      //     onTap: () {
      //       showModalBottomSheet(
      //         context: context,
      //         isScrollControlled: true,
      //         builder: (context) {
      //           return Padding(
      //             padding: EdgeInsets.only(
      //                 bottom: MediaQuery.of(context).viewInsets.bottom),
      //             child: RenameCard(controller.currentCard.value),
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
      // PopupMenuItem(
      //   child: ListTile(
      //     title: const Text(
      //       "Удалить карту",
      //       style: TextStyle(color: Colors.white, fontSize: 12),
      //     ),
      //     onTap: () {
      //       showModalBottomSheet(
      //         isScrollControlled: true,
      //         context: context,
      //         builder: (BuildContext context) {
      //           return DeleteCard(controller, controller.currentCard.value);
      //         },
      //       );
      //     },
      //   ),
      // ),
    ],
  );
}

PopupMenuItem getItem(String title, void Function()? onTap) {
  return PopupMenuItem(
    child: ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      onTap: onTap,
    ),
  );
}
