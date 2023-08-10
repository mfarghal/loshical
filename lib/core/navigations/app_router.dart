import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/question/presentation/pages/question_screen.dart';
import '../../features/result/presentation/pages/result_screen.dart';
import '../provider/result_provider.dart';

final _key = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _key,
  refreshListenable: appResultService,
  debugLogDiagnostics: false,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: QuestionScreen.routeName,
      builder: (context, state) => QuestionScreen(key: state.pageKey),
    ),
    GoRoute(
      path: '/result/:id',
      name: ResultScreen.routeName,
      builder: (context, state) => ResultScreen(
          key: state.pageKey, id: state.pathParameters['id'] ?? ''),
    ),
  ],
  redirect: (context, state) {
    final questionLocation = state.namedLocation(QuestionScreen.routeName);

    ///
    final result = appResultService.result;
    if (result != null) {
      final resultLocation = state.namedLocation(ResultScreen.routeName,
          pathParameters: {'id': '${result.id}'});
      return resultLocation;
    }

    //
    return questionLocation;
  },
);
