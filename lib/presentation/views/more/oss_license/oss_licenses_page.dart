import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'misc_oss_license_single_page.dart';
import '../../../view_models/more/oss_license/oss_license_page_view_model.dart';
import '../../../../core/constants/app_color.dart';

class OssLicensesPage extends ConsumerWidget {
  const OssLicensesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ossLicenseAsync = ref.watch(ossLicensePageViewModelProvider);

    return Scaffold(
        appBar: AppBar(
            title: Text('OSSライセンス'),
            centerTitle: true,
        ),
        body: ossLicenseAsync.when(
          data: (state) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (!state.isLoading &&
                    state.hasMore &&
                    scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100) {
                  ref.read(ossLicensePageViewModelProvider.notifier).loadMore();
                }
                return false;
              },
              child: ListView.separated(
                itemCount: state.items.length + (state.hasMore ? 1 : 0),
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  if (index == state.items.length && state.hasMore) {
                    // 最後にローディングインジケーターを表示
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
                    );
                  }
                  final package = state.items[index];
                  return ListTile(
                      title: Text('${package.name} ${package.version}'),
                      subtitle: package.description.isNotEmpty ? Text(
                          package.description) : null,
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () =>
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  MiscOssLicenseSingle(package: package),
                            ),
                          )
                  );
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
          error: (err, stack) => Center(child: Text('Error: $err')),
        )
    );
  }

}

