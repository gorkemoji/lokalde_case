import 'package:flutter/material.dart';

import '../../../constant/application_colors.dart';

class ProviderContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProviderContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ApplicationColors.accent, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: ApplicationColors.primaryText, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}