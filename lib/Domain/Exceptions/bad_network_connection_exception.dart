class BadNetworkConnectionException implements Exception {
  final String errorMessage;
  const BadNetworkConnectionException(this.errorMessage);
}