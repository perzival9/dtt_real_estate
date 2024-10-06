import 'package:flutter/material.dart';
import 'package:dtt_real_estate/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_home.svg',
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? AppColors.strong : AppColors.light,
              BlendMode.srcIn,
            ),
          ),
          label: 'Overview',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ic_info.svg',
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? AppColors.strong : AppColors.light,
              BlendMode.srcIn,
            ),
          ),
          label: 'About',
        ),
      ],
    );
  }
}
