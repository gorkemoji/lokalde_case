import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';

class ProviderAboutSection extends StatelessWidget {
  final String? bio;
  const ProviderAboutSection({super.key, this.bio});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('About', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ApplicationColors.primaryText)),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ApplicationColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ApplicationColors.lightGrey),
          ),
          child: Text(
            (bio?.trim().isNotEmpty ?? false) ? bio! : "No about info.",
            style: const TextStyle(fontSize: 16, height: 1.5, color: ApplicationColors.secondaryText),
          ),
        ),
      ],
    );
  }
}