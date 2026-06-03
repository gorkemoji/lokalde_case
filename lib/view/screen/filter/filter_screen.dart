import 'package:flutter/material.dart';
import 'package:lokalde_case/view/widget/filter/country_filter.dart';
import 'package:lokalde_case/view/widget/filter/filter_button.dart';
import 'package:provider/provider.dart';

import '../../../constant/application_colors.dart';
import '../../../viewmodel/provider_viewmodel.dart';
import '../../widget/filter/city_filter.dart';
import '../../widget/filter/specialty_filter.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCountry = '';
  String? selectedSpecialty = null;
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<ProviderViewModel>();
      setState(() {
        selectedCountry = viewModel.currentCountryFilter ?? '';
        selectedSpecialty = viewModel.currentSpecialtyFilter;
        _cityController.text = viewModel.currentCityFilter ?? '';
      });
    });
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _resetFilters() {
    setState(() {
      selectedCountry = '';
      selectedSpecialty = null;
      _cityController.clear();
    });
    context.read<ProviderViewModel>().applyFilters(
      country: null,
      city: null,
      specialty: null,
    );
  }

  void _applyFilters() {
    context.read<ProviderViewModel>().applyFilters(
      country: selectedCountry,
      city: _cityController.text.trim(),
      specialty: selectedSpecialty,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.bgColor,
      appBar: AppBar(
        backgroundColor: ApplicationColors.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: ApplicationColors.accent),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Filters',
          style: TextStyle(color: ApplicationColors.primaryText, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _resetFilters,
            child: const Text('Reset', style: TextStyle(color: ApplicationColors.accent)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CountryFilterSection(
                    selectedCountry: selectedCountry,
                    onCountrySelected: (val) => setState(() => selectedCountry = val),
                  ),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),

                  CityFilterSection(controller: _cityController),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),

                  SpecialtyFilterSection(
                    selectedSpecialty: selectedSpecialty,
                    onSpecialtySelected: (val) => setState(() => selectedSpecialty = val),
                  ),
                ],
              ),
            ),
          ),

        FilterButton(onApply: _applyFilters),
        ],
      ),
    );
  }
}