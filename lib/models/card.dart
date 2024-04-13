class Card {
  String id;
  String status;
  String type;
  String region;
  DateTime cardValidityPeriod;
  String benefit;
  DateTime benefitValidityPeriod;
  String image;

  Card(this.id, this.status, this.type, this.region, this.cardValidityPeriod,
      this.benefit, this.benefitValidityPeriod, this.image);
}
