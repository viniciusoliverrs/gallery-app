abstract class IImageDatasource {
  Future<Map<String, dynamic>> getImages({
    required String query,
    required int page,
    required int perPage,
  });
}
