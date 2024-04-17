import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    //TODO Динамическое измениние цвета borderSide

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Image(
          height: 200,
          width: 400,
          image: AssetImage(card.image),
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
                    defaultId,
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
                      child: TextField(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        // controller: controller.idCard,
                        decoration: InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColor.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomColor.grey, width: 3.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        maxLength: 8,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        keyboardType: TextInputType.number,
                        // onChanged: (value) {
                        //   if (value.length == 8) {
                        //     controller.idCard.text = value.substring(0, 8);
                        //     controller.idCard.selection =
                        //         TextSelection.fromPosition(
                        //             const TextPosition(offset: 8));
                        //     controller.isValid.value = true;
                        //   } else {
                        //     controller.isValid.value = false;
                        //   }
                        // },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Введите последние 8 цифр номера карты.",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 250,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
            ),
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
        )
      ],
    );
  }

  Color _getBorderColor() {
    if (controller.isValid.value) {
      return Colors.greenAccent;
    } else {
      return Colors.red;
    }
  }
}
