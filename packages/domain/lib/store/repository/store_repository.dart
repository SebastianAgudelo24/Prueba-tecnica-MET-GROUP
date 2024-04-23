part of domain;

abstract class StoreRepository {
  // Crear tienda
  Future<Store> createStore({
    required String name,
    required List<Item> items,
  });

  // Eliminar tienda
  Future<void> deleteStore({required String id});

  // Obtener listado de tiendas
  Future<List<Store>> getStores();

  // Crear item
  Future<Item> createItem({
    required String storeId,
    required String name,
    required double price,
  });

  // Borrar item
  Future<void> deleteItem({required String id, required String storeId});

  // Editar item
  Future<Item> editItem({
    required String id,
    required String newName,
    required double newPrice,
  });
}
