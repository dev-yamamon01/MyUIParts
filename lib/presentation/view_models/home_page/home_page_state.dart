import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_ui_parts/data/models/product.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.defaultState() = _DefaultState;
  const factory HomePageState.loading() = _Loading;
  const factory HomePageState.error(String message) = _Error;
  const factory HomePageState.purchased(Product product) = _Purchased;
}