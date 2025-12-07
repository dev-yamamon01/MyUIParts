import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/product.dart';
import '../../../data/repositories/product_repository.dart';
import 'home_page_state.dart';

part 'home_page_view_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  @override
  HomePageState build() => HomePageState.defaultState();

  //商品を購入するメソッド
  void purchaseProduct({required Product product}) async {
    try {
      state = HomePageState.loading();

      await Future.delayed(Duration(seconds: 3)); //購入処理のダミーとして遅延処理

      state = HomePageState.purchased(product);
    } catch (e, st) {
      state = HomePageState.error(e.toString());
    }
  }
}

// カルーセルのページインデックスを管理するプロバイダー
@riverpod
class CarouselPageIndex extends _$CarouselPageIndex {
  @override
  int build() {
    return 0; // 初期ページインデックス
  }

  void updatePageIndex(int index) {
    state = index;
  }
}

// 商品リストを取得するプロバイダー
@riverpod
Future<List<Product>> productList(ProductListRef ref) async {
  final repository = await ref.watch(productRepositoryProvider.future);
  return repository;
}