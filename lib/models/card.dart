class PermCard {
  String id;
  String status;
  String type;
  String region;
  DateTime cardValidityPeriod;
  String benefit;
  DateTime benefitValidityPeriod;
  String image;

  PermCard(
      this.id,
      this.status,
      this.type,
      this.region,
      this.cardValidityPeriod,
      this.benefit,
      this.benefitValidityPeriod,
      this.image);
}
