class StrapiDocument<T> {
  StrapiDocument({
    required this.id,
    required this.attributes,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.locale,
    required this.model,
  });

  factory StrapiDocument.fromJson(Map<String, dynamic> json,
          T Function(Map<String, dynamic> json) converter) {
    return StrapiDocument(
        id: json['id'],
        attributes: json['attributes'],
        createdAt: DateTime.parse(json['attributes']['createdAt']),
        updatedAt: DateTime.parse(json['attributes']['updatedAt']),
        publishedAt: DateTime.parse(json['attributes']['publishedAt']),
        locale: json['attributes'].containsKey('locale')
            ? json['attributes']['locale']
            : null,
        model: converter(json),
      );
  }

  final int id;
  final Map<String, dynamic> attributes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? locale;
  final T? model;

  Map<String, dynamic> toJson() => {
        'id': id,
        'attributes': attributes,
      };
}
