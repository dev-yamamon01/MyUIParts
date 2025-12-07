// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productListHash() => r'9c3c1fd0e8984a721ffecb070841e6f28b2ef788';

/// See also [productList].
@ProviderFor(productList)
final productListProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  productList,
  name: r'productListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductListRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$homePageViewModelHash() => r'162d4b47a685ffd86ce1d551395f933f59ccc047';

/// See also [HomePageViewModel].
@ProviderFor(HomePageViewModel)
final homePageViewModelProvider =
    AutoDisposeNotifierProvider<HomePageViewModel, HomePageState>.internal(
      HomePageViewModel.new,
      name: r'homePageViewModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$homePageViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HomePageViewModel = AutoDisposeNotifier<HomePageState>;
String _$carouselPageIndexHash() => r'ff206cde4e8823ea113091814c4a1c1194078634';

/// See also [CarouselPageIndex].
@ProviderFor(CarouselPageIndex)
final carouselPageIndexProvider =
    AutoDisposeNotifierProvider<CarouselPageIndex, int>.internal(
      CarouselPageIndex.new,
      name: r'carouselPageIndexProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$carouselPageIndexHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CarouselPageIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
