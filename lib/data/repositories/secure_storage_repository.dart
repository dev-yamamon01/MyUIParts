import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_repository.g.dart';

@riverpod
class SecureStorageRepository extends _$SecureStorageRepository {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  // キー定義
  static const String keyAnimationType = 'dialog_animation_type';

  @override
  void build() {
    // 初期化処理（必要に応じて）
  }

  /// 文字列を保存
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      // エラーハンドリング
      throw Exception('Failed to write to secure storage: $e');
    }
  }

  /// 文字列を取得
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      // エラーハンドリング
      return null;
    }
  }

  /// 特定のキーを削除
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      // エラーハンドリング
      throw Exception('Failed to delete from secure storage: $e');
    }
  }

  /// すべてのデータを削除
  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      // エラーハンドリング
      throw Exception('Failed to clear secure storage: $e');
    }
  }
}