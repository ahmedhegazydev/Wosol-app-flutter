import 'package:flutter/material.dart';

class AllowanceItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final String value;
  final bool withCurrency;
  final TextStyle? textStyle;
  final BoxDecoration? containerDecoration;

  const AllowanceItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.withCurrency = false,
    this.textStyle,
    this.containerDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$label: $value${withCurrency ? ' ريال' : ''}',
              style: textStyle ?? const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// AllowanceItem(
// icon: Icon(Icons.money, size: 15),
// label: 'Allowance 1',
// value: '1000',
// withCurrency: true,
// containerDecoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(10),
// border: Border.all(color: Colors.grey),
// ),
// textStyle: const TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.bold,
// color: Colors.black,
// ),
// ),