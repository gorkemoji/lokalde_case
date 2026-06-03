import 'package:flutter/material.dart';
import 'package:lokalde_case/view/widget/detail/provider_contact_row.dart';
import '../../../constant/application_colors.dart';

class ProviderContactSection extends StatelessWidget {
  final String? phone;
  final String? email;

  const ProviderContactSection({super.key, this.phone, this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ApplicationColors.primaryText)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ApplicationColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ApplicationColors.lightGrey),
          ),
          child: Column(
            children: [
              ProviderContactRow(
                icon: Icons.phone,
                text: (phone != null && phone!.trim().isNotEmpty) ? phone! : 'No phone info.',
              ),
              const Divider(height: 32),
              ProviderContactRow(
                icon: Icons.email,
                text: (email != null && email!.trim().isNotEmpty) ? email! : 'No e-mail info.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}