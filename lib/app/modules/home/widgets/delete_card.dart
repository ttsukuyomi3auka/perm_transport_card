import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';

class DeleteCard extends StatelessWidget {
  final HomeController controller;
  final PermCard card;

  const DeleteCard(this.controller, this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: CustomColor.blackUpDown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: CustomColor.blackUpDown,
            elevation: 0,
            title: const Center(
              child: Text(
                "Удалить карту",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: CustomColor.greyIcon,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Вы действительно хотите удалить карту:",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "№${card.id}?",
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(10),
              ),
              child: const Text(
                "Отмена",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 30,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                controller.deleteCard();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(10),
              ),
              child: const Text(
                "Удалить",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
