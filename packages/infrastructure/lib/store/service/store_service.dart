part of infrastructure;

class StoreService extends StoreDataSource {
  final storeKey = 'storekey';
  final FlutterSecureStorage _flutterSecureStorage;

  StoreService({required FlutterSecureStorage flutterSecureStorage})
      : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<Store> createStore(
      {required String name, required List<Item> items}) async {
    try {
      final stores = await getStores();
      final store = StoreModel(
        id: const Uuid().v4(),
        name: name,
        items: items,
      );
      stores.add(store);
      await _saveStores(stores: stores);
      return store;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteStore({required String id}) async {
    try {
      final stores = await getStores();
      stores.removeWhere((element) => element.id == id);
      await _saveStores(stores: stores);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Store>> getStores() async {
    try {
      final data = await _flutterSecureStorage.read(key: storeKey);
      if (data == null) return [];
      final dataDecode = jsonDecode(data);

      return (dataDecode as List).map((e) => StoreModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Item> createItem({
    required String name,
    required double price,
    required String storeId,
  }) async {
    try {
      final stores = await getStores();
      final index = stores.indexWhere((element) => element.id == storeId);
      if (index != -1) {
        final item = ItemModel(
          id: const Uuid().v4(),
          name: name,
          price: price,
        );
        stores[index].items.add(item);
        await _saveStores(stores: stores);
        return item;
      } else {
        throw StoreNotFoundException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Item> editItem({
    required String id,
    required String newName,
    required double newPrice,
  }) async {
    try {
      final stores = await getStores();
      final index = stores.indexWhere((element) => element.id == id);
      if (index != -1) {
        final indexItem =
            stores[index].items.indexWhere((element) => element.id == id);
        if (indexItem != -1) {
          stores[index].items[indexItem].name = newName;
          stores[index].items[indexItem].price = newPrice;
          await _saveStores(stores: stores);
          return stores[index].items[indexItem];
        } else {
          throw ItemNotFoundException();
        }
      } else {
        throw StoreNotFoundException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteItem({required String id, required String storeId}) async {
    try {
      final stores = await getStores();
      final index = stores.indexWhere((element) => element.id == storeId);
      if (index != 1) {
        stores[index].items.removeWhere((element) => element.id == id);
        await _saveStores(stores: stores);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveStores({required List<Store> stores}) =>
      _flutterSecureStorage.write(
          key: storeKey,
          value: jsonEncode(stores.map((e) => e.toJson()).toList()));
}
