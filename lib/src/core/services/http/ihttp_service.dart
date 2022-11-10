import '../../dto/http_response_dto.dart';

abstract class IHttpService {
  abstract String urlBase;
  Future<HttpResponseDto> get(String endpoint, {Map<String, String>? headers});
  Map<String, String> withToken(String token);
}
