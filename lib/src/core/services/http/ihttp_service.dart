import 'http_response.dart';

abstract class IHttpService {
  abstract String urlBase;
  Future<HttpResponse> get(String endpoint, {Map<String, String>? headers});
  Map<String, String> withToken(String token);
}
