import 'package:dtt_real_estate/models/house_model.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:dtt_real_estate/widgets/detail_icon_.dart';
import 'package:dtt_real_estate/widgets/location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HouseDetailScreen extends ConsumerWidget {
  final House house;

  const HouseDetailScreen({super.key, required this.house});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distanceText = house.distanceFromUser != null
        ? '${house.distanceFromUser!.toStringAsFixed(0)} km'
        : '...';

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Stack(
        children: [
          Image.network(
            house.image,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 220),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: AppColors.lightGray,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${house.price}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Row(
                            children: [
                              detailIcon(context, 'assets/icons/ic_bed.svg',
                                  '${house.bedrooms}'),
                              detailIcon(context, 'assets/icons/ic_bath.svg',
                                  '${house.bathrooms}'),
                              detailIcon(context, 'assets/icons/ic_layers.svg',
                                  '${house.size}'),
                              detailIcon(
                                context,
                                'assets/icons/ic_location.svg',
                                distanceText,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        house.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Location',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),
                      LocationMap(
                        latitude: house.latitude ?? 0,
                        longitude: house.longitude ?? 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
