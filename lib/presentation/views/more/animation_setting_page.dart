import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ui_parts/core/utils/dialog_utils.dart';
import 'package:my_ui_parts/presentation/view_models/more/animation_setting/animation_setting_view_model.dart';
import 'package:my_ui_parts/presentation/components/custom_radio_list_tile_group.dart';

class AnimationSettingPage extends ConsumerStatefulWidget {
  const AnimationSettingPage({super.key});

  @override
  ConsumerState<AnimationSettingPage> createState() => _AnimationSettingPageState();
}

class _AnimationSettingPageState extends ConsumerState<AnimationSettingPage> {
  @override
  void initState() {
    super.initState();
    // 初回表示時に設定を読み込む
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(animationSettingViewModelProvider.notifier).loadCurrentSetting();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(animationSettingViewModelProvider);
    final viewModel = ref.read(animationSettingViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('アニメーション設定'),
        centerTitle: true,
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'ダイアログ表示のアニメーション',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ダイアログが表示される際のアニメーションを選択してください',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                CustomRadioListTileGroup(
                  types: DialogAnimationType.values, //全てのタイプ
                  selectedType: state.selectedType, //現在設定中のタイプ
                  onChanged: (type) async { //選択状態が変化した時
                    await viewModel.changeAnimationType(type);
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('アニメーション設定を${viewModel.getAnimationTypeName(type)}に変更しました'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  getTitle: viewModel.getAnimationTypeName, //type引数は定義側で渡す
                  getSubtitle: viewModel.getAnimationTypeDescription, //type引数は定義側で渡す
                ),
              ],
            ),
    );
  }
}
