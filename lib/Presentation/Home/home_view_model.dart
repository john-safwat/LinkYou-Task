import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Base/base_view_model.dart';
import 'package:linkyou_task/Core/Error/dio_error_handler.dart';
import 'package:linkyou_task/Domain/Exceptions/bad_network_connection_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/dio_server_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/operation_timeout_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/unknown_exception.dart';
import 'package:linkyou_task/Domain/Models/MyUser.dart';
import 'package:linkyou_task/Domain/UseCase/get_users_list_use_case.dart';
import 'package:linkyou_task/Presentation/Home/home_navigator.dart';

class HomeViewModel  extends BaseViewModel<HomeNavigator>{

  final GetUsersListUseCase getUsersListUseCase;
  HomeViewModel(this.getUsersListUseCase);
  ScrollController controller = ScrollController();

  int pageNumber = 1;
  int totalPageNumbers = 1;
  List<MyUser> users =[];
  String? errorMessage;

  loadData()async{
    if(pageNumber<=totalPageNumbers){
      errorMessage = null;
      try {
        var response = await getUsersListUseCase.invoke(pageNumber);
        users.addAll(response.$1);
        totalPageNumbers = response.$2;
        pageNumber++;
      } catch (e) {
        if (e is DioServerException){
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
      }finally{
        notifyListeners();
      }
    }
  }

}