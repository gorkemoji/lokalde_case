import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';

class CountryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const CountryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: ApplicationColors.accent,
      labelStyle: TextStyle(
        color: isSelected ? ApplicationColors.white : ApplicationColors.primaryText,
      ),
      backgroundColor: ApplicationColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      checkmarkColor: Colors.white,
    );
  }
}