class HttpResponseDto<T> {
  final int statusCode;
  final T data;
  final String? message;

  HttpResponseDto({
    required this.statusCode,
    required this.data,
    this.message,
  });
}
