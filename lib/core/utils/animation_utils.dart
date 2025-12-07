import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationUtils {
  // アニメーション共通設定
  static const Duration animationDuration = Duration(milliseconds: 600);
  static const Curve animationCurve = Curves.easeOut;

  /// Zoomアニメーション（拡大）
  static Widget buildZoomAnimation({required Widget child}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: animationDuration,
      curve: animationCurve,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// Slideアニメーション（下から上にスライド）
  static Widget buildSlideAnimation({required Widget child}) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(
        begin: const Offset(0, 1),  // 画面下から
        end: Offset.zero,           // 中央へ
      ),
      duration: animationDuration,
      curve: animationCurve,
      builder: (context, offset, child) {
        return Transform.translate(
          offset: Offset(0, offset.dy * MediaQuery.of(context).size.height),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Rotateアニメーション（回転）
  static Widget buildRotateAnimation({required Widget child}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: animationDuration,
      curve: animationCurve,
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 2 * math.pi, // 1回転 (2π)
          child: child,
        );
      },
      child: child,
    );
  }
}