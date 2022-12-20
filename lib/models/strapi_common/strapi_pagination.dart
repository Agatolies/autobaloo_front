class StrapiPagination {
  StrapiPagination({
    this.page = 1,
    this.pageSize = 10,
    this.pageCount = 25,
    this.total = 0,
    this.start = 0,
    this.limit = 25,
  });

  StrapiPagination.empty() : this();

  factory StrapiPagination.fromJson(Map<String, dynamic> json) =>
      StrapiPagination(
        page: json.containsKey('page') ? json['page'] : 1,
        pageSize: json.containsKey('pageSize') ? json['pageSize'] : 10,
        pageCount: json.containsKey('pageCount') ? json['pageCount'] : 25,
        total: json.containsKey('total') ? json['total'] : 0,
        start: json.containsKey('start') ? json['start'] : 0,
        limit: json.containsKey('limit') ? json['limit'] : 25,
      );

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;
  final int start;
  final int limit;
}
