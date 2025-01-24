import 'package:flutter/material.dart';

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
    Key? key,
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
  }) : super(key: key);

  @override
  State<LabeledTextInput> createState() => _LabeledTextInputState();
}

class _LabeledTextInputState extends State<LabeledTextInput> {
  bool isFocused = false;
  bool hidePassword = false;

  @override
  void initState() {
    super.initState();
    hidePassword = widget.secureTextEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Text(
                widget.label!,
                style: widget.labelStyle ??
                    const TextStyle(
                      color: Color(0xFF4C3C8D),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              if (widget.isRequired)
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9FE),
            border: Border.all(color: const Color(0xFFD8D9E0), width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (!isFocused &&
                  (widget.value == null || widget.value!.isEmpty))
                Text(
                  widget.placeholder ?? '',
                  style: TextStyle(
                    color: widget.placeholderTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              Expanded(
                child: TextField(
                  controller: TextEditingController(
                      text: widget.value), // Bind value to TextField
                  onChanged: widget.onChangeText,
                  obscureText: hidePassword,
                  onFocusChange: (focus) => setState(() => isFocused = focus),
                  enabled: widget.editable,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  style: widget.inputStyle ??
                      const TextStyle(
                        color: Color(0xFF4C3C8D),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              if (widget.secureTextEntry)
                GestureDetector(
                  onTap: () {
                    setState(() => hidePassword = !hidePassword);
                  },
                  child: Icon(
                    hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility, // Replace with custom icons if needed
                    size: 20,
                    color: Colors.grey,
                  ),
                )
              else if (widget.currencySymbol != null)
                Text(
                  widget.currencySymbol!,
                  style: const TextStyle(
                    color: Color(0xFF6C609D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}


// LabeledTextInput(
// label: "Password",
// placeholder: "Enter your password",
// secureTextEntry: true,
// isRequired: true,
// onChangeText: (value) {
// print("Password: $value");
// },
// ),