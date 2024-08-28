class OperationTimeoutException implements Exception {
  final String errorMessage;
  const OperationTimeoutException(this.errorMessage);
}