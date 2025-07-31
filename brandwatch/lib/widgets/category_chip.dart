import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
        ),
        selectedColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}