import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}