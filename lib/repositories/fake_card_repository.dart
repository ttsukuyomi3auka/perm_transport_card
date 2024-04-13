import 'package:flutter/material.dart';
import 'package:perm_transport_card/models/response/fake_api_response.dart';
import 'package:perm_transport_card/services/fake_api_service.dart';

typedef CardListResponse = FakeApiResponse<List<Card>>;

class FakeCardRepository {
  final FakeApiService api;

  FakeCardRepository(this.api);

  Future<CardListResponse> getCard(String id) async {
    var data = await api.getData(id);
    return data.when(
        success: (data) {
          return CardListResponse.success(data as List<Card>);
        },
        loading: () => CardListResponse.loading(),
        failed: (mes) => CardListResponse.failed(mes));
  }
}
