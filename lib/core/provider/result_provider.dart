import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/app_result_service.dart';

final appResultService = AppResultService();
final resultProvider =
    ChangeNotifierProvider<AppResultService>((ref) => appResultService);
