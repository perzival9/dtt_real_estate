import 'package:dtt_real_estate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationMap extends StatelessWidget {
  final double latitude;
  final double longitude;

  const LocationMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  Future<void> launchMaps() async {
    final url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          margin: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: 2,
                color: AppColors.darkGray.withOpacity(0.5),
              ),
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
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: launchMaps,
            ),
          ),
        ),
      ],
    );
  }
}
