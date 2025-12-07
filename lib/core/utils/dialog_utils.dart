import 'package:flutter/material.dart';
import 'package:my_ui_parts/presentation/components/alert_info_dialog.dart';
import 'package:my_ui_parts/core/utils/secure_storage_helper.dart';
import 'package:my_ui_parts/core/utils/animation_utils.dart';

enum DialogAnimationType {
  zoom,
  slide,
  rotate,
}

class DialogUtils {
  static final DialogUtils _instance = DialogUtils._internal(); //クラス唯一のインスタンスを保持する
  factory DialogUtils() => _instance; //既存の_instanceを返す
  DialogUtils._internal(); //プライベートコンストラクタ(外部から直接呼び出し禁止)

  static Future<void> showAnimationDialog({
    required BuildContext context,
    String title='お知らせ',
    String content = 'これはダイアログです',
    String buttonText = '閉じる',
    VoidCallback? onButtonPressed,
    bool isSuccess = false,
    bool isError = false,
  }) async {
    // SecureStorageに保存したアニメーション設定値によって表示アニメーションを切り替える
    final animationType = await SecureStorageHelper().getDialogAnimationType();

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) {
        final dialog = AlertInfoDialog(
          title: title,
          content: content,
          buttonText: buttonText,
          onButtonPressed: onButtonPressed,
          isSuccess: isSuccess,
          isError: isError,
        );

        // animationTypeに応じてアニメーションを切り替える
        switch (animationType) {
          case DialogAnimationType.zoom:
            return AnimationUtils.buildZoomAnimation(child: dialog);
          case DialogAnimationType.slide:
            return AnimationUtils.buildSlideAnimation(child: dialog);
          case DialogAnimationType.rotate:
            return AnimationUtils.buildRotateAnimation(child: dialog);
        }
      },
    );
  }

}