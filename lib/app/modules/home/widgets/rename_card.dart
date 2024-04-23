import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/app/modules/home/widgets/app_bar.dart';
import 'package:perm_transport_card/app/modules/home/widgets/custom_dot.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';

class RenameCard extends StatelessWidget {
  final PermCard card;
  final HomeController controller = Get.find();
  final TextEditingController textEditingController;
  RenameCard(this.card, {super.key})
      : textEditingController = TextEditingController(text: card.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: CustomColor.blackUpDown,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: CustomColor.blackUpDown,
            elevation: 0,
            title: Center(
              child: Text(
                card.id,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.close, color: CustomColor.greyIcon),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            children: [
              Text(
                "Введите новое название:",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 40,
              child: TextFormField(
                textAlign: TextAlign.start,
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CustomColor.greyIcon, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CustomColor.greyIcon, width: 1.0),
                  ),
                ),
                onEditingComplete: () {
                  final currentValue = textEditingController.text;
                  FocusScope.of(context).unfocus();
                  textEditingController.text = currentValue;
                },
                style: const TextStyle(color: Colors.white),
              )),
          const SizedBox(
            height: 70,
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
                card.name = textEditingController.text;
                card.copyWith(name: textEditingController.text);

                controller.currentCardsList[controller.indexPage.value].name = textEditingController.text;
                controller.update();
                printInfo(info: card.name);
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                "Сохранить",
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
