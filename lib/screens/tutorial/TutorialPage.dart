import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom/CustomNetworkImage.dart';

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
