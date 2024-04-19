import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

List<PermCard> data = [
  PermCard(
      "9643105903300000000",
      "Активна",
      CardTypes.student,
      "Пермь",
      DateTime.now().add(const Duration(days: 365 * 4)),
      "Студенты",
      DateTime.utc(1970),
      "Транспортная карта"),
  PermCard(
      "9643105903311111111",
      "Активна",
      CardTypes.defaultCard,
      "Пермь",
      DateTime.now().add(const Duration(days: 365 * 4)),
      "Нет льготы",
      DateTime.utc(1970),
      "Транспортная карта"),
  PermCard("96431059033", "", CardTypes.newCard, "", DateTime.now(), "",
      DateTime.now(), "Транспортная карта")
];
List<PermCard> deletedData = [
  PermCard("96431059033", "", CardTypes.newCard, "", DateTime.now(), "",
      DateTime.now(), "Транспортная карта"),
];

List<String> imageCard = [
  Images.defaultCard,
  Images.defaultCardGreyAdd,
];

abstract class FakeData {
  static List<PermCard> cards = data;
  static List<PermCard> empty = deletedData;
  static List<String> imageCard = imageCard;
}
