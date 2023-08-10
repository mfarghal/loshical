import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/core/models/result.dart';
import 'package:loshical/core/provider/result_provider.dart';
import '../../../assets.dart';
import '../../../core/widgets/hugged_child.dart';
import '../domain/entities/question_asset_entity.dart';

import '../../../core/models/asset_entity.dart';

class QuestionImage extends HookConsumerWidget {
  const QuestionImage({super.key, required this.entity});
  final QuestionAssetEntity entity;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool?> accept = useState(null);

    ///
    return HuggedChild(
      child: !entity.isMissing ? _content() : _targetContent(accept, ref),
    );
  }

  Widget _targetContent(ValueNotifier<bool?> accept, WidgetRef ref) =>
      DragTarget<AssetEntity>(
        onLeave: (data) => accept.value = null,
        onAccept: (data) => ref.read(resultProvider.notifier).result = Result(
          id: data.id,
          assetPath: data.assetPath,
          success: data.id == AssetManager.correctAnswerId,
        ),
        //
        onWillAccept: (data) {
          if (data == null) return false;

          //
          final result = data.id == AssetManager.correctAnswerId;
          accept.value = result;
          return true;
        },
        builder: (context, candidateData, rejectedData) {
          final val = accept.value;

          ///
          return _content(val: val);
        },
      );

  Widget _content({
    bool? val,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: val == null
                ? Colors.transparent
                : (val ? Colors.green : Colors.red),
          ),
        ),
        child: Image.asset(entity.assetPath),
      );
}
