import '../../../../core/dto/pagination_dto.dart';
import '../../entities/image_entity.dart';

abstract class IImageRepository {
  Future<PaginationDto<ImageEntity>> getImages(
     {required String query, required int page, required int perPage});
}
