import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/theme/app_lottie.dart';
import '../../controllers/home_controller.dart';

class HomeImagesGridView extends StatelessWidget {
  final HomeController controller;
  const HomeImagesGridView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => GridView.builder(
          physics: const BouncingScrollPhysics(),
          controller: controller.imageScroll,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: controller.imagesList.length,
          itemBuilder: (context, index) {
            final image = controller.imagesList[index];
            return GestureDetector(
              onTap: () =>
                  Modular.to.pushNamed('/image-details', arguments: image),
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: Image.network(
                      image.imageMedium,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: Lottie.asset(AppLottie.loading));
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image.imageMedium,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: Lottie.asset(AppLottie.loading));
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
