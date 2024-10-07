import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/house_provider.dart';
import '../theme/theme.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({super.key});

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final houseNotifier = ref.read(houseProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.darkGray,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(blurRadius: 20, spreadRadius: 2, color: AppColors.white)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0, top: 4.0),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              houseNotifier.searchHouses(value);
            },
            decoration: InputDecoration(
              hintText: 'Search for a home',
              hintStyle: const TextStyle(
                color: AppColors.medium,
                fontWeight: FontWeight.w300,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    controller.clear();
                    houseNotifier.searchHouses('');
                  }
                },
                icon: SvgPicture.asset(
                  controller.text.isEmpty
                      ? 'assets/icons/ic_search.svg'
                      : 'assets/icons/ic_close.svg',
                  width: 24,
                  height: 24,
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
