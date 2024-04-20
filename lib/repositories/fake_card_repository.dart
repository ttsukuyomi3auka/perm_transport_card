import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/models/response/fake_api_response.dart';
import 'package:perm_transport_card/services/fake_api_service.dart';

typedef CardListResponse = FakeApiResponse<List<PermCard>>;

class FakeCardRepository {
  final FakeApiService api;

  FakeCardRepository(this.api);

  Future<FakeApiResponse<PermCard>> getCardById(String id) async {
    var data = await api.getDataById(id);
    return data.when(
        success: (data) {
          return FakeApiResponse<PermCard>.success(data);
        },
        loading: () => FakeApiResponse<PermCard>.loading(),
        failed: (mes) => FakeApiResponse<PermCard>.failed(mes));
  }

  Future<CardListResponse> getCard() async {
    var data = await api.getData();
    return data.when(
        success: (data) {
          return CardListResponse.success(data);
        },
        loading: () => CardListResponse.loading(),
        failed: (mes) => CardListResponse.failed(mes));
  }
}
