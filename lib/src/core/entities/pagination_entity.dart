class PaginationEntity<T> {
  int currentPage;
  int perPage;
  int total;
  List<T> data;
  PaginationEntity({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.data,
  });

  nextPage() {
    return currentPage++;
  }

  static PaginationEntity<T> fromMap<T>(Map<String, dynamic> json) {
    return PaginationEntity<T>(
      currentPage: json['page'],
      perPage: json['per_page'],
      total: json['total_results'],
      data: [],
    );
  }

  static PaginationEntity<T> empty<T>() {
    return PaginationEntity<T>(
      currentPage: 1,
      perPage: 0,
      total: 0,
      data: [],
    );
  }

  PaginationEntity<T> copyWith({
    int? currentPage,
    int? perPage,
    int? total,
    List<T>? data,
  }) {
    return PaginationEntity<T>(
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      data: data ?? this.data,
    );
  }

  void nextPageUrl() {
    if (currentPage < (total / perPage)) {
      currentPage++;
    }
  }
}
