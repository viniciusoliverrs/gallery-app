import 'package:flutter/material.dart';

import '../../../../core/entities/image_entity.dart';
import '../../../../core/entities/pagination_entity.dart';
import '../../../../core/templates/base_controller.dart';
import '../../domain/data/repositories/iimage_repository.dart';

class HomeController extends BaseController {
  final IImageRepository repository;
  late PaginationEntity<ImageEntity> pagination =
      PaginationEntity.empty<ImageEntity>();
  List<ImageEntity> imagesList = [];
  final imageScroll = ScrollController();
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

    var response = await repository.getImages(
      query: 'nature',
      page: page,
      perPage: 10,
    );

    response.fold(
      (data) {
        if (data.data.isNotEmpty) {
          if (data.currentPage == 1) {
            imagesList = data.data;
          } else if (data.data.isNotEmpty) {
            imagesList += data.data;
          }
          notifyListeners();
        }
      },
      (error) {
        messageFailure = error.message;
        notifyListeners();
      },
    );
    setIsLoading(false);
  }

  searchImages(String query) async {
    setIsLoading(true);

    var response = await repository.getImages(
      query: query,
      page: 1,
      perPage: 10,
    );

    response.fold(
      (data) {
        if (data.data.isNotEmpty) {
          imagesList = data.data;
          notifyListeners();
        }
      },
      (error) {
        messageFailure = error.message;
        notifyListeners();
      },
    );

    setIsLoading(false);
  }
}
