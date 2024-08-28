FirebaseAuthExceptionHandler injectFirebaseAuthExceptionHandler() {
  return FirebaseAuthExceptionHandler.getInstance();
}

class FirebaseAuthExceptionHandler {
  FirebaseAuthExceptionHandler._();

  static FirebaseAuthExceptionHandler? instance;

  static getInstance() {
    return instance ??= FirebaseAuthExceptionHandler._();
  }

  String handleFirebaseAuthExceptionEnglish({required String error}) {
    switch (error) {
      case "error_invalid_email":
        error = "Invalid Email Address";
        break;
      case "error_too_many_requests":
        error = "To Many Requests";
        break;
      case "error_operation_not_allowed":
        error = "Cannot Create Account Now Try Again Later";
        break;
      case "email-already-in-use":
        error = "Email Already In Use";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
      case "invalid-credential":
        error = "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        error = "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        error = "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        error = "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        error = "Email address is invalid.";
        break;
      default:
        error = error.toString();
    }
    return error;
  }
}
