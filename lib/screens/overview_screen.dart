import 'package:dtt_real_estate/providers/house_provider.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:dtt_real_estate/widgets/app_bar.dart';
import 'package:dtt_real_estate/widgets/bottom_navigation_bar.dart';
import 'package:dtt_real_estate/widgets/house_tile.dart';
import 'package:dtt_real_estate/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewScreen extends ConsumerWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseState = ref.watch(houseProvider);
    final houseNotifier = ref.read(houseProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (houseState.houses.isEmpty && !houseState.isLoading) {
        houseNotifier.fetchHouses();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: const CustomAppBar(title: 'DTT REAL ESTATE'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomSearchBar(),
          if (houseState.isLoading)
            const Center(child: CircularProgressIndicator()),
          if (houseState.errorMessage != null)
            Center(child: Text('Error: ${houseState.errorMessage}')),
          if (!houseState.isLoading && houseState.filteredHouses.isEmpty)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/search_state_empty.png',
                    height: 200,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'No results found!\nPerhaps try another search?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          if (!houseState.isLoading && houseState.filteredHouses.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: houseState.filteredHouses.length,
                itemBuilder: (context, index) {
                  final house = houseState.filteredHouses[index];
                  return HouseTile(house: house);
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/about');
          }
        },
      ),
    );
  }
}
