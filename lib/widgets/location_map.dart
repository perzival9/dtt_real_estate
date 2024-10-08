import 'package:dtt_real_estate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatelessWidget {
  final double latitude;
  final double longitude;

  const LocationMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 2,
            color: AppColors.darkGray.withOpacity(0.5),
          )
        ],
      ),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('location_marker'),
            position: LatLng(latitude, longitude),
          ),
        },
        myLocationButtonEnabled: false,
        compassEnabled: false,
      ),
    );
  }
}
