// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/theme/app_lottie.dart';
import '../../../home/domain/entities/image_entity.dart';


class ImageDetailsView extends StatefulWidget {
  final ImageEntity entity;

  const ImageDetailsView({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  State<ImageDetailsView> createState() => _ImageDetailsViewState();
}

class _ImageDetailsViewState extends State<ImageDetailsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.network(
            widget.entity.imageOriginal,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: Lottie.asset(AppLottie.loading),
              );
            },
          ),
           Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () => Modular.to.pop(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
