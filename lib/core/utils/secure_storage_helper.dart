import 'package:my_ui_parts/core/utils/dialog_utils.dart';
import 'package:my_ui_parts/data/repositories/secure_storage_repository.dart';

class SecureStorageHelper {
  final SecureStorageRepository _repository = SecureStorageRepository();

  /// ダイアログのアニメーションタイプを取得
  Future<DialogAnimationType> getDialogAnimationType() async {
    try {
      final value = await _repository.read(SecureStorageRepository.keyAnimationType);
      if (value == null) return DialogAnimationType.zoom;

      switch (value) {
        case 'zoom':
          return DialogAnimationType.zoom;
        case 'slide':
          return DialogAnimationType.slide;
        case 'rotate':
          return DialogAnimationType.rotate;
        default:
          return DialogAnimationType.zoom;
      }
    } catch (e) {
      return DialogAnimationType.zoom;
    }
  }

  /// ダイアログのアニメーションタイプを保存
  Future<void> setDialogAnimationType(DialogAnimationType type) async {
    try {
      String value;
      switch (type) {
        case DialogAnimationType.zoom:
          value = 'zoom';
          break;
        case DialogAnimationType.slide:
          value = 'slide';
          break;
        case DialogAnimationType.rotate:
          value = 'rotate';
          break;
      }
      await _repository.write(SecureStorageRepository.keyAnimationType, value);
    } catch (e) {
      // エラーハンドリング
      throw Exception('Failed to save animation type: $e');
    }
  }

  /// すべての設定を削除
  Future<void> clearAll() async {
    await _repository.deleteAll();
  }
}