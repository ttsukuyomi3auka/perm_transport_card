import 'package:flutter/material.dart';
import 'package:perm_transport_card/models/card.dart';

Widget drawCustomDot(List<PermCard> cards, int indexPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: cards.asMap().entries.map((entry) {
      return Container(
          width: 15.0,
          height: 15.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: getColorForCard(entry, indexPage)),
          child: getIconForCard(entry.value));
    }).toList(),
  );
}

Color getColorForCard(MapEntry<int, PermCard> entry, int currentIndex) {
  bool isCurrent = entry.key == currentIndex;
  return isCurrent ? Colors.red : Colors.grey;
}

Widget getIconForCard(PermCard card) {
  bool isNewCard = card.type == CardTypes.newCard;
  return isNewCard
      ? const Center(child: Icon(Icons.add, size: 14))
      : const SizedBox();
}
