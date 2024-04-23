part of domain;

abstract class Store {
  final String id;
  final String name;
  final List<Item> items;

  Store({
    required this.id,
    required this.name,
    required this.items,
  });

  //To Json
  Map<String, dynamic> toJson();
}
