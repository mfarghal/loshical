import 'package:flutter/material.dart';

import '../../../../assets.dart';
import '../../../how/presentation/pages/how_to_play_screen.dart';
import '../../widgets/answer_image.dart';
import '../../widgets/question_image.dart';

class QuestionScreen extends StatelessWidget {
  static const routeName = '/';

  //
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loshical'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => const HowToPlayScreen()));
            },
            icon: const Icon(Icons.info_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Text('Choose the image that completes the pattern: '),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: AssetManager.questions
                    .map(
                      (e) => QuestionImage(
                        entity: e,
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              const Text('Which of the shapes below continues the sequence'),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: AssetManager.answers
                    .map(
                      (e) => AnswerImage(
                        entity: e,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 42,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
