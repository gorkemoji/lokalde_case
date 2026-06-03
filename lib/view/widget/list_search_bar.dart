import 'package:flutter/material.dart';
import 'package:lokalde_case/constant/application_colors.dart';

class ListSearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const ListSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ApplicationColors.lightGrey),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search doctors, specialties, or clinics',
          hintStyle: const TextStyle(
            color: ApplicationColors.secondaryText,
            fontSize: 16,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: ApplicationColors.accent,
            size: 24,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}