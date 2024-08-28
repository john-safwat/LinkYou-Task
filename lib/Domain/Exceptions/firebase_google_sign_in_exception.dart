class FirebaseGoogleSignInException implements Exception {
  final String errorCode;
  const FirebaseGoogleSignInException(this.errorCode);
}