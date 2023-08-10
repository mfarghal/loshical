import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loshical/assets.dart';

import '../../../../core/provider/result_provider.dart';

class ResultScreen extends ConsumerWidget {
  static const routeName = '/result';

  //
  const ResultScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.read(resultProvider.notifier).result;
    final isCorrectAnswer = result?.success ?? false;
    final assetPath = result
        ?.assetPath; // or AssetManager.path(id: int.tryParse(id) ?? -1 , assetType: AssetType.answer)

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  _message(isCorrectAnswer, context),
                  if (assetPath != null) Image.asset(assetPath)
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () => ref.read(resultProvider).result = null,
            child: const Text("Reset Game"),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _message(bool isCorrectAnswer, BuildContext context) => isCorrectAnswer
      ? Text(
          "Congratulations",
          style: Theme.of(context).textTheme.headlineLarge,
        )
      : Text(
          "GAME OVER",
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.red),
        );
}
