class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final String? responseBody;

  ApiException({
    required this.message,
    this.statusCode,
    this.responseBody,
  });

  @override
  String toString() {
    return 'ApiException: $message ${statusCode != null ? '(Status $statusCode)' : ''}';
  }
}