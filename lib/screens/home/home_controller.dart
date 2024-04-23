import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/dependency_injector.dart';

class HomeController extends ChangeNotifier {
  final StoreUseCase _storeUseCase;
  List<Store> stores = [];
  HomeController({required StoreUseCase storeUseCase})
      : _storeUseCase = storeUseCase {
    print('---------------------');
    print('HomeController init');
    print('---------------------');
  }

  bool isLoadingAccount = false;
  Object? errorAccount;

  Future<Store> createStore({
    required String name,
    required List<Item> items,
  }) =>
      _storeUseCase.createStore(
        name: name,
        items: items,
      );

  Future<List<Store>> getStores() => _storeUseCase.getStores();

  Future<void> deleteStore({required String id}) =>
      _storeUseCase.deleteStore(id: id);

  Future<Item> createItem({
    required String storeId,
    required String name,
    required double price,
  }) =>
      _storeUseCase.createItem(
        storeId: storeId,
        name: name,
        price: price,
      );

  Future<Item> editItem({
    required String id,
    required String newName,
    required double newPrice,
  }) =>
      _storeUseCase.editItem(
        id: id,
        newName: newName,
        newPrice: newPrice,
      );

  Future<void> deleteItem({required String id, required String storeId}) =>
      _storeUseCase.deleteItem(id: id, storeId: storeId);

  @override
  void dispose() {
    print('---------------------');
    print('HomeController disposed');
    print('---------------------');
    super.dispose();
  }
}

final homeControllerProvider =
    ChangeNotifierProvider.autoDispose<HomeController>(
  (ref) =>
      HomeController(storeUseCase: DependencyInjector().getIt<StoreUseCase>()),
);
