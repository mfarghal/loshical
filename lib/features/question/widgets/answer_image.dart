import 'package:flutter/material.dart';
import 'package:loshical/core/widgets/hugged_child.dart';
import 'package:loshical/features/question/domain/entities/answer_asset_entity.dart';

class AnswerImage extends StatelessWidget {
  const AnswerImage({super.key, required this.entity});
  final AnswerAssetEntity entity;
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: entity,
      feedback: HuggedChild(child: Image.asset(entity.assetPath)),
      child: HuggedChild(child: Image.asset(entity.assetPath)),
    );
  }
}
