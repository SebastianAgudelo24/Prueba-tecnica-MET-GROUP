part of infrastructure;

class StoreModel extends Store {
  StoreModel({
    required super.id,
    required super.name,
    required super.items,
  });

  ///from json
  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      items: (json['items'] as List<dynamic>)
          .map((itemJson) => ItemModel.fromJson(itemJson))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['items'] = items.map((e) => e.toJson()).toList();
    return data;
  }
}
