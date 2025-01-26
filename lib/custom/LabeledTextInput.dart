import 'package:flutter/material.dart';

import '../utils/FontStyle.dart';

// class LabeledTextInput extends StatefulWidget {
//   final String? label;
//   final String? value;
//   final String? placeholder;
//   final bool isRequired;
//   final Color placeholderTextColor;
//   final String? currencySymbol;
//   final TextStyle? containerStyle;
//   final TextStyle? inputStyle;
//   final TextStyle? labelStyle;
//   final Function(String)? onChangeText;
//   final bool secureTextEntry;
//   final bool editable;
//
//   const LabeledTextInput({
//     super.key,
//     this.label,
//     this.value,
//     this.placeholder,
//     this.isRequired = false,
//     this.placeholderTextColor = const Color(0xFFCDCED7),
//     this.currencySymbol,
//     this.containerStyle,
//     this.inputStyle,
//     this.labelStyle,
//     this.onChangeText,
//     this.secureTextEntry = false,
//     this.editable = true,
//   });
//
//   @override
//   State<LabeledTextInput> createState() => _LabeledTextInputState();
// }
//
// class _LabeledTextInputState extends State<LabeledTextInput> {
//   late FocusNode _focusNode;
//   bool isFocused = false;
//   bool hidePassword = false;
//   late TextEditingController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     hidePassword = widget.secureTextEntry;
//     _focusNode = FocusNode();
//     _controller = TextEditingController(text: widget.value);
//
//     _focusNode.addListener(() {
//       setState(() {
//         isFocused = _focusNode.hasFocus;
//       });
//     });
//   }
//
//   @override
//   void didUpdateWidget(covariant LabeledTextInput oldWidget) {
//     super.didUpdateWidget(oldWidget);
//
//     if (widget.value != oldWidget.value && widget.value != _controller.text) {
//       _controller.text = widget.value ?? '';
//     }
//   }
//
//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.label != null)
//           Row(
//             children: [
//               Text(
//                 widget.label!,
//                 style: widget.labelStyle ??
//                     TextStyle(
//                       color: Color(0xFF4C3C8D),
//                       fontFamily: Fonts.contentRegular16.fontFamily,
//                       fontSize: Fonts.contentRegular16.fontSize,
//                       height: Fonts.contentRegular16.lineHeight /
//                           Fonts.contentRegular16.fontSize,
//                       fontWeight: Fonts.contentRegular16.fontWeight,
//                     ),
//               ),
//               if (widget.isRequired)
//                 const Text(
//                   '*',
//                   style: TextStyle(color: Colors.red),
//                 ),
//             ],
//           ),
//         const SizedBox(height: 8),
//         Container(
//           height: 50,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF9F9FE),
//             border: Border.all(color: const Color(0xFFD8D9E0), width: 1),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               if (!isFocused && _controller.text.isEmpty)
//                 Text(
//                   widget.placeholder ?? '',
//                   style: TextStyle(
//                     color: widget.placeholderTextColor,
//                     fontFamily: Fonts.contentRegular16.fontFamily,
//                     fontSize: Fonts.contentRegular16.fontSize,
//                     height: Fonts.contentRegular16.lineHeight /
//                         Fonts.contentRegular16.fontSize,
//                     fontWeight: Fonts.contentRegular16.fontWeight,
//                   ),
//                 )
//               ,
//               // else
//                 Expanded(
//                   child: TextField(
//                     focusNode: _focusNode,
//                     controller: _controller,
//                     onChanged: widget.onChangeText,
//                     obscureText: hidePassword,
//                     enabled: widget.editable,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       isDense: true,
//                     ),
//                     style: widget.inputStyle ??
//                          TextStyle(
//                           color: Color(0xFF4C3C8D),
//                          fontFamily: Fonts.contentRegular16.fontFamily,
// //                     fontSize: Fonts.contentRegular16.fontSize,
// //                     height: Fonts.contentRegular16.lineHeight /
// //                         Fonts.contentRegular16.fontSize,
// //                     fontWeight: Fonts.contentRegular16.fontWeight,
//                         ),
//                   ),
//                 ),
//               if (widget.secureTextEntry)
//                 GestureDetector(
//                   onTap: () {
//                     setState(() => hidePassword = !hidePassword);
//                   },
//                   child: Icon(
//                     hidePassword ? Icons.visibility_off : Icons.visibility,
//                     size: 20,
//                     color: Colors.grey,
//                   ),
//                 )
//               else if (widget.currencySymbol != null)
//                 Text(
//                   widget.currencySymbol!,
//                   style: TextStyle(
//                     color: Color(0xFF6C609D),
//                     fontFamily: Fonts.contentRegular16.fontFamily,
//                     fontSize: Fonts.contentRegular16.fontSize,
//                     height: Fonts.contentRegular16.lineHeight /
//                         Fonts.contentRegular16.fontSize,
//                     fontWeight: Fonts.contentRegular16.fontWeight,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


