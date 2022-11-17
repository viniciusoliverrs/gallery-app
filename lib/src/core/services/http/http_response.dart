class HttpResponse<T> {
  final int statusCode;
  final T data;
  final String? message;

  HttpResponse({
    required this.statusCode,
    required this.data,
    this.message,
  });
}
