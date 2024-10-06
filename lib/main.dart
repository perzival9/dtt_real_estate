import 'package:dtt_real_estate/screens/about_screen.dart';
import 'package:dtt_real_estate/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DTT Real Estate',
      theme: AppTheme.lightTheme,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/overview': (context) => const OverviewScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
