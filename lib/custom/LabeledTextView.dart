import 'package:flutter/material.dart';

class LabeledTextView extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String? selectedValue;
  final String placeholder;
  final VoidCallback? onPress;
  final Color arrowFillColor;
  final bool showDropdown;
  final TextStyle? containerStyle;
  final TextStyle? inputStyle;
  final TextStyle? labelStyle;
  final bool dimmed;
  final bool loading;

  const LabeledTextView({
    Key? key,
    required this.label,
    this.isRequired = false,
    this.selectedValue,
    this.placeholder = "اختر",
    this.onPress,
    this.arrowFillColor = const Color(0xFF4C3C8D),
    this.showDropdown = true,
    this.containerStyle,
    this.inputStyle,
    this.labelStyle,
    this.dimmed = false,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              label,
              style: labelStyle ??
                  const TextStyle(
                    color: Color(0xFF4C3C8D),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            if (isRequired)
              const Text(
                '*',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        const SizedBox(height: 8),

        // Content or Loader
        loading
            ? Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFF1FAFF),
            borderRadius: BorderRadius.circular(16),
          ),
        )
            : GestureDetector(
          onTap: onPress,
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: dimmed ? const Color(0xFFEFF0F3) : const Color(0xFFF9F9FE),
              border: Border.all(color: const Color(0xFFD8D9E0), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    selectedValue ?? placeholder,
                    style: inputStyle ??
                        TextStyle(
                          color: selectedValue != null
                              ? const Color(0xFF4C3C8D)
                              : const Color(0xFF7F818C),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                if (showDropdown)
                  Icon(
                    Icons.arrow_drop_down,
                    size: 23,
                    color: arrowFillColor,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
