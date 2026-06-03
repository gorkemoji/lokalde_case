import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class ProviderHeaderInfo extends StatelessWidget {
  final ProviderModel provider;
  const ProviderHeaderInfo({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (provider.isVerified)
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.verified, color: ApplicationColors.accent, size: 28),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.5),
            child: Text(
              provider.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ApplicationColors.primaryText,
                  height: 1.2
              ),
            ),
          ),
          const SizedBox(height: 8),
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
              style: const TextStyle(fontSize: 16, color: ApplicationColors.secondaryText),
            ),
          ),
        ],
      ),
    );
  }
}