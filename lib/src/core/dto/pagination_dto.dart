class PaginationDto<T> {
  int currentPage;
  int perPage;
  int total;
  List<T> data;
  PaginationDto({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.data,
  });

  nextPage() {
    return currentPage++;
  }

  static PaginationDto<T> fromMap<T>(Map<String, dynamic> json) {
    return PaginationDto<T>(
      currentPage: json['page'],
      perPage: json['per_page'],
      total: json['total_results'],
      data: [],
    );
  }

  static PaginationDto<T> empty<T>() {
    return PaginationDto<T>(
      currentPage: 1,
      perPage: 0,
      total: 0,
      data: [],
    );
  }

  PaginationDto<T> copyWith({
    int? currentPage,
    int? perPage,
    int? total,
    List<T>? data,
  }) {
    return PaginationDto<T>(
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      data: data ?? this.data,
    );
  }

  void nextPageUrl() {
    if (currentPage < (total / perPage)) {
       currentPage ++;
    }
  }
}
