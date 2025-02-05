import 'package:flutter/material.dart';
import 'package:flutter_apps/utils/HexColor.dart';

import '../utils/FontStyle.dart';

class CustomButton extends StatefulWidget {
  final Widget? passedIcon;
  final VoidCallback? onPress;
  final String title;
  final TextStyle? textStyle;
  final bool disabled;
  final bool loading;
  final String? backgroundColor;
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
  late String buttonBackgroundColor;

  @override
  void initState() {
    super.initState();
    buttonBackgroundColor = widget.backgroundColor ?? "";
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

  String getPressedColor() {
    if (buttonBackgroundColor == '#fff') {
      return "#E8E6FD";
    } else if (buttonBackgroundColor == '#000000') {
      return "#F1F1FD";
    } else if (buttonBackgroundColor == '#F1F1FD') {
      return "#93C7EA";
    } else if (buttonBackgroundColor == '#4C3C8D') {
      return "#3C3564";
    } else if (buttonBackgroundColor == '#D97706') {
      return "#D97706";
    } else if (buttonBackgroundColor == '#55BA83') {
      return "#55BA83";
    }
    return buttonBackgroundColor;
  }

  String getTextColor() {
    if (buttonBackgroundColor == '#D97706' ||
        buttonBackgroundColor == '#55BA83') {
      return "#FFFFFF";
    }
    // return "#000000";
    return "#FFFFFF";
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
        padding: widget.padding ?? const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:
              HexColor(isPressed ? getPressedColor() : buttonBackgroundColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: widget.loading
            ? Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.title,
                    style: widget.textStyle ??
                        TextStyle(
                          color: HexColor(getTextColor()),
                          // fontSize: 16,
                          // fontWeight: FontWeight.w500,
                          fontFamily: Fonts.contentMedium16.fontFamily,
                          fontSize: Fonts.contentMedium16.fontSize,
                          height: Fonts.contentMedium16.lineHeight /
                              Fonts.contentMedium16.fontSize,
                          fontWeight: Fonts.contentMedium16.fontWeight,
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: widget.textStyle ??
                        TextStyle(
                          color: HexColor(getTextColor()),
                          // fontSize: 16,
                          // fontWeight: FontWeight.w500,
                          fontFamily: Fonts.contentMedium16.fontFamily,
                          fontSize: Fonts.contentMedium16.fontSize,
                          height: Fonts.contentMedium16.lineHeight /
                              Fonts.contentMedium16.fontSize,
                          fontWeight: Fonts.contentMedium16.fontWeight,
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
