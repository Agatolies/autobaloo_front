import 'package:autobaloo/models/strapi_common/strapi_pagination.dart';

class StrapiMeta {
  StrapiMeta();

  StrapiMeta.fromJson(Map<String, dynamic> json) {
    _pagination = json.containsKey('pagination')
        ? StrapiPagination.fromJson(json['pagination'])
        : null;
  }

  StrapiPagination? _pagination = StrapiPagination.empty();

  StrapiPagination? get pagination => _pagination;
}
