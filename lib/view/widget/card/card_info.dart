import 'package:flutter/material.dart';

import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class ProviderCardInfo extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCardInfo({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                provider.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: ApplicationColors.primaryText,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (provider.isVerified)
              const Icon(Icons.verified, color: ApplicationColors.accent, size: 20),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: ApplicationColors.lightGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            provider.workplace != null && provider.workplace!.isNotEmpty
                ? '${provider.category} @ ${provider.workplace}'
                : provider.category,
            style: const TextStyle(
              fontSize: 14,
              color: ApplicationColors.secondaryText,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}