import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/repositories/fake_card_repository.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(viewportFraction: 0.8);
  final FakeCardRepository _fakeCardRepository;
  final _cards = CardListResponse.loading().obs;
  RxInt currentTab = 1.obs;
  Rx<PermCard> currentCard = unknown.obs;
  TextEditingController idCard = TextEditingController();
  String id = defaultId;

  HomeController(this._fakeCardRepository);

  CardListResponse get cards => _cards.value;

  void setCurrentTab(int tabIndex) {
    currentTab.value = tabIndex;
  }

  @override
  void onInit() async {
    await getCard();
    super.onInit();
  }

  void updateCurrentCard(PermCard card) {
    currentCard.value = card;
  }

  Future<void> getCard() async {
    id += idCard.text;
    _cards.value = CardListResponse.loading();
    _cards.value = await _fakeCardRepository.getCard(id);
    print("Я выполнил запрос и получил это: ${_cards.value}");
    _cards.value.when(
        success: (data) {
          currentCard.value = data[0];
        },
        loading: () => {},
        failed: (mes) => {});
    id = defaultId;
  }
}
