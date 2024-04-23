part of infrastructure;

class StoreRepositoryImpl extends StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl(this._storeDataSource);

  @override
  Future<Store> createStore({
    required String name,
    required List<Item> items,
  }) =>
      _storeDataSource.createStore(
        name: name,
        items: items,
      );

  @override
  Future<void> deleteStore({required String id}) =>
      _storeDataSource.deleteStore(
        id: id,
      );

  @override
  Future<List<Store>> getStores() => _storeDataSource.getStores();

  @override
  Future<Item> createItem({
    required String storeId,
    required String name,
    required double price,
  }) =>
      _storeDataSource.createItem(
        storeId: storeId,
        name: name,
        price: price,
      );

  @override
  Future<void> deleteItem({required String id, required String storeId}) =>
      _storeDataSource.deleteItem(id: id, storeId: storeId);

  @override
  Future<Item> editItem(
          {required String id,
          required String newName,
          required double newPrice}) =>
      _storeDataSource.editItem(
        id: id,
        newName: newName,
        newPrice: newPrice,
      );
}
