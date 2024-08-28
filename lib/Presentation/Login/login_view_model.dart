import 'package:linkyou_task/Core/Base/base_view_model.dart';
import 'package:linkyou_task/Core/Error/dio_error_handler.dart';
import 'package:linkyou_task/Core/Error/firebase_auth_exception_handler.dart';
import 'package:linkyou_task/Domain/Exceptions/bad_network_connection_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/dio_server_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/firebase_google_sign_in_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/operation_timeout_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/unknown_exception.dart';
import 'package:linkyou_task/Domain/UseCase/sign_in_with_google_use_case.dart';
import 'package:linkyou_task/Presentation/Login/login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  SignInWithGoogleUseCase signInWithGoogleUseCase;

  LoginViewModel(this.signInWithGoogleUseCase);

  login() async {
    navigator?.showLoading(message: "Logging You in...");
    try {
      var response = await signInWithGoogleUseCase.invoke();
      navigator?.hideDialog();
      navigator?.showSuccessDialog(
          message: "Logged in Successfully\nYour id is $response" , posActionTitle: "Ok" , posAction: navigator!.navigateToHomeScreen);
    } catch (e) {
      String errorMessage = "";
      if (e is FirebaseGoogleSignInException) {
        errorMessage = injectFirebaseAuthExceptionHandler()
            .handleFirebaseAuthExceptionEnglish(error: e.errorCode);
      }else if (e is DioServerException){
        errorMessage = injectDioErrorHandler().dioExceptionHandlerEnglish(e.errorMessage);
      }else if (e is OperationTimeoutException){
        errorMessage = e.errorMessage;
      }else if  (e is BadNetworkConnectionException){
        errorMessage = e.errorMessage;
      }else if (e is UnknownException){
        errorMessage = e.errorMessage;
      }else {
        errorMessage = e.toString();
      }
      navigator?.hideDialog();
      navigator?.showFailDialog(message: errorMessage , posActionTitle: "Try Again");
    }
  }
}
