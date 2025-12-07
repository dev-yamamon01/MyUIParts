import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';

part 'product_repository.g.dart';

@riverpod
class ProductRepository extends _$ProductRepository {
  @override
  Future<List<Product>> build() async {
    return await _loadProducts();
  }

  Future<List<Product>> _loadProducts() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/data/products.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // エラーハンドリング: 空のリストを返す
      return [];
    }
  }

  Product? getProductById(String id) {
    final products = state.value;
    if (products == null) return null;

    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}