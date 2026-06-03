import 'package:flutter/material.dart';

import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class ProviderCardStats extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCardStats({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 16),
            const SizedBox(width: 4),
            Text(
              provider.rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600, color: ApplicationColors.primaryText),
            ),
            const SizedBox(width: 4),
            Text(
              '(${provider.reviewCount} reviews)',
              style: const TextStyle(
                  color: ApplicationColors.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.location_on, color: ApplicationColors.accent, size: 16),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '${provider.city}, ${provider.country}',
                style: const TextStyle(color: ApplicationColors.accent, fontSize: 14, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}