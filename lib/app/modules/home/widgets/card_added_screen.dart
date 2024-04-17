// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

class CardAddedScreen extends StatelessWidget {
  final PermCard card;

  const CardAddedScreen(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().add(const Duration(days: 30));
    String convertedDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${"00"}-${"00"}";
    return Column(
      children: [
        const SizedBox(height: 10),
        Image(
          height: 200,
          width: 400,
          image: AssetImage(card.image),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 250,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Баланс:",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "0 руб",
                  style: TextStyle(
                    color: Colors.black,
                    // backgroundColor: Colors.lightBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: 250,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Активные проездные",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Остаток",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 1.0,
                height: 6,
                indent: 5,
                endIndent: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Проездной на один месяц",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "до ",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        convertedDateTime,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 250,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  LocalIcons.wallet,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                const Text(
                  "Пополнить",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 250,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  LocalIcons.bus,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                const Text(
                  "Купить проездной",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
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
                  LocalIcons.history,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                const Text(
                  "История",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
