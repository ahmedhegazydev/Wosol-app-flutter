import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'WebViewScreen.dart';

Widget logoView({double width = 150, double? height}) {
  return SvgPicture.asset(
    'assets/icons/etec_logo_splash_screen.svg',
    width: width,
    height: height,
    fit: BoxFit.contain,
  );
}

/// Function to handle opening URLs or navigating to a WebView screen
Future<void> pressLink(String url, BuildContext context) async {
  try {
    final Uri uri = Uri.parse(url);

    // Check if the URL can be opened
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (url.startsWith('http') || url.startsWith('https')) {
      // Navigate to WebViewScreen if URL is valid and cannot be opened externally
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WebViewScreen(url: url)),
      );
    } else {
      // Alert for unsupported URLs
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Unsupported URL'),
          content: Text("Don't know how to open this URL: $url"),
          actions: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: url));
                Navigator.pop(context);
              },
              child: const Text('Copy URL'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  } catch (error) {
    // Error handling
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error Opening URL'),
        content: Text(
          "An error occurred while trying to open the URL: $url\n\nError: ${error.toString()}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(
                  ClipboardData(text: "URL: $url\nError: ${error.toString()}"));
              Navigator.pop(context);
            },
            child: const Text('Copy Error'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}