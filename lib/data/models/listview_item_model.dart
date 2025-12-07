import 'package:flutter/material.dart';

class ListViewItem {
  final String title;
  final String? subTitle;
  final IconData icon;
  final Color color;
  final Color? textColor;
  final bool? isArrowDisable;
  final VoidCallback onTap;

  ListViewItem({
    required this.title,
    this.subTitle,
    required this.icon,
    required this.color,
    this.textColor,
    this.isArrowDisable,
    required this.onTap,
  });
}