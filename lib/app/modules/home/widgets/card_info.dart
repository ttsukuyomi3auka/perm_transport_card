import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final PermCard card = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.blackUpDown,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Траспортная карта",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Информация о карте",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 325,
              height: 375,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: CustomColor.black,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    card.id,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1.0,
                    height: 6,
                    indent: 2,
                    endIndent: 2,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Статус",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    card.status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Тип карты",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    card.type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Регион",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    card.region,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Срок действия карты",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    card.formatDateTime(card.cardValidityPeriod),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Тип льготы",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    card.benefit,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Срок действия льготы",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    card.formatDateTime(card.benefitValidityPeriod),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
