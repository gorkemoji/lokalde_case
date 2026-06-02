import 'package:flutter/material.dart';
import '../model/provider_model.dart';
import '../service/mock_data_service.dart';

class ProviderViewModel extends ChangeNotifier {
  final MockDataService _service = MockDataService();

  bool isLoading = false;
  String? errorMessage;

  List<ProviderModel> _allProviders = [];
  List<ProviderModel> displayedProviders = [];

  Future<void> fetchProviders() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _allProviders = await _service.getProviders();
      displayedProviders = List.from(_allProviders);
    } catch (e) {
      errorMessage = 'Veriler yüklenirken beklenmedik bir hata oluştu.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchProviders(String query) {
    if (query.isEmpty) {
      displayedProviders = List.from(_allProviders);
    } else {
      displayedProviders = _allProviders.where((provider) {
        return provider.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void applyFilters({String? country, String? specialty}) {
    // Eğer hiçbir filtre seçilmemişse tüm liste geri gelecek
    if ((country == null || country.isEmpty) && (specialty == null || specialty.isEmpty)) {
      displayedProviders = List.from(_allProviders);
    } else {
      displayedProviders = _allProviders.where((provider) {
        // Ülke eşleşmesi kontrolü
        final matchesCountry = (country == null || country.isEmpty)
            || provider.country.toLowerCase() == country.toLowerCase();

        // Branş eşleşmesi kontrolü
        final matchesSpecialty = (specialty == null || specialty.isEmpty)
            || provider.category.toLowerCase().contains(specialty.toLowerCase());

        // Her iki şartı da sağlayanlar listeye dahil edilir
        return matchesCountry && matchesSpecialty;
      }).toList();
    }
    notifyListeners();
  }

  void clearFilters() {
    displayedProviders = List.from(_allProviders);
    notifyListeners();
  }
}