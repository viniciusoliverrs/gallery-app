import 'package:flutter/material.dart';

import '../../../../core/dto/pagination_dto.dart';
import '../../../../core/entities/image_entity.dart';
import '../../domain/data/repositories/iimage_repository.dart';

class HomeController with ChangeNotifier {
  final IImageRepository repository;
  late PaginationDto<ImageEntity> pagination =
      PaginationDto.empty<ImageEntity>();
  List<ImageEntity> imagesList = [];
  final imageScroll = ScrollController();
  bool isLoading = false;
  final searchController = TextEditingController();

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
    if (pagination.data.isNotEmpty) {
      if (pagination.currentPage == 1) {
        imagesList = pagination.data;
      } else if (pagination.data.isNotEmpty) {
        imagesList += pagination.data;
      }
    }

    setIsLoading(false);
  }

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  searchImages(String query) async {
    setIsLoading(true);

    pagination = await repository.getImages(
      query: query,
      page: 1,
      perPage: 10,
    );
    if (pagination.data.isNotEmpty) {
      imagesList = pagination.data;
    }

    setIsLoading(false);
  }
}
