import 'package:flutter/material.dart';
import '../model/provider_model.dart';
import '../service/mock_data_service.dart';

class ProviderViewModel extends ChangeNotifier {
  final MockDataService _service = MockDataService();

  bool isLoading = false;
  String? errorMessage;

  List<ProviderModel> _allProviders = [];
  List<ProviderModel> displayedProviders = [];

  String _currentSearchQuery = '';
  String? currentCountryFilter;
  String? currentCityFilter;
  String? currentSpecialtyFilter;

  void searchProviders(String query) {
    _currentSearchQuery = query.toLowerCase().trim();
    _applyAllFilters();
  }

  void applyFilters({String? country, String? city, String? specialty}) {
    currentCountryFilter = country;
    currentCityFilter = city;
    currentSpecialtyFilter = specialty;
    _applyAllFilters();
  }

  Future<void> fetchProviders() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _allProviders = await _service.getProviders();
      displayedProviders = List.from(_allProviders);
    } catch (e) {
      errorMessage = 'Error occured while retrieving the data.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _applyAllFilters() {
    displayedProviders = _allProviders.where((provider) {

      // Arama kontrolü
      final matchesSearch = _currentSearchQuery.isEmpty ||
          provider.name.toLowerCase().contains(_currentSearchQuery) ||
          provider.category.toLowerCase().contains(_currentSearchQuery) ||
          (provider.workplace != null && provider.workplace!.toLowerCase().contains(_currentSearchQuery));

      // Ülke eşleşmesi kontrolü
      final matchesCountry = (currentCountryFilter == null || currentCountryFilter!.isEmpty)
          || provider.country.toLowerCase() == currentCountryFilter!.toLowerCase();

      // Şehir eşleşmesi kontrolü
      final matchesCity = (currentCityFilter == null || currentCityFilter!.isEmpty)
          || provider.city.toLowerCase().contains(currentCityFilter!.toLowerCase());

      // Branş eşleşmesi kontrolü
      final matchesSpecialty = (currentSpecialtyFilter == null || currentSpecialtyFilter!.isEmpty)
          || provider.category.toLowerCase().contains(currentSpecialtyFilter!.toLowerCase());

      // Tüm şartları sağlayanları listeye dahil eder
      return matchesSearch && matchesCountry && matchesCity && matchesSpecialty;
    }).toList();

    notifyListeners();
  }

  void clearFilters() {
    displayedProviders = List.from(_allProviders);
    notifyListeners();
  }
}