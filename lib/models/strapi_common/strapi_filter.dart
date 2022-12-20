import 'dart:convert' show json;

import 'package:autobaloo/helper/utils/functions.dart';
import 'package:autobaloo/helper/utils/query_generator.dart';

extension Operation on Map<String, dynamic> {
  void insertOperation(String key, String operation, dynamic value) {
    if (this[key] == null) {
      this[key] = <Object>{};
    }

    this[key][operation] = value;
  }
}

class StrapiFilter {
  StrapiFilter() {
    _filters = {};
  }

  StrapiFilter.instance() {
    _filters = const {};
  }

  StrapiFilter.params({Map<String, dynamic> filters = const {}}) {
    _filters = filters;
  }

  StrapiFilter.query(String query) {
    _query = query;
  }

  late Map<String, dynamic> _filters;
  String _query = '';

  Map<String, dynamic> get filters => _filters;

  String get query => _query;

  // $eq	| Equal
  void whereEq(String field, dynamic value) {
    _filters.insertOperation(field, r'$eq', value);
  }

  // $eqi	Equal (case-insensitive)
  void whereNotEqExactly(String field, dynamic value) {
    _filters.insertOperation(field, r'$eqi', value);
  }

  // $ne	Not equal
  void whereNotEq(String field, dynamic value) {
    _filters.insertOperation(field, r'$ne', value);
  }

  // $lt	Less than
  void whereLessThan(String field, dynamic value) {
    _filters.insertOperation(field, r'$lt', value);
  }

  // $lte	Less than or equal to
  void whereLessThanOrEqualTo(String field, dynamic value) {
    _filters.insertOperation(field, r'$lte', value);
  }

  // $gt	Greater than
  void whereGreaterThan(String field, dynamic value) {
    _filters.insertOperation(field, r'$gt', value);
  }

  // $gte	Greater than or equal to
  void whereGreaterThanOrEqualTo(String field, dynamic value) {
    _filters.insertOperation(field, r'$gte', value);
  }

  // $in	Included in an array
  void whereIn(String field, List<dynamic> values) {
    assert(values.isNotEmpty);
    _filters.insertOperation(field, r'$in', list2Map(values));
  }

  // $notIn	Not included in an array
  void whereNotIn(String field, List<dynamic> values) {
    assert(values.isNotEmpty);
    _filters.insertOperation(field, r'$notIn', list2Map(values));
  }

  // $contains	Contains
  void whereContains(String field, dynamic value) {
    _filters.insertOperation(field, r'$contains', value);
  }

//  $notContains	Does not contain
  void whereNotContains(String field, dynamic value) {
    _filters.insertOperation(field, r'$notContains', value);
  }

  // $contains	Contains (case-insensitive)
  void whereContainsExactly(String field, dynamic value) {
    _filters.insertOperation(field, r'$containsi', value);
  }

  // $notContains	Does not contain (case-insensitive)
  void whereNotContainsExactly(String field, dynamic value) {
    _filters.insertOperation(field, r'$notContainsi', value);
  }

  // $null	Is null
  void whereNull(String field) {
    _filters.insertOperation(field, r'$null', null);
  }

  // $notNull	Is not null
  void whereNotNull(String field) {
    _filters.insertOperation(field, r'$notNull', null);
  }

  // $between	Is between
  void whereBetween(String field, List<dynamic> values) {
    assert(values.length == 2);
    _filters.insertOperation(field, r'$between', list2Map(values));
  }

  // $startsWith	Starts with
  void whereStartsWith(String field, dynamic value) {
    _filters.insertOperation(field, r'$startsWith', value);
  }

  // $endsWith	Ends with
  void whereEndsWith(String field, dynamic value) {
    _filters.insertOperation(field, r'$endsWith', value);
  }

  void where(
      {required String field, required dynamic value, required String op}) {
    _filters.insertOperation(field, op, value);
  }

  // $or	Joins the filters in an "or" expression
  void orWithFilter(StrapiFilter filter) {
    _filters[r'$or'] = filter._filters;
  }

  // $and	Joins the filters in an "and" expression
  void andWithFilter(StrapiFilter filter) {
    _filters[r'$and'] = filter._filters;
  }

  String toJson() {
    return json.encode(_filters);
  }

  String toQueryParams() {
    return QueryGenerator.objectToQueryString({'filters': _filters});
  }
}
