import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/theme.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0, top: 4.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for a home',
              hintStyle: const TextStyle(
                color: AppColors.medium,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/ic_search.svg',
                  width: 28,
                  height: 28,
                  colorFilter: const ColorFilter.mode(
                    AppColors.medium,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
