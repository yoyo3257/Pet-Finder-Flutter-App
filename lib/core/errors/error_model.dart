class ErrorModel {
  final String errorMessage;

  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic>? jsonData) {
    if (jsonData == null) {
      return ErrorModel(errorMessage: 'No error data received');
    }
    return ErrorModel(
      errorMessage: jsonData['message'] ?? 'Unknown error occurred',
    );
  }

  @override
  String toString() => errorMessage;
}
