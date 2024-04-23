part of infrastructure;

class ItemModel extends Item {
  ItemModel({
    required super.id,
    required super.name,
    required super.price,
  });

  ///from json
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
