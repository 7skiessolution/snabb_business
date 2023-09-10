class PaymentTypeModel {
  String? image;
  String? name;

  PaymentTypeModel({required this.image, required this.name});
  static List<PaymentTypeModel> typemodellist = [
    PaymentTypeModel(image: "images/bank.jpeg", name: "Bank"),
    PaymentTypeModel(image: "images/Group.jpeg", name: "Cash"),
    PaymentTypeModel(image: "images/Group 247.jpeg", name: "Other"),
  ];
}
