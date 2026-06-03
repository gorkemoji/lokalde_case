import 'package:flutter/material.dart';
import 'package:lokalde_case/constant/application_colors.dart';
import 'package:lokalde_case/view/widget/app_bar.dart';
import 'package:lokalde_case/view/widget/bottom_nav_bar.dart';
import 'package:lokalde_case/view/widget/list_search_bar.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/provider_viewmodel.dart';
import '../../widget/list_shimmer.dart';
import '../../widget/provider_card.dart';
import '../filter/filter_screen.dart';

class ProviderListScreen extends StatefulWidget {
  const ProviderListScreen({super.key});

  @override
  State<ProviderListScreen> createState() => _ProviderListScreenState();
}

class _ProviderListScreenState extends State<ProviderListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProviderViewModel>().fetchProviders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ApplicationColors.bgColor,
      appBar: const MainAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            // Arama çubuğu
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListSearchBar(
                onChanged: (query) {
                  context.read<ProviderViewModel>().searchProviders(query);
                },
              ),
            ),

            Expanded(
              child: Consumer<ProviderViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) { // Yüklenme durumu
                    return const ProviderListShimmer();
                  }

                  if (viewModel.errorMessage != null) { // Hata durumu
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.wifi_off, size: 64, color: ApplicationColors.secondaryText),
                          const SizedBox(height: 16),
                          Text(
                            viewModel.errorMessage!,
                            style: const TextStyle(fontSize: 16, color: ApplicationColors.secondaryText),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () {
                              context.read<ProviderViewModel>().fetchProviders();
                            },
                            icon: const Icon(Icons.refresh, color: Colors.white),
                            label: const Text('Try Again', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ApplicationColors.accent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  if (viewModel.displayedProviders.isEmpty) { // Boş liste durumu
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 64, color: ApplicationColors.secondaryText),
                          SizedBox(height: 16),
                          Text(
                            'No providers found matching your criteria.',
                            style: TextStyle(fontSize: 16, color: ApplicationColors.secondaryText),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    //padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 120.0),
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
                    itemCount: viewModel.displayedProviders.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final provider = viewModel.displayedProviders[index];
                      return ProviderCard(provider: provider);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      )
      /*bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const FilterScreen(),
              ),
            );
          }
        },
      ),*/
    );
  }
}