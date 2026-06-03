import 'package:flutter/material.dart';

import '../../../constant/application_colors.dart';

class ProviderCardButton extends StatelessWidget {
  const ProviderCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ApplicationColors.accent.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: ApplicationColors.accent,
          size: 16,
        ),
      ),
    );
  }
}