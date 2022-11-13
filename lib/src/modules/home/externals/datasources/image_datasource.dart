import 'package:gallery_app/src/core/dto/pagination_dto.dart';
import 'package:gallery_app/src/core/services/http/ihttp_service.dart';

import '../../../../core/utils/constants/api_config.dart';
import '../../data/datasources/iimage_datasource.dart';

class ImageDatasource implements IImageDatasource {
  IHttpService httpService;
  ImageDatasource(this.httpService);

  @override
  Future<Map<String, dynamic>> getImages({
    required String query,
    required int page,
    required perPage,
  }) async {
    try {
      final headers = httpService.withToken(ApiConfig.token);
      final response = await httpService.get(
        'search?query=$query&page=$page&per_page=$perPage',
        headers: headers,
      );
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
