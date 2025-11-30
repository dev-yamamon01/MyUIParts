import 'package:flutter/material.dart';
import '../../data/models/listview_item_model.dart';
import '../../core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListview extends StatelessWidget {
  final ListViewItem item;

  const CustomListview({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        color: item.color,
        child: InkWell(
          borderRadius: BorderRadius.circular(12), // 波紋の角丸をCardに合わせる
          onTap: item.onTap,
          child: ListTile(
            leading: Icon(
              item.icon,
              color: item.textColor,
            ),
            title: Text(
              item.title,
              style: TextStyle(color: item.textColor ?? AppColors.text),
            ),
            subtitle: item.subTitle != null
                ? Text(
              item.subTitle!,
              style: TextStyle(color: item.textColor ?? AppColors.text),
            )
                : null,
            trailing: item.isArrowDisable == true
                ? null
                : const Icon(Icons.arrow_forward_ios, size: 16),
            // onTapはInkWell側に移行したためここではnullにする
            onTap: null,
          ),
        ),
      ),
    );
  }
}