import 'package:flutter/material.dart';
import 'package:flutter_apps/Network/data/tutorial/IntroItem.dart' as intro;
import 'package:flutter_apps/Network/data/tutorial/ItemTutorial.dart' as tutorial;
import 'package:flutter_apps/utils/Common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

import '../../custom/CustomButton.dart';
import 'PaginationDots.dart';
import 'TutorialNotifier.dart';
import 'TutorialPage.dart';

class TutorialScreen extends ConsumerWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tutorialState = ref.watch(tutorialProvider);
    final tutorialNotifier = ref.read(tutorialProvider.notifier);

    final textResources = tutorialState.textResources ?? [];
    final skipText = textResources
        .firstWhere(
          (item) => item.itemFields.textKey == 'Skip',
          orElse: () => tutorial.ItemTutorial(
            itemId: 0,
            itemFields: tutorial.ItemFields(
              title: '',
              textKey: 'Skip',
              textValue: 'Skip',
              language: '',
              screenName: [],
              id: 0,
              modified: '',
              created: '',
              order: 0.0,
              guid: '',
            ),
          ),
        )
        .itemFields
        .textValue;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: Text(
              skipText ?? "skipText",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Skeleton(
        isLoading: tutorialState.isLoading,
        skeleton: SkeletonListView(),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: tutorialState.pageController,
                onPageChanged: tutorialNotifier.updateCurrentIndex,
                itemCount: tutorialState.introData?.length ?? 0,
                itemBuilder: (context, index) {
                  final data = tutorialState.introData?[index + 1]?['data']
                      as intro.IntroItem;

                  return TutorialPage(
                    imageUrl: UrlReplacer.replaceMediaPath(
                        data.itemFields.introIcon?.url ?? ""),
                    title: data.itemFields.introTitle ?? "",
                    details: data.itemFields.introDetails ?? "",
                  );
                },
              ),
            ),
            PaginationDots(
              // length: tutorialState.introData?.length ?? 3,
              length: 3,
              currentIndex: tutorialState.currentIndex,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: CustomButton(
                title: tutorialState.currentIndex ==
                        (tutorialState.introData?.length ?? 3) - 1
                    ? 'Start'
                    : 'Next',
                onPress: () {
                  if (tutorialState.currentIndex < 3 - 1) {
                    tutorialState.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                loading: false,
                disabled: false,
                backgroundColor: "#4C3C8D",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
