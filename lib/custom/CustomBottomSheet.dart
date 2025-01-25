import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  final String? title;
  final Widget? child;
  final double height;
  final Duration openDuration;
  final VoidCallback? onClose;
  final TextStyle? titleStyle;
  final BoxDecoration? containerDecoration;
  final bool showCloseIcon;
  final bool dismissible;

  const BottomSheetWidget({
    super.key,
    this.title,
    this.child,
    this.height = 620,
    this.openDuration = const Duration(milliseconds: 250),
    this.onClose,
    this.titleStyle,
    this.containerDecoration,
    this.showCloseIcon = true,
    this.dismissible = true,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  bool _isVisible = false;

  void open() {
    setState(() {
      _isVisible = true;
    });
    showModalBottomSheet(
      context: context,
      isDismissible: widget.dismissible,
      enableDrag: widget.dismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return _buildBottomSheetContent();
      },
    ).whenComplete(() {
      setState(() {
        _isVisible = false;
      });
      if (widget.onClose != null) widget.onClose!();
    });
  }

  void close() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(); // Empty widget to provide functionality for open and close
  }

  Widget _buildBottomSheetContent() {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: widget.containerDecoration ??
          const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
      child: Column(
        children: [
          // Top Bar Indicator
          const SizedBox(height: 16),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFDDDBFA),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 10),

          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Close Icon
              if (widget.showCloseIcon)
                IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  onPressed: close,
                )
              else
                const SizedBox(width: 48), // Placeholder for alignment

              // Title
              if (widget.title != null)
                Expanded(
                  child: Text(
                    widget.title!,
                    style: widget.titleStyle ??
                        const TextStyle(
                          color: Color(0xFF4C3C8D),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'IBM Plex Sans Arabic',
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              else
                const Spacer(),
            ],
          ),

          const SizedBox(height: 10),

          // Content Section
          Expanded(
            child: widget.child ?? const SizedBox(),
          ),
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
//         appBar: AppBar(title: const Text('Bottom Sheet Example')),
//         body: Center(
//           child: Builder(
//             builder: (context) {
//               final BottomSheetWidget bottomSheet = BottomSheetWidget(
//                 title: "Bottom Sheet Title",
//                 child: const Text("This is the content of the bottom sheet."),
//                 onClose: () {
//                   print("Bottom sheet closed");
//                 },
//               );
//
//               return ElevatedButton(
//                 onPressed: () {
//                   bottomSheet.open();
//                 },
//                 child: const Text("Open Bottom Sheet"),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
