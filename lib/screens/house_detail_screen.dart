import 'package:dtt_real_estate/constants/text_constants.dart';
import 'package:dtt_real_estate/models/house_model.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:dtt_real_estate/widgets/house_tile.dart';
import 'package:dtt_real_estate/widgets/location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HouseDetailScreen extends StatelessWidget {
  final House house;

  const HouseDetailScreen({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
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
          Positioned(
            top: 40,
            left: 4,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset(
                'assets/icons/ic_back.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
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
                                  '${house.latitude} km'),
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
                        TextConstants.houseDescription,
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
