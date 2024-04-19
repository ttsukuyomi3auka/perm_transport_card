import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/controllers/home_controller.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

class NoCardScreen extends StatelessWidget {
  final PermCard card;
  final HomeController controller;
  const NoCardScreen(this.card, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Image(
          height: 200,
          width: 400,
          image: AssetImage(card.type.image),
        ),
        const SizedBox(height: 20),
        Container(
          width: 250,
          height: 120,
          decoration: BoxDecoration(
            color: CustomColor.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Номер карты",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    card.id,
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColor.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 120,
                    height: 45,
                    child: Expanded(
                      child: Obx(() => TextField(
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            controller: controller.idCard,
                            onTapOutside: (PointerDownEvent event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            onChanged: (value) {
                              var borderColor = CustomColor.grey;
                              if (value.isNotEmpty) {
                                borderColor = Colors.red;
                                if (value.length == 8) {
                                  borderColor = CustomColor.green;
                                  FocusScope.of(context).unfocus();
                                }
                              }
                              final inputDecoration = InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              );
                              controller.buttonColor.value = borderColor;
                              controller
                                  .updateTextFieldDecoration(inputDecoration);
                            },
                            decoration: controller.textFieldDecoration.value,
                            maxLength: 8,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            keyboardType: TextInputType.number,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => Text(
                    "Введите последние 8 цифр номера карты.",
                    style: TextStyle(
                      fontSize: 10,
                      color: controller.buttonColor.value == Colors.red
                          ? Colors.red
                          : Colors.white,
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Obx(() => SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      controller.buttonColor.value == CustomColor.green
                          ? CustomColor.blue
                          : CustomColor.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                child: InkWell(
                  onTap: () {
                    if (controller.buttonColor.value == CustomColor.green) {
                      controller.getCard();
                      controller.setDefaultParametrs();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        LocalIcons.add,
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Добавить",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
