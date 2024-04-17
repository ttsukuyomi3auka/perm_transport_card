import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/resources/resources.dart';

List<PermCard> data = [
  // PermCard(
  //     "9643105903300000000",
  //     "Активна",
  //     "Студенческий проездной документ",
  //     "Пермь",
  //     DateTime.now().add(const Duration(days: 365 * 4)),
  //     "Студенты",
  //     DateTime.now().add(const Duration(days: 365 * 1)),
  //     Images.studentCard),
  PermCard(
      "9643105903311111111",
      "Активна",
      "Гражданский проездной документ",
      "Пермь",
      DateTime.now().add(const Duration(days: 365 * 4)),
      "Нет льготы",
      DateTime.utc(1970),
      Images.defaultCard,
      "Транспортная карта"),
  PermCard("96431059033", "", "", "", DateTime.now(), "", DateTime.now(),
      Images.defaultCardGreyAdd, "Транспортная карта")
];
List<PermCard> deletedData = [
  PermCard("96431059033", "", "", "", DateTime.now(), "", DateTime.now(),
      Images.defaultCardGreyAdd, "Транспортная карта")
];

abstract class FakeData {
  static List<PermCard> cards = data;
  static List<PermCard> empty = deletedData;
}
