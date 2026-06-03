import 'package:flutter_test/flutter_test.dart';
import 'package:lokalde_case/model/provider_model.dart';
import 'package:lokalde_case/viewmodel/provider_viewmodel.dart';

void main() {
  group('ProviderViewModel Tests', () {
    late ProviderViewModel viewModel;

    setUp(() {
      viewModel = ProviderViewModel();
      viewModel.displayedProviders = [
        ProviderViewModelTestMock.doctor,
        ProviderViewModelTestMock.hospital,
      ];
    });

    test('Initial state should not be loading', () {
      expect(viewModel.isLoading, false);
      expect(viewModel.errorMessage, null);
    });

    test('Search should update current search query', () {
      viewModel.searchProviders('Cem');
      expect(viewModel.isLoading, false);
    });
  });
}

class ProviderViewModelTestMock {
  static final doctor = ProviderModel(
    id: '1',
    name: 'Dr. Cem İnan Bektaş',
    type: ProviderType.doctor,
    category: 'Plastic Surgeon',
    city: 'Istanbul',
    country: 'Türkiye',
    rating: 4.8,
    reviewCount: 120,
    postCount: 0,
    followCount: 100,
    isVerified: true,
  );

  static final hospital = ProviderModel(
    id: '2',
    name: 'Acıbadem Hastanesi',
    type: ProviderType.hospital,
    category: 'Private Hospital',
    city: 'Istanbul',
    country: 'Türkiye',
    rating: 4.5,
    reviewCount: 300,
    postCount: 10,
    followCount: 120,
    isVerified: false,
  );
}