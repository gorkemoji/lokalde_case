import '../model/provider_model.dart';

class MockDataService {
  Future<List<ProviderModel>> getProviders() async {
    await Future.delayed(const Duration(seconds: 2)); // Shimmer efektinin görünmesi için 2 saniye bekleme eklendi.

    return [
      ProviderModel(
        id: '1',
        name: 'Dr. Cem İnan Bektaş',
        type: ProviderType.doctor,
        category: 'Plastic Surgeon',
        country: 'Türkiye',
        city: 'İstanbul',
        rating: 0.0,
        reviewCount: 0,
        postCount: 0,
        followCount: 0,
        isVerified: false,
        bio: 'Op. Dr. Cem İnan Bektaş Zurih Üniversitesi’nde mikrocerrahi eğitimi aldı, çok sayıda başarılı ameliyatlar yaptı. Türkiye’nin sayılı Plastik Cerrahi uzmanlarından Op. Dr. Cem İnan Bektaş hasta kabulüne başladı.',
        email: 'ceminanbektas@ornek.com',
        phone: "+905551234567",
        workplace: "Cem İnan Bektaş Clinic"
      ),
      ProviderModel(
        id: '2',
        name: 'Ramsay Santé',
        type: ProviderType.hospital,
        category: 'Private Hospital',
        country: 'France',
        city: 'Lyon',
        rating: 4.8,
        reviewCount: 0,
        postCount: 0,
        followCount: 0,
        isVerified: true,
        bio: 'Hôpital privé de la Seine Saint-Denis, établissement de Médecine - Chirurgie - Obstétrique (MCO), gro',
        email: 'test@ramsay.com',
        phone: null, // Null kontrolün testi için null bırakıldı.
        workplace: null
      ),
      ProviderModel(
        id: '3',
        name: 'Medhair Clinic',
        type: ProviderType.clinic,
        category: 'Hair Transplant Clinic',
        country: 'Germany',
        city: 'Berlin',
        rating: 4.7,
        reviewCount: 890,
        postCount: 0,
        followCount: 1,
        isVerified: true,
        bio: 'Medhair Clinic, İstanbul’un sağlık turizmi alanında öne çıkan saç ekimi merkezlerinden biridir. Uluslararası standartlardaki hizmet anlayışı ve 10 yılı aşkın tecrübesiyle Medhair Clinic, güvenilir bir saç ekimi deneyimi sunar.',
        email: 'test@medhair.com',
        phone: '+49123456789',
        workplace: null
      ),
      ProviderModel(
        id: '4',
        name: 'Prof. Osman Bilgin Timuralp',
        type: ProviderType.doctor,
        category: 'Cardiology',
        country: 'Türkiye',
        city: 'Eskişehir',
        rating: 5.0,
        reviewCount: 128,
        postCount: 3,
        followCount: 51,
        isVerified: true,
        bio: null,
        email: null,
        phone: null,
        workplace: "Osman Bilgin Timuralp Clinic"
      ),
      ProviderModel(
        id: '5',
        name: 'Acıbadem Hastanesi Kozyatağı',
        type: ProviderType.hospital,
        category: 'Private Hospital',
        country: 'Türkiye',
        city: 'İstanbul',
        rating: 4.6,
        reviewCount: 1045,
        postCount: 12,
        followCount: 433,
        isVerified: true,
        bio: null,
        email: null,
        phone: null,
        workplace: null
      ),
    ];
  }
}