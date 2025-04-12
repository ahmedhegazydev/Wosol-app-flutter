import 'package:flutter_apps/NetworkManager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Network/data/tutorial/IntroItem.dart';
import 'TutorialState.dart';

class TutorialNotifier extends StateNotifier<TutorialState> {
  final NetworkManager networkManager = NetworkManager.instance;

  TutorialNotifier() : super(TutorialState()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(isLoading: true);

    try {
      // Fetch text resources
      final fetchedTextResources = await networkManager.fetchTextResources(
        {
          "lang": 'ar',
          "SiteName": 'internalportal',
          "count": 100,
          "IsAsc": false,
          "filterName": 'ScreenName',
          "filterValue": 'Tutorial',
        },
      );

      // Fetch intro data
      final fetchedIntroData = await networkManager.fetchIntroData([1, 2, 3]);

      state = state.copyWith(
        textResources: fetchedTextResources,
        introData: fetchedIntroData,
        isLoading: false,
      );
    } catch (error) {
      print("Error fetching data: $error");
      state = state.copyWith(isLoading: false);
    }
  }

  void updateCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

// Define the provider
final tutorialProvider = StateNotifierProvider<TutorialNotifier, TutorialState>(
  (ref) => TutorialNotifier(),
);


