import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String headerName;
  final VoidCallback? onBackPress;
  final bool showBackIcon;
  final Color backgroundColor;
  final Color textColor;

  const Header({
    super.key,
    required this.headerName,
    this.onBackPress,
    this.showBackIcon = true,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackIcon)
            GestureDetector(
              onTap: () {
                if (onBackPress != null) {
                  onBackPress!();
                } else {
                  Navigator.of(context).pop(); // Default go back
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: const Icon(Icons.arrow_back, size: 24),
              ),
            )
          else
            const SizedBox(width: 50), // Placeholder for alignment
          Expanded(
            child: Text(
              headerName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 50), // Placeholder for symmetry
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(toolbarHeight: 0), // Hide default AppBar
//         body: Header(
//           headerName: 'Home Page',
//           onBackPress: () {
//             print('Back button pressed');
//           },
//           backgroundColor: Colors.white,
//           textColor: Colors.blue,
//         ),
//       ),
//     );
//   }
// }