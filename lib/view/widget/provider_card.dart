import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lokalde_case/constant/application_colors.dart';
import '../../../model/provider_model.dart';
import '../screen/detail/detail_screen.dart';
import 'card/card_avatar.dart';
import 'card/card_button.dart';
import 'card/card_info.dart';
import 'card/card_stats.dart';

class ProviderCard extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProviderDetailScreen(provider: provider),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ApplicationColors.accent.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProviderCardAvatar(provider: provider),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProviderCardInfo(provider: provider),
                      const SizedBox(height: 8),
                      ProviderCardStats(provider: provider),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ProviderCardButton(),
          ],
        ),
      ).animate().fade(duration: 400.ms).slideY(begin: 0.1, end: 0),
    );
  }
}