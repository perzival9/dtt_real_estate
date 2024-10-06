import 'package:dtt_real_estate/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('About'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 1,
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/overview');
            }
          }),
    );
  }
}
