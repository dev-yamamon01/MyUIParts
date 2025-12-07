import 'package:flutter/material.dart';
import '../../core/utils/dialog_utils.dart';

class CustomRadioListTileGroup extends StatelessWidget {
  final List<DialogAnimationType> types;
  final DialogAnimationType selectedType;
  final Future<void> Function(DialogAnimationType) onChanged;
  final String Function(DialogAnimationType) getTitle;
  final String Function(DialogAnimationType) getSubtitle;

  const CustomRadioListTileGroup({
    super.key,
    required this.types,
    required this.selectedType,
    required this.onChanged,
    required this.getTitle,
    required this.getSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < types.length; i++) ...[
          RadioListTile<DialogAnimationType>(
            title: Text(getTitle(types[i])),
            subtitle: Text(getSubtitle(types[i])),
            value: types[i],
            groupValue: selectedType,
            onChanged: (type) async {
              if (type != null) {
                await onChanged(type);
              }
            },
          ),
          if (i < types.length - 1) const Divider(),
        ],
      ],
    );
  }
}
