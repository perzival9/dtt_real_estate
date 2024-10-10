import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/house_model.dart';
import '../services/house_service.dart';
import '../services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class HouseState {
  final bool isLoading;
  final List<House> houses;
  final List<House> filteredHouses;
  final List<House> likedHouses;
  final String? errorMessage;
  final bool locationPermissionGranted;
  final Position? userLocation;

  HouseState({
    required this.isLoading,
    required this.houses,
    required this.filteredHouses,
    required this.likedHouses,
    required this.errorMessage,
    required this.locationPermissionGranted,
    required this.userLocation,
  });

  factory HouseState.initial() {
    return HouseState(
      isLoading: false,
      houses: [],
      filteredHouses: [],
      likedHouses: [],
      errorMessage: null,
      locationPermissionGranted: false,
      userLocation: null,
    );
  }

  HouseState copyWith({
    bool? isLoading,
    List<House>? houses,
    List<House>? filteredHouses,
    List<House>? likedHouses,
    String? errorMessage,
    bool? locationPermissionGranted,
    Position? userLocation,
  }) {
    return HouseState(
      isLoading: isLoading ?? this.isLoading,
      houses: houses ?? this.houses,
      filteredHouses: filteredHouses ?? this.filteredHouses,
      likedHouses: likedHouses ?? this.likedHouses,
      errorMessage: errorMessage ?? this.errorMessage,
      locationPermissionGranted:
          locationPermissionGranted ?? this.locationPermissionGranted,
      userLocation: userLocation ?? this.userLocation,
    );
  }
}

class HouseNotifier extends StateNotifier<HouseState> {
  final HouseService _houseService;
  final LocationService _locationService;

  HouseNotifier(this._houseService, this._locationService)
      : super(HouseState.initial());

  Future<void> fetchHouses() async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final housesFuture = _houseService.fetchHouses();
      final userLocationFuture = _locationService.getUserLocation();
      final houses = await housesFuture;
      final userLocation = await userLocationFuture;

      if (userLocation != null) {
        _locationService.calculateDistanceForHouseList(userLocation, houses);
      }

      state = state.copyWith(
        isLoading: false,
        houses: houses,
        filteredHouses: houses,
        locationPermissionGranted: userLocation != null,
        userLocation: userLocation,
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      );
    }
  }

  void searchHouses(String query) {
    if (query.isEmpty) {
      state = state.copyWith(filteredHouses: state.houses);
    } else {
      List<House> filteredList = state.houses.where((house) {
        return house.city.toLowerCase().contains(query.toLowerCase()) ||
            house.zip.toLowerCase().contains(query.toLowerCase()) ||
            house.price.toString().contains(query) ||
            house.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
      state = state.copyWith(filteredHouses: filteredList);
    }
  }

  void toggleLike(House house) {
    List<House> updatedLikedHouses = List.from(state.likedHouses);
    if (updatedLikedHouses.contains(house)) {
      updatedLikedHouses.remove(house);
    } else {
      updatedLikedHouses.add(house);
    }
    state = state.copyWith(likedHouses: updatedLikedHouses);
  }
}

final houseProvider = StateNotifierProvider<HouseNotifier, HouseState>(
  (ref) {
    return HouseNotifier(
      ref.watch(houseServiceProvider),
      ref.watch(locationServiceProvider),
    );
  },
);
