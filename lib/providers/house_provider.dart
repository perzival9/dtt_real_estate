import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/house_model.dart';
import '../services/house_service.dart';

class HouseState {
  final bool isLoading;
  final List<House> houses;
  final String? errorMessage;

  HouseState({
    required this.isLoading,
    required this.houses,
    required this.errorMessage,
  });

  factory HouseState.initial() {
    return HouseState(
      isLoading: false,
      houses: [],
      errorMessage: null,
    );
  }
}

class HouseNotifier extends StateNotifier<HouseState> {
  HouseNotifier() : super(HouseState.initial());

  Future<void> fetchHouses() async {
    try {
      state = HouseState(
        isLoading: true,
        houses: [],
        errorMessage: null,
      );
      List<House> houses = await HouseService().fetchHouses();
      state = HouseState(
        isLoading: false,
        houses: houses,
        errorMessage: null,
      );
    } catch (error) {
      state = HouseState(
        isLoading: false,
        houses: [],
        errorMessage: error.toString(),
      );
    }
  }
}

final houseProvider = StateNotifierProvider<HouseNotifier, HouseState>((ref) {
  return HouseNotifier();
});
