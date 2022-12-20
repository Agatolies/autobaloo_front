Map<dynamic, dynamic> list2Map(List<dynamic> list) {
  final Map<dynamic, dynamic> result = {};

  if (list.isNotEmpty) {
    for (int i = 0; i < list.length; i++) {
      result[i.toString()] = list[i] is List ? list2Map(list[i]) : list[i];
    }
  }

  return result;
}
