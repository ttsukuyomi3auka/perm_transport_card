import 'dart:math';

import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/fake_data_class.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/models/response/fake_api_response.dart';

class FakeApiService {
  Future<FakeApiResponse<Card>> getData<T>(String id) async {
    await _randowDelay();
    // var exception = randomException();
    // if (exception != null) {
    //   return FakeApiResponse.failed(exception);
    // }
    Card card = FakeData.cards.firstWhere(
      (card) => card.id == id,
      orElse: () => unknown,
    );
    if (card == unknown) {
      return FakeApiResponse.failed(
          "Карта с номером [$id] не найдена в системе");
    } else {
      return FakeApiResponse.success(card);
    }
  }

  // String? randomException() {
  //   var random = Random().nextInt(10);
  //   switch (random) {
  //     case 7:
  //       return "Рандомная ошибка 1";
  //     case 8:
  //       return "Рандомная ошибка 2";
  //     default:
  //       return null;
  //   }
  // }

  Future<void> _randowDelay() async {
    var random = Random().nextInt(2000);
    return Future.delayed(Duration(milliseconds: random));
  }
}
