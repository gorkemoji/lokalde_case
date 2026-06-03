import 'package:flutter/material.dart';
import 'country_chip.dart';

class CountryFilterSection extends StatelessWidget {
  final String selectedCountry;
  final ValueChanged<String> onCountrySelected;

  const CountryFilterSection({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Country', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            CountryChip(
              label: 'Türkiye',
              isSelected: selectedCountry == 'Türkiye',
              onSelected: (selected) => onCountrySelected(selected ? 'Türkiye' : ''),
            ),
            CountryChip(
              label: 'France',
              isSelected: selectedCountry == 'France',
              onSelected: (selected) => onCountrySelected(selected ? 'France' : ''),
            ),
            CountryChip(
              label: 'Germany',
              isSelected: selectedCountry == 'Germany',
              onSelected: (selected) => onCountrySelected(selected ? 'Germany' : ''),
            ),
          ],
        ),
      ],
    );
  }
}