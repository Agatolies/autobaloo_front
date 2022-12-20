class StrapiImage {

  StrapiImage({
    required this.id,
    required this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    this.placeholder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StrapiImage.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];

    final inFormats = attributes.containsKey('formats')
        ? StrapiImageFormats.fromJson(attributes['formats'])
        : null;

    return StrapiImage(
      id: json['id'] as int,
      name: attributes['name'] as String,
      alternativeText: attributes['alternativeText'],
      caption: attributes['caption'],
      width: attributes['width'] as int,
      height: attributes['height'] as int,
      formats: inFormats,
      hash: attributes['hash'],
      ext: attributes['ext'],
      mime: attributes['mime'],
      size: double.tryParse(attributes['size'].toString()) ?? 0,
      url: attributes['url'],
      previewUrl: attributes['previewUrl'],
      provider: attributes['provider'],
      providerMetadata: attributes['provider_metadata'],
      createdAt: DateTime.parse(attributes['createdAt']),
      updatedAt: DateTime.parse(attributes['updatedAt']),
      placeholder: attributes.containsKey('placeholder')
          ? attributes['placeholder']
          : null,
    );
  }
  final int id;
  final String name;
  final String? alternativeText;
  final String? caption;
  final int width;
  final int height;
  final StrapiImageFormats? formats;
  final String hash;
  final String ext;
  final String mime;
  final num size;
  final String url;
  final String? previewUrl;
  final String provider;
  final dynamic providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? placeholder;
}

class StrapiImageFormats {
  StrapiImageFormats(
      {required this.thumbnail,
      required this.large,
      required this.medium,
      required this.small});

  factory StrapiImageFormats.fromJson(Map<String, dynamic> json) {
    final thumbnail = StrapiImageFormatItem.fromJson(json['thumbnail']);

    final large = json.containsKey('large')
        ? StrapiImageFormatItem.fromJson(json['large'])
        : null;

    final medium = json.containsKey('medium')
        ? StrapiImageFormatItem.fromJson(json['medium'])
        : null;

    final small = json.containsKey('small')
        ? StrapiImageFormatItem.fromJson(json['small'])
        : null;

    return StrapiImageFormats(
      thumbnail: thumbnail,
      large: large,
      medium: medium,
      small: small,
    );
  }

  final StrapiImageFormatItem thumbnail;
  final StrapiImageFormatItem? large;
  final StrapiImageFormatItem? medium;
  final StrapiImageFormatItem? small;
}

class StrapiImageFormatItem {
  StrapiImageFormatItem(
      {required this.name,
      required this.hash,
      required this.ext,
      required this.mime,
      required this.path,
      required this.width,
      required this.height,
      required this.size,
      required this.url});

  factory StrapiImageFormatItem.fromJson(Map<String, dynamic> json) {
    return StrapiImageFormatItem(
      name: json['name'] as String,
      hash: json['hash'] as String,
      ext: json['ext'] as String,
      mime: json['mime'] as String,
      path: json['path'] as String?,
      width: json['width'] as int,
      height: json['height'] as int,
      size: double.tryParse(json['size'].toString()) ?? 0,
      url: json['url'] as String,
    );
  }
  final String name;
  final String hash;
  final String ext;
  final String mime;
  final String? path;
  final int width;
  final int height;
  final double size;
  final String url;
}
