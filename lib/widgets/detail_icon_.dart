import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme.dart';

Widget detailIcon(BuildContext context, String assetPath, String value) {
  return Row(
    children: [
      SvgPicture.asset(
        assetPath,
        width: 12,
        height: 16,
        colorFilter: const ColorFilter.mode(
          AppColors.medium,
          BlendMode.srcIn,
        ),
      ),
      const SizedBox(width: 4),
      Text(
        value,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      const SizedBox(width: 16.0),
    ],
  );
}