class LabeledTextInput extends StatefulWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final bool isRequired;
  final Color placeholderTextColor;
  final String? currencySymbol;
  final TextStyle? containerStyle;
  final TextStyle? inputStyle;
  final TextStyle? labelStyle;
  final Function(String)? onChangeText;
  final bool secureTextEntry;
  final bool editable;

  const LabeledTextInput({
    super.key,
    this.label,
    this.value,
    this.placeholder,
    this.isRequired = false,
    this.placeholderTextColor = const Color(0xFFCDCED7),
    this.currencySymbol,
    this.containerStyle,
    this.inputStyle,
    this.labelStyle,
    this.onChangeText,
    this.secureTextEntry = false,
    this.editable = true,
  });

  @override
  State<LabeledTextInput> createState() => _LabeledTextInputState();
}

class _LabeledTextInputState extends State<LabeledTextInput> {
  late TextEditingController _controller;
  bool hidePassword = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    hidePassword = widget.secureTextEntry;
  }

  @override
  void didUpdateWidget(covariant LabeledTextInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != oldWidget.value && widget.value != _controller.text) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Text(
                  widget.label!,
                  style: widget.labelStyle ??
                      TextStyle(
                        color: const Color(0xFF4C3C8D),
                        fontFamily: Fonts.contentRegular16.fontFamily,
                        fontSize: Fonts.contentRegular16.fontSize,
                        height: Fonts.contentRegular16.lineHeight /
                            Fonts.contentRegular16.fontSize,
                        fontWeight: Fonts.contentRegular16.fontWeight,
                      ),
                ),
                if (widget.isRequired)
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        TextField(
          controller: _controller,
          obscureText: hidePassword,
          enabled: widget.editable,
          onChanged: widget.onChangeText,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              color: widget.placeholderTextColor,
              fontFamily: Fonts.contentRegular16.fontFamily,
              fontSize: Fonts.contentRegular16.fontSize,
              height:
              Fonts.contentRegular16.lineHeight / Fonts.contentRegular16.fontSize,
              fontWeight: Fonts.contentRegular16.fontWeight,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 10.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD8D9E0), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD8D9E0), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF4C3C8D), width: 1),
            ),
            suffixIcon: widget.secureTextEntry
                ? GestureDetector(
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              child: Icon(
                hidePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey,
              ),
            )
                : widget.currencySymbol != null
                ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                widget.currencySymbol!,
                style: TextStyle(
                  color: const Color(0xFF6C609D),
                  fontFamily: Fonts.contentRegular16.fontFamily,
                  fontSize: Fonts.contentRegular16.fontSize,
                  height: Fonts.contentRegular16.lineHeight /
                      Fonts.contentRegular16.fontSize,
                  fontWeight: Fonts.contentRegular16.fontWeight,
                ),
              ),
            )
                : null,
          ),
          style: widget.inputStyle ??
               TextStyle(
                color: const Color(0xFF6C609D),
                fontFamily: Fonts.contentRegular16.fontFamily,
                fontSize: Fonts.contentRegular16.fontSize,
                height: Fonts.contentRegular16.lineHeight /
                    Fonts.contentRegular16.fontSize,
                fontWeight: Fonts.contentRegular16.fontWeight,
              ),
        ),
      ],
    );
  }
}
