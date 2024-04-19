import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/fake_data_class.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/repositories/fake_card_repository.dart';

class HomeController extends GetxController {
  final FakeCardRepository _fakeCardRepository;
  final indexPage = 0.obs;
  final carouselController = CarouselController();
  final _cards = CardListResponse.loading().obs;
  RxInt currentTab = 1.obs;
  final Rx<PermCard> currentCard = unknown.obs;
  TextEditingController idCard = TextEditingController();
  String id = defaultId;
  Rx<InputDecoration> textFieldDecoration =
      Rx<InputDecoration>(const InputDecoration());
  Rx<Color> buttonColor = Rx<Color>(CustomColor.grey);

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

  void updateTextFieldDecoration(InputDecoration newDecoration) {
    textFieldDecoration.value = newDecoration;
  }

  void deleteCard() {
    _cards.value = CardListResponse.success(FakeData.empty);
    setDefaultParametrs();
  }

  void setDefaultParametrs() {
    id = defaultId;
    idCard.text = '';
    textFieldDecoration.value = InputDecoration(
      counterText: "",
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.grey, width: 1.0),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.grey, width: 1.0),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    buttonColor.value = CustomColor.grey;
  }

  void updateCurrentCard(PermCard card) {
    printInfo(info: "Проверка что карта приходит не пустая ${card.id}");
    currentCard.value = card;
    update();
    fakeUpdate();
  }

  void fakeUpdate() async {
    await _fakeCardRepository.getCard(id);
    _cards.value = _cards.value;
  }

  Future<void> getCard() async {
    id += idCard.text;
    _cards.value = CardListResponse.loading();
    _cards.value = await _fakeCardRepository.getCard(id);
    printInfo(info: "Я выполнил запрос и получил это: ${_cards.value}");
    _cards.value.when(
        success: (data) {
          updateCurrentCard(data[0]);
        },
        loading: () => {},
        failed: (mes) => {});
    setDefaultParametrs();
  }

  @override
  void onClose() {
    idCard.dispose();
    super.onClose();
  }
}
