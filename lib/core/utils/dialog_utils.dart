import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ui_parts/presentation/components/alert_info_dialog.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils._internal();

  factory DialogUtils() => _instance;

  DialogUtils._internal();

  static void showAnimationDialog({
    required BuildContext context,
    String title='お知らせ',
    String content = 'これはダイアログです',
    String buttonText = '閉じる',
    VoidCallback? onButtonPressed,
    bool isSuccess = false,
    bool isError = false
  }){

    showDialog(
      context: context,
      builder: (context) {
        //TODO:ここをアニメーション設定値によって返すものを変える
        //Zoom, Slide, Rotate
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: AnimationController(
              duration: const Duration(milliseconds: 600),
              vsync: Navigator.of(context),
            )..forward(),
            curve: Curves.easeOut,
          ),
            child: AlertInfoDialog(
              title: title,
              content: content,
              buttonText: buttonText,
              onButtonPressed: onButtonPressed,
              isSuccess: isSuccess,
              isError: isError,
            )
        );
      },
    );
  }

}