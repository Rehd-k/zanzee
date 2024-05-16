class CartModel {
  CartModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.options,
      required this.cutleries,
      required this.extras,
      required this.amount});

  String id;
  String name;
  int price;
  String image;
  String options;
  List extras;
  List cutleries;
  int amount;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "options": options,
        "extras": extras,
        "cutleries": cutleries,
        "amount": amount
      };
}
