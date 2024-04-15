import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

class CardAddedScreen extends StatelessWidget {
  final PermCard card;

  const CardAddedScreen(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime futureDate = DateTime.now().add(const Duration(days: 30));
    DateTime futureDateWithZeroTime = DateTime(
        futureDate.year, futureDate.month, futureDate.day, futureDate.hour);
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
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Баланс:",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "0 руб",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 250,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
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
              const Text(
                "Проездной на 1 месяц",
                style: TextStyle(color: Colors.white),
              ),
              Text("До ${futureDateWithZeroTime.year}") //TODO выводить дату адекватно возможно хранить в модели
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
          height: 5,
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
