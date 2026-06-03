import 'package:flutter/material.dart';

import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class ProviderCardAvatar extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCardAvatar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final isDoctor = provider.type == ProviderType.doctor;

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: ApplicationColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E8FF)),
      ),
      child: Icon(
        isDoctor ? Icons.person : Icons.local_hospital,
        color: ApplicationColors.accent,
        size: 32,
      ),
    );
  }
}