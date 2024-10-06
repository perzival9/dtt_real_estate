import 'package:dtt_real_estate/models/house_model.dart';
import 'package:dtt_real_estate/services/house_service.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:dtt_real_estate/widgets/app_bar.dart';
import 'package:dtt_real_estate/widgets/bottom_navigation_bar.dart';
import 'package:dtt_real_estate/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    super.initState();
    fetchHouseData();
  }

  Future<void> fetchHouseData() async {
    HouseService houseService = HouseService();
    try {
      List<House> houses = await houseService.fetchHouses();
      for (var house in houses) {
        print(
            'House ID: ${house.id}, Price: ${house.price}, City: ${house.city}, Bedrooms: ${house.bedrooms}');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: const CustomAppBar(title: 'DTT REAL ESTATE'),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSearchBar(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/about');
          }
        },
      ),
    );
  }
}
