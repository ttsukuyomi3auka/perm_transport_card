import 'dart:math';

import 'package:perm_transport_card/fake_data_class.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/models/response/fake_api_response.dart';

class FakeApiService {
  Future<FakeApiResponse<List<PermCard>>> getData<T>(String id) async {
    await _randowDelay();
    // var exception = randomException();
    // if (exception != null) {
    //   return FakeApiResponse.failed(exception);
    // }
    bool containsCard = FakeData.cards.any((card) => card.id == id);

    if (containsCard) {
      return FakeApiResponse.success(FakeData.cards);
    } else {
      return FakeApiResponse.failed(
          "Карта с номером [$id] не найдена в системе");
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
