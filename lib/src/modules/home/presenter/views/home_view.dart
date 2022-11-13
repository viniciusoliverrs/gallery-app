import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import 'components/home_bottom_navigation.dart';
import 'components/home_images_grid_view.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  const HomeView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Column(
        children: [
          HomeImagesGridView(controller: widget.controller),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigation(
        controller: widget.controller,
      ),
    );
  }
}
