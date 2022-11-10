import 'package:flutter/material.dart';
import 'package:gallery_app/src/core/dto/pagination_dto.dart';

import '../../domain/data/repositories/iimage_repository.dart';
import '../../domain/entities/image_entity.dart';

class HomeController with ChangeNotifier {
  final IImageRepository repository;
  late PaginationDto<ImageEntity> pagination =
      PaginationDto.empty<ImageEntity>();
  List<ImageEntity> imagesList = [];
  final imageScroll = ScrollController();
  bool isLoading = false;

  HomeController(this.repository) {
    getImagesByPage(1);
    imageScroll.addListener(() {
      if (imageScroll.position.pixels == imageScroll.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  loadMore() async {
    pagination.nextPage();
    getImagesByPage(pagination.currentPage);
  }

  getImagesByPage(int page) async {
    setIsLoading(true);

    pagination = await repository.getImages(
      query: 'nature',
      page: page,
      perPage: 10,
    );
    if (pagination.currentPage == 1) {
      imagesList = pagination.data;
    } else if (pagination.data.isNotEmpty) {
      imagesList += pagination.data;
    }

    setIsLoading(false);
  }

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
