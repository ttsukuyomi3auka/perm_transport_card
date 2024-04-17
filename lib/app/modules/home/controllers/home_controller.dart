import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/repositories/fake_card_repository.dart';

class HomeController extends GetxController {
  PageController pageController = PageController(viewportFraction: 0.85);
  final FakeCardRepository _fakeCardRepository;
  final _cards = CardListResponse.loading().obs;
  RxInt currentTab = 1.obs;
  Rx<PermCard> currentCard = unknown.obs;
  TextEditingController idCard = TextEditingController();
  RxBool hasText = false.obs;
  RxBool isValid = false.obs;
  String id = defaultId;

  HomeController(this._fakeCardRepository);

  CardListResponse get cards => _cards.value;

  void setCurrentTab(int tabIndex) {
    currentTab.value = tabIndex;
  }

  void updateTextFieldStatus() {
    hasText.value = idCard.text.isNotEmpty;
    isValid.value = idCard.text.length == 8;
  }

  @override
  void onInit() async {
    await getCard();
    idCard.addListener(updateTextFieldStatus);
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
          updateCurrentCard(data[0]);
        },
        loading: () => {},
        failed: (mes) => {});
    id = defaultId;
  }

  @override
  void onClose() {
    idCard.dispose();
    super.onClose();
  }
}
