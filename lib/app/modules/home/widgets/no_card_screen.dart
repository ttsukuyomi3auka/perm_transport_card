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
  NoCardScreen(this.card, this.controller, {super.key});

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
            color: Colors.grey,
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
                    fontSize: 18,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    defaultId,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: Expanded(
                      child: TextField(
                        controller: controller.idCard,
                        decoration: InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0), width: 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        maxLength: 8,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.length == 8) {
                            controller.idCard.text = value.substring(
                                0, 8); // Обрезаем ввод после 8 символов
                            controller.idCard.selection =
                                TextSelection.fromPosition(const TextPosition(
                                    offset: 8)); // Перемещаем курсор в конец
                            // Делаем обводку зеленой, когда достигнута максимальная длина
                            controller.isValid.value = true;
                          } else {
                            // Делаем обводку красной, если введено меньше 8 символов
                            controller.isValid.value = false;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Введите последние 8 цифр номера карты",
                style: TextStyle(
                  fontSize: 12,
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
              backgroundColor: Colors.blueAccent,
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
                  style: TextStyle(color: Colors.white),
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
