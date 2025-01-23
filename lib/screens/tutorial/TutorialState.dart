import 'package:flutter/material.dart';

class TutorialState {
  final bool isLoading;
  final Map<String, dynamic>? textResources;
  final Map<int, dynamic>? introData;
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
    Map<String, dynamic>? textResources,
    Map<int, dynamic>? introData,
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
