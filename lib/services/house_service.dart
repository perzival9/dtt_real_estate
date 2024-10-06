import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/house_model.dart';

class HouseService {
  static const String baseUrl = 'https://intern.d-tt.nl/api/house';
  static const String apiKey = '98bww4ezuzfePCYFxJEWyszbUXc7dxRx';

  Future<List<House>> fetchHouses() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {'Access-Key': apiKey},
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<House> houses = jsonData.map((houseJson) {
          return House.fromJson(houseJson);
        }).toList();

        return houses;
      } else {
        throw Exception('Failed to load houses');
      }
    } catch (error) {
      throw Exception('Error fetching houses: $error');
    }
  }
}
