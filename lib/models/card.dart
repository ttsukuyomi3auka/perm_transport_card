import 'package:perm_transport_card/resources/resources.dart';

enum CardTypes {
  student,
  defaultCard,
  newCard,
}

extension CardTypeEx on CardTypes {
  String get text => switch (this) {
        CardTypes.student => "Студенческий проездной документ",
        CardTypes.defaultCard => "Гражданский проездной документ",
        CardTypes.newCard => "",
      };

  String get image => switch (this) {
        CardTypes.student => Images.studentCard,
        CardTypes.defaultCard => Images.defaultCard,
        CardTypes.newCard => Images.defaultCardGreyAdd,
      };
}

class PermCard {
  String id = "96431059033";
  String status;
  CardTypes type;
  String region;
  DateTime cardValidityPeriod;
  String benefit;
  DateTime benefitValidityPeriod;
  String name;

  PermCard(
    this.id,
    this.status,
    this.type,
    this.region,
    this.cardValidityPeriod,
    this.benefit,
    this.benefitValidityPeriod,
    this.name,
  );
  PermCard copyWith({
    String? id,
    String? status,
    CardTypes? type,
    String? region,
    DateTime? cardValidityPeriod,
    String? benefit,
    DateTime? benefitValidityPeriod,
    String? image,
    String? name,
  }) {
    return PermCard(
      id ?? this.id,
      status ?? this.status,
      type ?? this.type,
      region ?? this.region,
      cardValidityPeriod ?? this.cardValidityPeriod,
      benefit ?? this.benefit,
      benefitValidityPeriod ?? this.benefitValidityPeriod,
      name ?? this.name,
    );
  }

  String formatDateTime(DateTime dateTime) {
    if (dateTime == DateTime.utc(1970)) {
      return "Нет льготы";
    }
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    return "$day.$month.$year";
  }
}
