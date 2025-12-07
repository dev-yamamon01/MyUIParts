import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_ui_parts/core/utils/dialog_utils.dart';
import 'package:my_ui_parts/core/utils/secure_storage_helper.dart';
import 'animation_setting_state.dart';

part 'animation_setting_view_model.g.dart';

@riverpod
class AnimationSettingViewModel extends _$AnimationSettingViewModel {
  final SecureStorageHelper _storageHelper = SecureStorageHelper();

  @override
  AnimationSettingState build() {
    return AnimationSettingState.initial();
  }

  /// 現在の設定を読み込む
  Future<void> loadCurrentSetting() async {
    state = state.copyWith(isLoading: true);

    final type = await _storageHelper.getDialogAnimationType();

    state = state.copyWith(
      selectedType: type,
      isLoading: false,
    );
  }

  /// アニメーションタイプを変更
  Future<void> changeAnimationType(DialogAnimationType type) async {
    await _storageHelper.setDialogAnimationType(type);
    state = state.copyWith(selectedType: type);
  }

  /// アニメーションタイプの名前を取得
  String getAnimationTypeName(DialogAnimationType type) {
    switch (type) {
      case DialogAnimationType.zoom:
        return 'ズーム';
      case DialogAnimationType.slide:
        return 'スライド';
      case DialogAnimationType.rotate:
        return '回転';
    }
  }

  /// アニメーションタイプの説明を取得
  String getAnimationTypeDescription(DialogAnimationType type) {
    switch (type) {
      case DialogAnimationType.zoom:
        return '中央から拡大表示されます';
      case DialogAnimationType.slide:
        return '下から上にスライドして表示されます';
      case DialogAnimationType.rotate:
        return '回転しながら表示されます';
    }
  }
}