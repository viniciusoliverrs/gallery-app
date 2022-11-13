import 'package:gallery_app/src/modules/home/data/adapters/image_adapter.dart';
import 'package:gallery_app/src/modules/home/domain/entities/image_entity.dart';

import '../../../../core/dto/pagination_dto.dart';
import '../../domain/data/repositories/iimage_repository.dart';
import '../datasources/iimage_datasource.dart';

class ImageRepository implements IImageRepository {
  final IImageDatasource datasource;

  ImageRepository(this.datasource);

  @override
  Future<PaginationDto<ImageEntity>> getImages(
      {required String query, required int page, required int perPage}) async {
    try {
      var response = await datasource.getImages(
        query: query,
        page: page,
        perPage: perPage,
      );
      var pagination = PaginationDto.fromMap<ImageEntity>(response);
      return pagination.copyWith(
        data: (response["photos"] as List<dynamic>)
            .map<ImageEntity>((map)=>ImageAdapter.fromJson(map))
            .toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
