part of domain;

abstract class Item {
  final String id;
  String name;
  double price;

  Item({
    required this.id,
    required this.name,
    required this.price,
  });

  // To Json
  Map<String, dynamic> toJson();
}
