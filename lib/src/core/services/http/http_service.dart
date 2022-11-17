import 'dart:convert';

import 'package:gallery_app/src/core/services/http/http_response.dart';
import 'package:http/http.dart' as http;

import 'http_error.dart';
import 'ihttp_service.dart';

class HttpService implements IHttpService {
  @override
  String urlBase;
  HttpService({
    required this.urlBase,
  });

  @override
  Map<String, String> withToken(String token) {
    return {'Authorization': token};
  }

  @override
  Future<HttpResponse> get(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      headers = headers?.isNotEmpty != null ? headers : {};
      final response =
          await http.get(Uri.parse(urlBase + endpoint), headers: headers);

      if (response.statusCode == 200) {
        return HttpResponse(
          data: json.decoder.convert(response.body),
          statusCode: response.statusCode,
        );
      } else {
        return HttpResponse(
          data: response.body,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw HttpError(e.toString());
    }
  }
}
