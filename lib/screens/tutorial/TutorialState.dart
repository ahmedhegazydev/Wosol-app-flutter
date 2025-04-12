import 'package:flutter/material.dart';

import '../../Network/data/tutorial/IntroItem.dart';
import '../../Network/data/tutorial/ItemTutorial.dart';

class TutorialState {
  final bool isLoading;

  // final Map<String, dynamic>? textResources;
  final List<ItemTutorial>? textResources;


  // final IntroItem? introData;
  final Map<int, dynamic>? introData;
  // final List<ItemTutorial>? introData;

  final int currentIndex;
  final PageController pageController;

  TutorialState({
    this.isLoading = true,
    this.textResources,
    this.introData,
    this.currentIndex = 0,
    PageController? pageController,
  }) : pageController = pageController ?? PageController(initialPage: 0);

  TutorialState copyWith({
    bool? isLoading,
    // Map<String, dynamic>? textResources,
    List<ItemTutorial>? textResources,

    // IntroItem? introData,
    Map<int, dynamic>? introData,
    // List<ItemTutorial>? introData,

    int? currentIndex,
    PageController? pageController,
  }) {
    return TutorialState(
      isLoading: isLoading ?? this.isLoading,
      textResources: textResources ?? this.textResources,
      introData: introData ?? this.introData,
      currentIndex: currentIndex ?? this.currentIndex,
      pageController: pageController ?? this.pageController,
    );
  }
}
