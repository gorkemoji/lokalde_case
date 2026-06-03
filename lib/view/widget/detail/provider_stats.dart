import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class ProviderStatsSection extends StatelessWidget {
  final ProviderModel provider;
  const ProviderStatsSection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 24),
            const SizedBox(width: 4),
            Text(
              provider.rating.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(width: 4),
            Text(
              '(${provider.reviewCount} reviews)',
              style: const TextStyle(
                  color: ApplicationColors.secondaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.post_add, color: ApplicationColors.accent, size: 20),
            const SizedBox(width: 4),
            Text(
              '${provider.postCount} posts',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 12,),
            const Icon(Icons.people, color: ApplicationColors.accent, size: 20),
            const SizedBox(width: 4),
            Text(
              '${provider.followCount} followers',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: ApplicationColors.accent, size: 20),
            const SizedBox(width: 4),
            Text(
              '${provider.city}, ${provider.country}',
              style: const TextStyle(
                  color: ApplicationColors.accent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ],
    );
  }
}