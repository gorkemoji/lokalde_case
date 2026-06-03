import 'package:flutter/material.dart';
import '../../../constant/application_colors.dart';
import '../../../model/provider_model.dart';

class DetailSliverAppBar extends StatelessWidget {
  final ProviderType type;
  const DetailSliverAppBar({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final isDoctor = type == ProviderType.doctor;

    return SliverAppBar(
      expandedHeight: 150.0,
      pinned: true,
      backgroundColor: ApplicationColors.bgColor,
      iconTheme: const IconThemeData(color: ApplicationColors.accent),
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: ApplicationColors.bgColor,
          child: Center(
            child: Icon(
              isDoctor ? Icons.person : Icons.local_hospital,
              size: 100,
              color: ApplicationColors.accent,
            ),
          ),
        ),
      ),
    );
  }
}