import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../models/house_model.dart';

class LocationService {
  Future<bool> checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<Position?> getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    bool permissionGranted = await checkAndRequestLocationPermission();
    if (!permissionGranted) return null;

    return await Geolocator.getCurrentPosition();
  }

  double calculateDistance(
      Position userPosition, double houseLatitude, double houseLongitude) {
    return Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          houseLatitude,
          houseLongitude,
        ) /
        1000;
  }

  void calculateDistanceForHouseList(
      Position userPosition, List<House> houses) {
    for (var house in houses) {
      if (house.latitude != null && house.longitude != null) {
        house.distanceFromUser = calculateDistance(
          userPosition,
          house.latitude!,
          house.longitude!,
        );
      }
    }
  }
}

final locationServiceProvider = Provider((ref) => LocationService());
