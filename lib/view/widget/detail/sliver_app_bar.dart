import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class DetailSliverAppBar extends StatelessWidget {
  final ProviderModel provider;

  const DetailSliverAppBar({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final isDoctor = provider.type == ProviderType.doctor;
    final hasImage = provider.imagePath != null && provider.imagePath!.isNotEmpty;

    return SliverAppBar(
      expandedHeight: 180.0,
      pinned: true,
      backgroundColor: ApplicationColors.bgColor,
      iconTheme: const IconThemeData(color: ApplicationColors.primaryText),
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (hasImage)
              Image.asset(
                provider.imagePath!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: ApplicationColors.lightGrey,
                    child: Center(
                      child: Icon(
                        isDoctor ? Icons.person : Icons.local_hospital,
                        size: 80,
                        color: ApplicationColors.accent.withValues(alpha: 0.3),
                      ),
                    ),
                  );
                },
              )
            else
              Container(
                color: ApplicationColors.lightGrey,
                child: Center(
                  child: Icon(
                    isDoctor ? Icons.person : Icons.local_hospital,
                    size: 80,
                    color: ApplicationColors.accent.withValues(alpha: 0.3),
                  ),
                ),
              ),

            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.5),
                    Colors.transparent,
                    ApplicationColors.bgColor.withValues(alpha: 0.2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}