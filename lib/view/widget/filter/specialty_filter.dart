import 'package:flutter/material.dart';
import 'specialty_card.dart';

class SpecialtyFilterSection extends StatelessWidget {
  final String? selectedSpecialty;
  final ValueChanged<String?> onSpecialtySelected;

  const SpecialtyFilterSection({
    super.key,
    required this.selectedSpecialty,
    required this.onSpecialtySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Specialty or Facility Type', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: [
            SpecialtyCard(
              title: 'Cardiology',
              icon: Icons.favorite,
              isSelected: selectedSpecialty == 'Cardiology',
              onTap: () => onSpecialtySelected(selectedSpecialty == 'Cardiology' ? null : 'Cardiology'),
            ),
            SpecialtyCard(
              title: 'Plastic Surgeon',
              icon: Icons.face_retouching_natural,
              isSelected: selectedSpecialty == 'Plastic Surgeon',
              onTap: () => onSpecialtySelected(selectedSpecialty == 'Plastic Surgeon' ? null : 'Plastic Surgeon'),
            ),
            SpecialtyCard(
              title: 'Clinic',
              icon: Icons.medical_services,
              isSelected: selectedSpecialty == 'Clinic',
              onTap: () => onSpecialtySelected(selectedSpecialty == 'Clinic' ? null : 'Clinic'),
            ),
            SpecialtyCard(
              title: 'Hospital',
              icon: Icons.local_hospital,
              isSelected: selectedSpecialty == 'Hospital',
              onTap: () => onSpecialtySelected(selectedSpecialty == 'Hospital' ? null : 'Hospital'),
            ),
          ],
        ),
      ],
    );
  }
}