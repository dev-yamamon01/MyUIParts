import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui_parts/core/constants/app_color.dart';
import 'package:my_ui_parts/core/utils/dialog_utils.dart';
import '../../../components/product_card.dart';
import '../../../view_models/home_page/home_page_view_model.dart';
import '../../../view_models/home_page/home_page_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListAsync = ref.watch(productListProvider);
    // homePageViewModelProviderの状態変化を監視してダイアログを表示するリスナー設定
    _setPurchaseListener(context: context, ref: ref);

    return productListAsync.when(
      data: (products) {
        if (products.isEmpty) {
          return const Center(
            child: Text('商品データがありません'),
          );
        }
        return Center(
          child: CarouselSlider.builder(
            itemCount: products.length,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.8,
              enlargeCenterPage: true, //<--中央のページの拡大表示
              enlargeFactor: 0.5, //<--中央のページが元のサイズの何倍か=>150%
              autoPlay: false, //<--自動スライド
              autoPlayCurve: Curves.fastOutSlowIn, //<--自動スライド時のアニメーションカーブ
              enableInfiniteScroll: true, //<--無限スクロール
              viewportFraction: 0.6, //<--中央のページがどれくらいの割合を占めるか
              onPageChanged: (index, reason) { //<--reasonは手動か自動スライドかなどのページ変更理由
                ref.read(carouselPageIndexProvider.notifier).updatePageIndex(index);
              },
            ),
            itemBuilder: (context, index, realIndex) { //<--realIndexは無限スクロール時用に10000を基準に増減するもの
              final product = products[index];
              return FittedBox( //<--子ウィジットを親ウィジェットに収まるように自動調整する
                fit: BoxFit.contain, // 拡大も縮小もする
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ProductCard(
                    product: product,
                    onPurchase: () {
                      ref.read(homePageViewModelProvider.notifier)
                               .purchaseProduct(product: product);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text('エラーが発生しました: $error'),
      ),
    );
  }

  /// homePageViewModelProviderの状態変化を監視してダイアログを表示するリスナー
  void _setPurchaseListener({required BuildContext context, required WidgetRef ref}){
    ref.listen<HomePageState>(homePageViewModelProvider, (previous, next) {
      next.when(
        defaultState: () {
          // デフォルト状態では何もしない
        },
        loading: () {
          // ローディング状態
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        purchased: (product) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(); //ローディングダイアログを閉じる
          }

          DialogUtils.showAnimationDialog(
              context: context,
              isSuccess: true,
              title: '購入完了',
              content: '${product.title}を購入しました'
          );
        },
        error: (message) {
          // ローディングダイアログを閉じる（もし開いていれば）
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }

          // エラーメッセージを表示
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('エラー: $message'),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });
  }

}