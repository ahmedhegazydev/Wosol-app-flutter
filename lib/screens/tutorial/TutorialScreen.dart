import 'package:flutter/material.dart';
import 'package:flutter_apps/utils/Common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

import '../../custom/CustomButton.dart';
import '../../custom/CustomNetworkImage.dart';
import 'TutorialNotifier.dart';

class TutorialScreen extends ConsumerWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tutorialState = ref.watch(tutorialProvider);
    final tutorialNotifier = ref.read(tutorialProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: Text(
              tutorialState.textResources?['data']?.firstWhere(
                    (item) => item['ItemFields']['TextKey'] == 'Skip',
                    orElse: () => null,
                  )?['ItemFields']['TextValue'] ??
                  'Skip',
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
                  final data = tutorialState.introData?[index + 1]?['data'];
                  if (data == null) {
                    return Center(
                      child: Text(
                        "No data available",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  return TutorialPage(
                    imageUrl: UrlReplacer.replaceMediaPath(
                        data['ItemFields']['IntroIcon']['Url']),
                    title: data['ItemFields']['IntroTitle'] ?? 'No Title',
                    details: data['ItemFields']['IntroDetails'] ?? 'No Details',
                  );
                },
              ),
            ),
            PaginationDots(
              length: tutorialState.introData?.length ?? 3,
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
                  if (tutorialState.currentIndex <
                      (tutorialState.introData?.length ?? 3) - 1) {
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

class TutorialPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String details;

  const TutorialPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomNetworkImage(
            imageUrl: imageUrl,
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 32),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            details,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class PaginationDots extends StatelessWidget {
  final int length;
  final int currentIndex;

  const PaginationDots(
      {super.key, required this.length, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          width: currentIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
