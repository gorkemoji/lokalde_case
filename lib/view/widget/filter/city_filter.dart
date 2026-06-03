import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';

class CityFilterSection extends StatelessWidget {
  final TextEditingController controller;

  const CityFilterSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('City', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Container(
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
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Search city...',
              hintStyle: TextStyle(
                color: ApplicationColors.secondaryText,
                fontSize: 16,
              ),
              prefixIcon: Icon(Icons.location_city, color: ApplicationColors.accent),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }
}