// ignore_for_file: avoid_unused_constructor_parameters

import 'package:autobaloo/helper/enums/strapi_publication_state.dart';
import 'package:autobaloo/helper/utils/functions.dart';
import 'package:autobaloo/helper/utils/query_generator.dart';
import 'package:autobaloo/models/strapi_common/strapi_file.dart';
import 'package:autobaloo/models/strapi_common/strapi_filter.dart';

class StrapiQuery {
  StrapiQuery();

  StrapiQuery.instance();

  StrapiQuery.params(
      {Map<String, dynamic>? filters = const {},
      String? locale,
      StrapiPublicationState publicationState = StrapiPublicationState.none,
      List<String>? fields = const [],
      List<StrapiFile>? files = const [],
      List<String>? populates = const [],
      List<String> sorts = const [],
      String? orderBy,
      Map<String, dynamic>? paginate}) {
    _filters = StrapiFilter.params(filters: filters ?? {});
    _locale = locale;
    _publicationState = publicationState;
    _fields = fields ?? [];
    _populates = populates ?? [];
    _sorts = sorts;
    _paginate = paginate;
  }

  StrapiQuery.json(Map<String, dynamic> json) {
    _makeQueryFromJson(json);
    _alreadyQuery = true;
  }

  StrapiQuery.query(String query) {
    _query = query;
    _alreadyQuery = true;
  }

  // attributes

  String _query = '';

  bool _alreadyQuery = false;
  StrapiFilter? _filters;
  String? _locale;
  StrapiPublicationState _publicationState = StrapiPublicationState.none;
  List<String> _fields = [];
  List<dynamic> _populates = [];
  List<String> _sorts = [];
  Map<String, dynamic>? _paginate;

  // getters
  StrapiFilter? get filters => _filters;

  String get locale => _locale ?? '';

  StrapiPublicationState get publicationState => _publicationState;

  List<String> get fields => _fields;

  List<dynamic> get populates => _populates;

  List<String> get sorts => _sorts;

  Map<String, dynamic> get paginate => _paginate ?? {};

  //methods
  void filterWith(StrapiFilter filter) {
    _filters = filter;
  }

  void ofLocale(String? locale) {
    _locale = locale;
  }

  void withPublicationState(StrapiPublicationState publicationState) {
    _publicationState = publicationState;
  }

  void select({List<String> fields = const [], bool all = false}) {
    if (all) {
      _fields = ['*'];
    } else {
      _fields = fields;
    }
  }

  void populate(dynamic populate) {
    if (populate != null) {
      if (populate is String || populate is Map) {
        _populates = [populate];
      }
      if (populate is List) {
        _populates = populate;
      }
    }
  }

  void sortBy(List<String> sorts) {
    _sorts = sorts;
  }

  void orderFieldBy(String field, String direction) {
    bool exist = false;

    for (int i = 0; i < _sorts.length; i++) {
      if (_sorts[i].contains(field)) {
        _sorts[i] =
            '${_sorts[i].replaceAll(':asc', '').replaceAll(':desc', '').trim()}:${direction.replaceAll(':', '')}';
        exist = true;
        break;
      }
    }

    if (!exist) {
      _sorts.add('$field:$direction');
    }
  }

  // paginate
  void paginateByPage({
    int page = 1,
    int pageSize = 25,
    bool withCount = true,
  }) {
    _paginate = {'page': page, 'pageSize': pageSize, 'withCount': withCount};
  }

  void paginateByOffset({
    int start = 0,
    int limit = 25,
    bool withCount = true,
  }) {
    _paginate = {'offset': start, 'limit': limit, 'withCount': withCount};
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> json = {};

    if (filters != null && filters!.filters.isNotEmpty) {
      json['filters'] = filters?.filters;
    }

    if (locale.isNotEmpty) {
      json['locale'] = locale;
    }

    if (publicationState != StrapiPublicationState.none) {
      json['publicationState'] =
          publicationState == StrapiPublicationState.live ? 'live' : 'preview';
    }

    if (_fields.isNotEmpty) {
      json['fields'] = _fields.contains('*') ? '*' : list2Map(_fields);
    }

    if (_populates.isNotEmpty) {
      json['populate'] = _populates.contains('*') ? '*' : list2Map(_populates);
    }

    if (_sorts.isNotEmpty) {
      json['sort'] = list2Map(_sorts);
    }

    if (paginate.isNotEmpty) {
      json['pagination'] = _paginate;
    }

    return json;
  }

  String toQueryParams() {
    if (!_alreadyQuery) {
      _query = QueryGenerator.objectToQueryString(toMap());
    }

    return _query;
  }

  void _makeQueryFromJson(dynamic json) {
    _query = QueryGenerator.objectToQueryString(json, sanitize: false);
    _alreadyQuery = true;
  }
}
