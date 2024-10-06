import 'package:dtt_real_estate/models/house_model.dart';
import 'package:dtt_real_estate/providers/house_provider.dart';
import 'package:dtt_real_estate/services/house_service.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:dtt_real_estate/widgets/app_bar.dart';
import 'package:dtt_real_estate/widgets/bottom_navigation_bar.dart';
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
          if (!houseState.isLoading && houseState.houses.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: houseState.houses.length,
                itemBuilder: (context, index) {
                  final house = houseState.houses[index];
                  return ListTile(
                    title: Text('${house.price}'),
                    subtitle: Text(house.city),
                    onTap: () {},
                  );
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
