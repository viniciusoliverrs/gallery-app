import 'package:dartz/dartz.dart';

import '../../../../../core/entities/image_entity.dart';
import '../../../../../core/entities/pagination_entity.dart';
import '../exceptions/image_error.dart';

abstract class IImageRepository {
  Future<Either<PaginationEntity<ImageEntity>, ImageError>> getImages(
      {required String query, required int page, required int perPage});
}
