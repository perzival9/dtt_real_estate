import 'package:dtt_real_estate/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Wishlist'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/overview');
          }
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/about');
          }
        },
      ),
    );
  }
}
