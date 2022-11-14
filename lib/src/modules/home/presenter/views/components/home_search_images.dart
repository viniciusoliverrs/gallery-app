import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../controllers/home_controller.dart';

class HomeSearchImages extends StatelessWidget {
  final HomeController controller;
  const HomeSearchImages({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        style: const TextStyle(color: AppColors.light),
        controller: controller.searchController,
        decoration: InputDecoration(
          hintText: 'Search..',
          
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintStyle: const TextStyle(color: AppColors.light),
          contentPadding: const EdgeInsets.only(left: 15, top: 15),
          suffixIcon: IconButton(
            onPressed: () => controller
                .searchImages(controller.searchController.text.trim()),
            color: AppColors.light,
            icon: const Icon(AppIcons.search, size: 20),
          ),
        ),
      ),
    );
  }
}
