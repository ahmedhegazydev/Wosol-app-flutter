import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget? passedIcon;
  final VoidCallback? onPress;
  final String title;
  final TextStyle? textStyle;
  final bool disabled;
  final bool loading;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    this.passedIcon,
    required this.onPress,
    required this.title,
    this.textStyle,
    this.disabled = false,
    this.loading = false,
    this.backgroundColor,
    this.padding,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;
  late Color buttonBackgroundColor;

  @override
  void initState() {
    super.initState();
    buttonBackgroundColor = widget.backgroundColor ?? const Color(0xFF4C3C8D);
  }

  void handlePressIn() {
    if (widget.disabled || widget.loading) return;
    setState(() {
      isPressed = true;
    });
  }

  void handlePressOut() {
    setState(() {
      isPressed = false;
    });
  }

  Color getPressedColor() {
    if (buttonBackgroundColor == Colors.white) {
      return const Color(0xFFE8E6FD);
    } else if (buttonBackgroundColor == Colors.black) {
      return const Color(0xFFF1F1FD);
    } else if (buttonBackgroundColor == const Color(0xFFF1F1FD)) {
      return const Color(0xFF93C7EA);
    } else if (buttonBackgroundColor == const Color(0xFF4C3C8D)) {
      return const Color(0xFF3C3564);
    } else if (buttonBackgroundColor == const Color(0xFFD97706)) {
      return const Color(0xFFD97706);
    } else if (buttonBackgroundColor == const Color(0xFF55BA83)) {
      return const Color(0xFF55BA83);
    }
    return buttonBackgroundColor;
  }

  Color getTextColor() {
    if (buttonBackgroundColor == const Color(0xFFD97706) ||
        buttonBackgroundColor == const Color(0xFF55BA83)) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (!widget.disabled && !widget.loading) ? widget.onPress : null,
      onTapDown: (_) => handlePressIn(),
      onTapUp: (_) => handlePressOut(),
      onTapCancel: handlePressOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: widget.padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isPressed ? getPressedColor() : buttonBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: widget.loading
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: widget.textStyle ??
                  TextStyle(
                    color: getTextColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(width: 8),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ],
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: widget.textStyle ??
                  TextStyle(
                    color: getTextColor(),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            if (widget.passedIcon != null) ...[
              const SizedBox(width: 8),
              widget.passedIcon!,
            ],
          ],
        ),
      ),
    );
  }
}


// CustomButton(
// title: 'Click Me',
// onPress: () {
// print('Button Pressed');
// },
// loading: false,
// disabled: false,
// passedIcon: Icon(Icons.check, color: Colors.white),
// backgroundColor: Colors.purple,
// );
