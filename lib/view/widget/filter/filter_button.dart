import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onApply;

  const FilterButton({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ApplicationColors.bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              offset: const Offset(0, -2),
              blurRadius: 20,
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: onApply,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 56),
            backgroundColor: ApplicationColors.accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Show Results',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}