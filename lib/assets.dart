import 'package:loshical/features/question/domain/entities/answer_asset_entity.dart';
import 'package:loshical/features/question/domain/entities/question_asset_entity.dart';

enum AssetType {
  question('q'),
  answer('a');

  const AssetType(this.abbreviation);
  final String abbreviation;
}

class AssetManager {
  static int correctAnswerId = 5;

  static String path({required int id, required AssetType assetType}) {
    return 'assets/${assetType.abbreviation}$id.png';
  }

  static String id({required String path}) {
    return path.split('/').last;
  }

  static const howto = 'assets/howto.png';

  static List<QuestionAssetEntity> get questions => List.generate(
        5,
        (index) => QuestionAssetEntity(
          id: index + 1,
          assetPath: path(
            id: index + 1,
            assetType: AssetType.question,
          ),
          isMissing: index == 1,
        ),
      );

  static List<AnswerAssetEntity> get answers => List.generate(
        5,
        (index) => AnswerAssetEntity(
          id: index + 1,
          assetPath: path(
            id: index + 1,
            assetType: AssetType.answer,
          ),
        ),
      );
}
