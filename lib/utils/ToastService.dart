import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastService {
  static void showSuccessToast(BuildContext context, String title, String description) {
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text('Hello, World!'),
      // you can also use RichText widget for title and description parameters
      description: RichText(text: const TextSpan(text: 'This is a sample toast message. ')),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      // animationBuilder: (context, animation, alignment, child) {
      //   return FadeTransition(
      //     turns: animation,
      //     opacity: null,
      //     child: child,
      //   );
      // },
      icon: const Icon(Icons.check),
      showIcon: true, // show or hide the icon
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
      ),
    );
  }

  static void showErrorToast(BuildContext context, String title, String description) {
    // showToastification(
    //   context: context,
    //   title: title,
    //   description: description,
    //   type: ToastificationType.error,
    // );
  }
}
