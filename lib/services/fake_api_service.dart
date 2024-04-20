import 'dart:math';

import 'package:get/get.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/fake_data_class.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/models/response/fake_api_response.dart';

class FakeApiService {
  Future<FakeApiResponse<PermCard>> getDataById<T>(String id) async {
    await _randowDelay();
    printInfo(info: "ЭТО В СЕРВИСЕ $id");
    bool containsCard = FakeData.cards.any((card) => card.id == id);
    if (containsCard) {
      var card = FakeData.cards.firstWhere((card) => card.id == id);
      printInfo(info: "ЭТО В СЕРВИСЕ $card");
      return FakeApiResponse.success(card);
    } else {
      return FakeApiResponse.failed(
          "Карта с номером [$id] не найдена в системе");
    }
  }

  Future<FakeApiResponse<List<PermCard>>> getData<T>() async {
    await _randowDelay();
    return FakeApiResponse.success(FakeData.cards);
  }

  Future<void> _randowDelay() async {
    var random = Random().nextInt(2000);
    return Future.delayed(Duration(milliseconds: random));
  }
}
