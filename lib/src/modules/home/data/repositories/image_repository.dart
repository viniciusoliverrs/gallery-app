import 'package:dartz/dartz.dart';

import '../../../../core/entities/image_entity.dart';
import '../../../../core/entities/pagination_entity.dart';
import '../../domain/data/exceptions/image_error.dart';
import '../../domain/data/repositories/iimage_repository.dart';
import '../../domain/resources/image_resource.dart';
import '../adapters/image_adapter.dart';
import '../datasources/iimage_datasource.dart';

class ImageRepository implements IImageRepository {
  final IImageDatasource datasource;

  ImageRepository(this.datasource);

  @override
  Future<Either<PaginationEntity<ImageEntity>, ImageError>> getImages(
      {required String query, required int page, required int perPage}) async {
    try {
      var response = await datasource.getImages(
        query: query,
        page: page,
        perPage: perPage,
      );
      var pagination = PaginationEntity.fromMap<ImageEntity>(response);
      var data = pagination.copyWith(
        data: (response["photos"] as List<dynamic>)
            .map<ImageEntity>((map) => ImageAdapter.fromJson(map))
            .toList(),
      );
      return Left(data);
    } catch (e) {
      return Right(ImageError(ImageResource.messageFailure));
    }
  }
}
