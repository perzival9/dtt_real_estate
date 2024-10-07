import 'package:dtt_real_estate/constants/text_constants.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:dtt_real_estate/widgets/app_bar.dart';
import 'package:dtt_real_estate/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../utils/url_launcher_util.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: const CustomAppBar(title: 'ABOUT'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TextConstants.aboutDescription,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 28),
            Text(
              'Design and Development',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Image.asset(
                  'assets/images/dtt_banner/hdpi/dtt_banner.png',
                  height: 50,
                ),
                const SizedBox(width: 28.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'by DTT',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    InkWell(
                      onTap: () =>
                          UrlLauncherUtil.launchURL('https://www.d-tt.nl'),
                      child: Text(
                        'd-tt.nl',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
