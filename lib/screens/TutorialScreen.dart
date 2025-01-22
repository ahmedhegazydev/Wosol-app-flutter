import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  TutorialScreenState createState() => TutorialScreenState();
}

class TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isLoading = true;

  // Example data for the tutorial
  final List<Map<String, String>> _tutorialData = [
    {
      'imageUrl': 'https://via.placeholder.com/250',
      'title': 'Welcome to the App',
      'details': 'This is the first tutorial page.',
    },
    {
      'imageUrl': 'https://via.placeholder.com/250',
      'title': 'Explore Features',
      'details': 'Learn about the app\'s features here.',
    },
    {
      'imageUrl': 'https://via.placeholder.com/250',
      'title': 'Get Started',
      'details': 'Start using the app now!',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Simulating data fetching
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Skeleton(
        isLoading: _isLoading,
        skeleton: SkeletonListView(),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _tutorialData.length,
                itemBuilder: (context, index) {
                  final data = _tutorialData[index];
                  return TutorialPage(
                    imageUrl: data['imageUrl']!,
                    title: data['title']!,
                    details: data['details']!,
                  );
                },
              ),
            ),
            PaginationDots(
              length: _tutorialData.length,
              currentIndex: _currentIndex,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentIndex < _tutorialData.length - 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  // primary: Colors.blue,
                ),
                child: Text(
                  _currentIndex == _tutorialData.length - 1 ? 'Start' : 'Next',
                ),
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
          Image.network(
            imageUrl,
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

  const PaginationDots({required this.length, required this.currentIndex});

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
