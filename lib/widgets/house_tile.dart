import 'package:dtt_real_estate/providers/house_provider.dart';
import 'package:dtt_real_estate/screens/house_detail_screen.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../models/house_model.dart';

class HouseTile extends ConsumerWidget {
  final House house;

  const HouseTile({
    required this.house,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(
        houseProvider.select((state) => state.likedHouses.contains(house)));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HouseDetailScreen(house: house),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.darkGray,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(house.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '\$${house.price}',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text(
                              house.city,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(houseProvider.notifier).toggleLike(house);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/ic_wishlist.svg',
                            width: 16,
                            height: 16,
                            colorFilter: ColorFilter.mode(
                              isLiked ? AppColors.red : AppColors.darkGray,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        detailIcon(
                          context,
                          'assets/icons/ic_bed.svg',
                          '${house.bedrooms}',
                        ),
                        detailIcon(
                          context,
                          'assets/icons/ic_bath.svg',
                          '${house.bathrooms}',
                        ),
                        detailIcon(
                          context,
                          'assets/icons/ic_layers.svg',
                          '${house.size}',
                        ),
                        detailIcon(
                          context,
                          'assets/icons/ic_location.svg',
                          '${house.latitude} km',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget detailIcon(BuildContext context, String assetPath, String value) {
  return Row(
    children: [
      SvgPicture.asset(
        assetPath,
        width: 12,
        height: 16,
        colorFilter: const ColorFilter.mode(
          AppColors.medium,
          BlendMode.srcIn,
        ),
      ),
      const SizedBox(width: 4),
      Text(
        value,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      const SizedBox(width: 16.0),
    ],
  );
}
