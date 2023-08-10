import '../../../../core/models/asset_entity.dart';

class QuestionAssetEntity extends AssetEntity {
  final bool isMissing;
  //
  QuestionAssetEntity({
    required super.id,
    required super.assetPath,
    this.isMissing = false,
  });
}
