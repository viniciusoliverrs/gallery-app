import 'package:flutter/material.dart';

import '../../controllers/home_controller.dart';

class HomeBottomNavigation extends StatelessWidget {
  final HomeController controller;
  const HomeBottomNavigation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) => Visibility(
        visible: controller.isLoading,
        child: const SizedBox(
          height: 4,
          child: LinearProgressIndicator(),
        ),
      ),
    );
  }
}
