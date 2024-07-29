import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const InputText({
    super.key,
    this.label,
    this.hint,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: const TextStyle(fontSize: 16),
          ),
        if (label != null) const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null
                ? Icon(
                    icon,
                    color: const Color(0xFF2A024B),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
