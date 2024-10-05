import 'package:dtt_real_estate/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'DTT REAL ESTATE'),
      body: Center(
        child: Text('Welcome to DTT Real Estate!'),
      ),
    );
  }
}
