class PaginationModel<T> {
  int offset;
  int limit;
  int total;
  List<T> data;

  // Computed Value
  int get nextPage => offset + limit;
  int get prevPage => offset - limit;
  int get totalPages => (total / limit).ceil();
  int get firstPage => 0;
  int get lastPage => total - limit;
  List<int> get availableRowsPerPage => [5, 10, 15, 25];

  PaginationModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.data,
  });
  @override
  String toString() {
    return 'totalPage $totalPages , total $total';
  }
}
