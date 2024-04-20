import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/app/modules/home/widgets/card_info.dart';
import 'package:perm_transport_card/app/modules/home/widgets/delete_card.dart';
import 'package:perm_transport_card/app/modules/home/widgets/rename_card.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';

class CustomAppBarAddedCard extends StatelessWidget {
  final PermCard card;
  final HomeController controller = Get.find();

  CustomAppBarAddedCard(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: context.width,
      color: CustomColor.blackUpDown,
      padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      card.id,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.copy,
                        size: 16,
                        color: CustomColor.blueIcon,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (card.type != CardTypes.newCard)
                  Text(
                    card.name,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
              ],
            ),
            PopupMenuButton(
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
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
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
            ),
          ],
        ),
      ),
    );
  }
}

Widget drawAppBarTitle(PermCard card) {
  return Container(
    height: 80,
    color: CustomColor.blackUpDown,
    padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
        ),
        const SizedBox(height: 4),
        if (card.type != CardTypes.newCard)
          Text(
            card.name,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            textAlign: TextAlign.left,
          ),
      ],
    ),
  );
}

Widget drawAppBar(PermCard card) {
  bool isNew = card.type == CardTypes.newCard;
  return isNew ? CustomAppBarNewCard(card) : CustomAppBarAddedCard(card);
}

class CustomAppBarNewCard extends StatelessWidget {
  final PermCard card;
  const CustomAppBarNewCard(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: double.infinity,
        color: CustomColor.blackUpDown,
        padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
        child: const Center(
          child: Row(
            children: [
              Text(
                "Добавить карту",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
