class StrapiError {
  StrapiError({
    required this.status,
    required this.name,
    required this.message,
    required this.details,
  });

  factory StrapiError.fromJson(Map<String, dynamic> json) => StrapiError(
        status: json['status'],
        name: json['name'],
        message: json['message'],
        details: json['details'] ?? {},
      );

  StrapiError.fromClient(
      {int status = 400,
      String name = 'general',
      String message = 'Something went wrong',
      Map<String, dynamic> details = const {}})
      : this(
          status: status,
          name: name,
          message: message,
          details: details,
        );

  final int status;
  final String name;
  final String message;
  final Map<String, dynamic> details;

  Map<String, Object> toJson() {
    return {
      'status': status,
      'name': name,
      'message': message,
      'details': details,
    };
  }
}
