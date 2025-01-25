import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../custom/WebViewScreen.dart';

class UrlReplacer {
  // Replace 'http://mediapathurl.com' with 'https://beta.etec.gov.sa:2443'
  static String replaceMediaPath(String inputString) {
    const String oldUrl = 'http://mediapathurl.com';
    const String newUrl = 'https://beta.etec.gov.sa:2443';

    if (inputString.isEmpty || inputString.runtimeType != String) {
      print('Invalid input for replaceMediaPath: Expected a non-empty string');
      return inputString;
    }

    return inputString.replaceAll(RegExp(oldUrl), newUrl);
  }

  // Replace 'http://etecportapp01' with 'https://beta.etec.gov.sa:2443'
  static String replaceEtecPortAppPath(String inputString) {
    const String oldUrl = 'http://etecportapp01';
    const String newUrl = 'https://beta.etec.gov.sa:2443';

    if (inputString.isEmpty || inputString.runtimeType != String) {
      print(
          'Invalid input for replaceEtecPortAppPath: Expected a non-empty string');
      return inputString;
    }

    return inputString.replaceAll(RegExp(oldUrl), newUrl);
  }
}

class WebViewUtils {
  /// Function to handle opening URLs or navigating to a WebView screen
  static Future<void> pressLink(String url, BuildContext context) async {
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
                Clipboard.setData(ClipboardData(
                    text: "URL: $url\nError: ${error.toString()}"));
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
}
