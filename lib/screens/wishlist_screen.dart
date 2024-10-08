import 'package:dtt_real_estate/theme/theme.dart';
import 'package:dtt_real_estate/widgets/app_bar.dart';
import 'package:dtt_real_estate/widgets/bottom_navigation_bar.dart';
import 'package:dtt_real_estate/widgets/house_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/house_provider.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedHouses =
        ref.watch(houseProvider.select((state) => state.likedHouses));

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: const CustomAppBar(title: 'WISHLIST'),
      body: likedHouses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/search_state_empty.png',
                    height: 200,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'No items found!\nAdd some houses to your wishlist?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: likedHouses.length,
              itemBuilder: (context, index) {
                return HouseTile(house: likedHouses[index]);
              },
            ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/overview');
          }
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/about');
          }
        },
      ),
    );
  }
}
