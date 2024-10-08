import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/house_model.dart';
import '../services/house_service.dart';

class HouseState {
  final bool isLoading;
  final List<House> houses;
  final List<House> filteredHouses;
  final List<House> likedHouses;
  final String? errorMessage;

  HouseState({
    required this.isLoading,
    required this.houses,
    required this.filteredHouses,
    required this.likedHouses,
    required this.errorMessage,
  });

  factory HouseState.initial() {
    return HouseState(
      isLoading: false,
      houses: [],
      filteredHouses: [],
      likedHouses: [],
      errorMessage: null,
    );
  }

  HouseState copyWith({
    bool? isLoading,
    List<House>? houses,
    List<House>? filteredHouses,
    List<House>? likedHouses,
    String? errorMessage,
  }) {
    return HouseState(
      isLoading: isLoading ?? this.isLoading,
      houses: houses ?? this.houses,
      filteredHouses: filteredHouses ?? this.filteredHouses,
      likedHouses: likedHouses ?? this.likedHouses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class HouseNotifier extends StateNotifier<HouseState> {
  HouseNotifier() : super(HouseState.initial());

  Future<void> fetchHouses() async {
    try {
      state = state.copyWith(
        isLoading: true,
        errorMessage: null,
      );
      List<House> houses = await HouseService().fetchHouses();
      state = state.copyWith(
        isLoading: false,
        houses: houses,
        filteredHouses: houses,
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

final houseProvider = StateNotifierProvider<HouseNotifier, HouseState>((ref) {
  return HouseNotifier();
});
