import 'package:flutter/material.dart';

import '../models/result.dart';

class AppResultService extends ChangeNotifier {
  Result? _result;
  Result? get result => _result;

  ///
  set result(Result? r) {
    _result = r;
    notifyListeners();
  }
}
