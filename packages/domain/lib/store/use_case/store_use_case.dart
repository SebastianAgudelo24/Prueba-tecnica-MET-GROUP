part of domain;

class StoreUseCase {
  final StoreRepository _storeRepository;

  StoreUseCase(this._storeRepository);
  // Crear tienda
  Future<Store> createStore({
    required String name,
    required List<Item> items,
  }) {
    return _storeRepository.createStore(
      name: name,
      items: items,
    );
  }

  // Eliminar tienda
  Future<void> deleteStore({required String id}) {
    return _storeRepository.deleteStore(
      id: id,
    );
  }

  // Obtener listado de tiendas
  Future<List<Store>> getStores() {
    return _storeRepository.getStores();
  }

  // Crear item
  Future<Item> createItem({
    required String storeId,
    required String name,
    required double price,
  }) {
    return _storeRepository.createItem(
      storeId: storeId,
      name: name,
      price: price,
    );
  }

  // Borrar item
  Future<void> deleteItem({required String id, required String storeId}) {
    return _storeRepository.deleteItem(
      storeId: storeId,
      id: id,
    );
  }

  // Editar item
  Future<Item> editItem({
    required String id,
    required String newName,
    required double newPrice,
  }) {
    return _storeRepository.editItem(
      id: id,
      newName: newName,
      newPrice: newPrice,
    );
  }
}
