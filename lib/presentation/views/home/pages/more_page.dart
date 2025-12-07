import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../data/models/listview_item_model.dart';
import '../../../components/custom_listview.dart';
import 'package:go_router/go_router.dart';

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: buildMoreListViewItem(context, ref)
          .where((item) => item != null) // null除外
          .map((item) => CustomListview(item: item!)) // !で非null化
          .toList(),
    );
  }

  List<ListViewItem?> buildMoreListViewItem(BuildContext context, WidgetRef ref) {
    return [
      ListViewItem(
        title: 'アニメーション設定',
        icon: Icons.settings,
        color: AppColors.primary,
        onTap: () {
          context.pushNamed('animationSetting');
        },
      ),
      ListViewItem(
        title: 'お問い合わせ',
        icon: Icons.contact_support,
        textColor: Colors.grey,
        color: Colors.white,
        onTap: () {
          context.pushNamed('contact');
        },
      ),
      ListViewItem(
        title: '利用規約',
        icon: Icons.menu_book_rounded,
        textColor: Colors.grey,
        color: Colors.white,
        onTap: () {
          context.pushNamed('terms');
        },
      ),
      ListViewItem(
        title: 'OSSライセンス',
        icon: Icons.library_books,
        textColor: Colors.grey,
        color: Colors.white,
        onTap: () {
          context.pushNamed('ossLicenses');
        },
      ),
      // ListViewItem(
      //   title: 'グレードアップ',
      //   icon: Icons.arrow_circle_up,
      //   color: Colors.transparent,
      //   onTap: () {
      //     context.pushNamed('plan');
      //   },
      // ),

    ];
  }

}