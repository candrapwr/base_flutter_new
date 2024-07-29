import 'package:flutter/material.dart';

class GetBtn extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  const GetBtn(
    this.label, {
    super.key,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xFFef6f26),
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}
