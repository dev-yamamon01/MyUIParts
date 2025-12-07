import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_ui_parts/core/utils/dialog_utils.dart';

part 'animation_setting_state.freezed.dart';

@freezed
class AnimationSettingState with _$AnimationSettingState {
  const factory AnimationSettingState({
    required DialogAnimationType selectedType,
    required bool isLoading,
  }) = _AnimationSettingState;

  factory AnimationSettingState.initial() => const AnimationSettingState(
        selectedType: DialogAnimationType.zoom,
        isLoading: true,
      );
}