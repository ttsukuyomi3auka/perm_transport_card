import 'package:freezed_annotation/freezed_annotation.dart';

class PermCard {
  String id;
  String status;
  String type;
  String region;
  DateTime cardValidityPeriod;
  String benefit;
  DateTime benefitValidityPeriod;
  String image;
  String name;

  PermCard(
      this.id,
      this.status,
      this.type,
      this.region,
      this.cardValidityPeriod,
      this.benefit,
      this.benefitValidityPeriod,
      this.image,
      this.name);
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
