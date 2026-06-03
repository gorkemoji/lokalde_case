import 'package:flutter/material.dart';
import 'package:lokalde_case/view/widget/detail/header_info.dart';
import 'package:lokalde_case/view/widget/detail/provider_about.dart';
import 'package:lokalde_case/view/widget/detail/provider_contact.dart';
import 'package:lokalde_case/view/widget/detail/provider_stats.dart';
import 'package:lokalde_case/view/widget/detail/sliver_app_bar.dart';
import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class ProviderDetailScreen extends StatelessWidget {
  final ProviderModel provider;
  const ProviderDetailScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.bgColor,
      body: CustomScrollView(
        slivers: [
          DetailSliverAppBar(type: provider.type),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 32.0,
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0
              ),
              decoration: const BoxDecoration(
                color: ApplicationColors.bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProviderHeaderInfo(provider: provider),
                  const SizedBox(height: 16),

                  ProviderStatsSection(provider: provider),
                  const SizedBox(height: 16),

                  const Divider(),
                  const SizedBox(height: 16),

                  ProviderAboutSection(bio: provider.bio),
                  const SizedBox(height: 16),

                  const Divider(),
                  const SizedBox(height: 16),

                  ProviderContactSection(
                    phone: provider.phone,
                    email: provider.email,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}