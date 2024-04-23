import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/app/modules/home/widgets/card_info.dart';
import 'package:perm_transport_card/app/modules/home/widgets/delete_card.dart';
import 'package:perm_transport_card/app/modules/home/widgets/rename_card.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';



PopupMenuButton drawPopupMenu(PermCard card) {
  HomeController controller = Get.find();
  return PopupMenuButton(
    color: CustomColor.black,
    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
      PopupMenuItem(
        child: ListTile(
          title: const Text(
            "Информация о карте",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onTap: () {
            Get.to(const CardInfo(), arguments: card);
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
            controller.fakeUpdate();
            Get.back();
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
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: RenameCard(card),
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
                return DeleteCard(card);
              },
            );
          },
        ),
      )
    ],
  );
}

class CustomAppBarAddedCard extends StatelessWidget {
  final HomeController controller = Get.find();
  CustomAppBarAddedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: CustomColor.grey,
                  elevation: 15,
                  shape: Border(
                      left: BorderSide(color: CustomColor.green, width: 4)),
                  content: const Text(
                    "Номер карты скопирован",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  controller.currentCardsList[controller.indexPage.value].id,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(
                  width: 2,
                ),
                Icon(
                  Icons.copy,
                  size: 16,
                  color: CustomColor.blueIcon,
                )
              ],
            ),
          ),
          Text(
            controller.currentCardsList[controller.indexPage.value].name,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ]),
        IconButton(
          onPressed: () {
            PopupMenuButton popupMenu = drawPopupMenu(
                controller.currentCardsList[controller.indexPage.value]);

            showMenu(
              surfaceTintColor: CustomColor.black,
              context: context,
              position: const RelativeRect.fromLTRB(100, 70, 0, 0),
              items: popupMenu.itemBuilder(context),
            );
          },
          icon: Icon(Icons.more_vert, size: 40, color: CustomColor.greyIcon),
        )
      ],
    );
  }
}

class CustomAppBarNewCard extends StatelessWidget {
  const CustomAppBarNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        children: [
          Text(
            "Добавить карту",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
