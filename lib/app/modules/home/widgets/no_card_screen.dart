import 'package:flutter/material.dart';
import 'package:perm_transport_card/models/card.dart';

class NoCardScreen extends StatelessWidget {
  final PermCard card;

  const NoCardScreen(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: 175,
          width: 350,
          image: AssetImage(card.image),
        ),
      ],
    );
  }
}
