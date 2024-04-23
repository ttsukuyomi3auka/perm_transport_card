import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perm_transport_card/app/modules/home/views/account.dart';
import 'package:perm_transport_card/app/modules/home/views/home_view.dart';
import 'package:perm_transport_card/app/modules/home/views/ticket.dart';
import 'package:perm_transport_card/app/modules/home/views/trail.dart';
import 'package:perm_transport_card/constants.dart';
import 'package:perm_transport_card/fake_data_class.dart';
import 'package:perm_transport_card/models/card.dart';
import 'package:perm_transport_card/repositories/fake_card_repository.dart';

class HomeController extends GetxController {
  final FakeCardRepository _fakeCardRepository;
  final indexPage = 0.obs;
  final _cards = CardListResponse.loading().obs;
  RxInt currentTab = 1.obs;
  final Rx<PermCard> currentCard = unknown.obs;
  TextEditingController idCard = TextEditingController();
  String id = defaultId;
  List<PermCard> currentCardsList = FakeData.cards;
  Rx<InputDecoration> textFieldDecoration =
      Rx<InputDecoration>(const InputDecoration());
  Rx<Color> buttonColor = Rx<Color>(CustomColor.grey);

  HomeController(this._fakeCardRepository);

  CardListResponse get cards => _cards.value;

  @override
  void onInit() async {
    await getCard();
    super.onInit();
  }

  void setCurrentTab(int tabIndex) {
    currentTab.value = tabIndex;
    switch (tabIndex) {
      case 0:
        Get.to(() => const TicketView());
        break;
      case 1:
        Get.to(() => HomeView());
        setDefaultParametrs();
        break;
      case 2:
        Get.to(() => const TrailView());
        break;
      case 3:
        Get.to(() => const AccountView());
      default:
    }
  }

  void updateTextFieldDecoration(InputDecoration newDecoration) {
    textFieldDecoration.value = newDecoration;
  }

  void deleteCard(String id) {
    _cards.value.when(
        success: (data) {
          currentCardsList = data.where((e) => e.id != id).toList();
        },
        loading: () {},
        failed: (mes) {});
    _cards.value = CardListResponse.success(currentCardsList);
  }

  void setDefaultParametrs() {
    indexPage.value = 0;
    id = defaultId; //! Костыль всегда возвращаются данные
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
    currentCard.value = card;
  }

  void fakeUpdate() async {
    var temp = _cards.value;
    _cards.value = CardListResponse.loading();
    await Future.delayed(const Duration(seconds: 1));
    _cards.value = temp;
  }

  Future<void> getCard() async {
    _cards.value = CardListResponse.loading();
    _cards.value = await _fakeCardRepository.getCard();
    _cards.value.when(
        success: (data) {
          currentCardsList = data;
        },
        loading: () => {},
        failed: (mes) => {});
    setDefaultParametrs();
  }

  Future<void> getCardById() async {
    id += idCard.text;
    _cards.value = CardListResponse.loading();
    var temp = await _fakeCardRepository.getCardById(id);
    temp.when(success: (data) {
      bool containsData = currentCardsList.any((card) => card.id == data.id);

      if (!containsData) {
        currentCardsList.length > 1
            ? currentCardsList.insert(1, data)
            : currentCardsList.insert(0, data);
      }
      _cards.value = CardListResponse.success(currentCardsList);
      printInfo(info: "Я выполнил запрос и получил это: ${_cards.value}");
      setDefaultParametrs();
    }, loading: () {
      _cards.value = CardListResponse.loading();
    }, failed: (mes) {
      _cards.value = CardListResponse.failed(mes);
      setDefaultParametrs();
    });
  }

  @override
  void onClose() {
    idCard.dispose();
    super.onClose();
  }
}
