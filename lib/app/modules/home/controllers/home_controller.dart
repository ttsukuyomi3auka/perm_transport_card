import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/repositories/fake_card_repository.dart';

class HomeController extends GetxController {
  final FakeCardRepository _fakeCardRepository;
  final _cards = CardListResponse.loading().obs;
  RxInt currentTab = 1.obs;
  List<Card>? currnetCard;
  RxInt hasCard = 1.obs;
  TextEditingController idCard = TextEditingController();
  String id = "96431059033";

  HomeController(this._fakeCardRepository);

  void setCurrentTab(int tabIndex) {
    currentTab.value = tabIndex;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void getCard() async {
    id += idCard.text;
    _cards.value = CardListResponse.loading();
    _cards.value = await _fakeCardRepository.getCard(id);
  }
}
