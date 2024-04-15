import 'package:flutter/material.dart';
import 'package:perm_transport_card/models/card.dart';

class CardAddedScreen extends StatelessWidget {
  final PermCard card;

  const CardAddedScreen(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Image(
          height: 175,
          width: 350,
          image: AssetImage(card.image),
        ),
      ],
    );
  }
}
