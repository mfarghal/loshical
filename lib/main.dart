import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/navigations/router_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Loshical(),
    ),
  );
}

class Loshical extends ConsumerWidget {
  const Loshical({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.read(routerProvider);

    return MaterialApp.router(
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}
