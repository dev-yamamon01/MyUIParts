import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'oss_licenses.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../data/models/oss_license/package_state.dart';
import 'package:flutter/foundation.dart';

part 'oss_license_page_view_model.g.dart';

@riverpod
class OssLicensePageViewModel extends _$OssLicensePageViewModel {
  int _offset = 0;
  final int _limit = 20;

  @override
  FutureOr<PackageState> build() async {
    final firstItems = await _loadNext();
    return PackageState(items: firstItems, isLoading: false, hasMore: true, page: 1);
  }

  Future<void> loadMore() async {
    // 現在の状態を取得
    final current = state.value;

    // 読み込み中、またはもう読み込むものがなければ早期リターン
    if (current == null || current.isLoading || !current.hasMore) return;

    // 読み込み開始フラグを立てる
    state = AsyncData(current.copyWith(isLoading: true));

    // 次ページを取得
    final newItems = await _loadNext();

    // 新しい状態をセット
    state = AsyncData(
      current.copyWith(
        items: [...current.items, ...newItems],
        isLoading: false,
        hasMore: newItems.isNotEmpty, // 新規取得がなければもう読み込みなし
        page: current.page + 1,
      ),
    );
  }

  Future<List<Package>> _loadNext() async {
    final result = await LicenseRepository.loadLicenses(offset: _offset, limit: _limit);
    _offset += result.length;
    return result;
  }
}



class LicenseRepository {
  static List<Package>? _cachedLicenses;

  static Future<void> _initializeCache() async {
    if (_cachedLicenses != null) return; // すでにキャッシュ済み

    final lm = <String, List<String>>{};
    await for (var l in LicenseRegistry.licenses) {
      for (var p in l.packages) {
        final lp = lm.putIfAbsent(p, () => []);
        lp.addAll(l.paragraphs.map((p) => p.text));
      }
    }

    final licenses = allDependencies.toList();

    for (var key in lm.keys) {
      licenses.add(
        Package(
            name: key,
            description: '',
            authors: [],
            isMarkdown: false,
            isSdk: false,
            dependencies: [],
            devDependencies: []
        )
      );
    }

    _cachedLicenses = licenses;
  }

  static Future<List<Package>> loadLicenses({
    int offset = 0,
    int limit = 20,
  }) async {
    await _initializeCache();

    final licenses = _cachedLicenses!;

    if (offset >= licenses.length) return [];

    final end = (offset + limit) > licenses.length ? licenses.length : (offset + limit);

    return licenses.sublist(offset, end);
  }
}